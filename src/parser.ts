import { JSDOM } from "jsdom"
import { Flags, type FlagHanger, ComplexFlagHanger, SimpleFlagHanger, has_flag, has_any_flag } from "./FlagHanger.js"


export const Node = new JSDOM().window.Node

export type tree_value = { node: Node, child_index: number, flags: Flags }

type options = {
  indentStyle: '\t' | '  '
  separatorStyle: ', ' | ' '
  quote_style: '"' | "'"
  simple: boolean
  inline_elements: string
}


class PugSerializer {
  pug: string = ''
  converter: Converter
  flags_hanger: FlagHanger

  constructor(private root: Node, options: options) {
    if (options.simple) this.flags_hanger = new SimpleFlagHanger()
    else this.flags_hanger = new ComplexFlagHanger(options.inline_elements)
    this.converter = new Converter(options)
  }


  parse() {
    return this.serialize(this.root)
  }

  serialize(tree: Node) {
    let result = ""

    const has_next_child = ({ node, flags, child_index }: tree_value) => {
      if (node.nodeType == Node.TEXT_NODE) return false
      if (child_index >= node.childNodes.length) { // Is out of children
        if (flags & Flags.Interpolate) result += "]" // End interpolation
        return false
      }
      return true
    }
    const create_entry = (node: Node, flags = Flags.None): tree_value => ({ node, child_index: 0, flags })
    let tree_stack: tree_value[] = [create_entry(tree)],
      previous_child: tree_value | undefined = undefined
    while (tree_stack.length > 0) {
      const last_stack_entry = tree_stack[tree_stack.length - 1]

      if (has_next_child(last_stack_entry) == false) { previous_child = tree_stack.pop(); continue }

      if (last_stack_entry.child_index == 0) previous_child = undefined

      const child = last_stack_entry.node.childNodes[last_stack_entry.child_index],
        level = tree_stack.length - 1

      const child_entry = create_entry(child, this.flags_hanger.hang_flags(last_stack_entry, previous_child))
      const { value, prefix } = this.converter.convert_node(child_entry, last_stack_entry, level)

      tree_stack.push(child_entry)

      result += prefix + value
      last_stack_entry.child_index += 1
    }
    return result
  }

}


class Converter {
  constructor(private options: options) { }
  private getIndent(level = 0): string { return this.options.indentStyle.repeat(level) }

  convert_node(child_entry: tree_value, parent_entry: tree_value, level: number): { value: string, prefix: string } {
    switch (child_entry.node.nodeType) {
      case Node.TEXT_NODE: return this.convert_text_node(child_entry, parent_entry, level)
      case Node.ELEMENT_NODE: return this.convert_element_node(child_entry, level)
      case Node.COMMENT_NODE: return this.convert_comment_node(child_entry, level)
      case Node.DOCUMENT_TYPE_NODE: return this.convert_document_type_node()
      default: throw new Error("Unimplemented for node of type " + child_entry.node.nodeType)
    }
  }
  convert_document_type_node(): { value: string; prefix: string } {
    return { value: 'doctype html', prefix: '' }
  }
  private convert_comment_node(
    { node, flags }: tree_value,
    level: number
  ): { value: string, prefix: string } {
    return { value: '<!--' + node.nodeValue + '-->', prefix: has_flag(flags, Flags.Interpolate) ? '' : '\n' + this.getIndent(level) }
  }
  convert_element_node(
    { node, flags }: tree_value,
    level: number
  ): { value: string, prefix: string } {
    const element = node as HTMLElement
    let prefix = "\n" + this.getIndent(level),
      value = this.convert_html_element_open_tag(element)

    if (has_flag(flags, Flags.BlockExpansion)) prefix = ": "
    else if (has_flag(flags, Flags.Interpolate))
      prefix = (has_flag(flags, Flags.FirstChild) ? " " : "") + "#["

    if (has_flag(flags, Flags.ParentTextBlock)) value += '.\n' + this.getIndent(level + 1)

    return { value, prefix }
  }

  private convert_text_node(
    { node, flags }: tree_value,
    parent_entry: tree_value,
    level: number
  ): { value: string, prefix: string } {
    let prefix = '\n' + this.getIndent(level) + '| '

    if (has_any_flag(flags, Flags.Interpolate | Flags.TextBlock))
      prefix =
        (has_flag(parent_entry.flags, Flags.ParentTextBlock) == false
          &&
          has_flag(flags, Flags.FirstChild))
          ? ' ' : ''

    let value = node.nodeValue!
    if (has_flag(flags, Flags.TextBlock)) {
      value = value.replaceAll('\n', '\n' + this.getIndent(level))
    }
    else if (has_flag(flags, Flags.PreWrap)) value = value.replaceAll('\n', '\n' + this.getIndent(level) + '| ')
    return { value, prefix }
  }

  private convert_attributes(attributes: NamedNodeMap): string {
    let result = ""

    // Add CSS selectors to pug node and append any element attributes to it
    let buffer = []
    for (const { name, value } of attributes) {
      switch (name) {
        case 'id': result += `#${value}`; break
        case 'class': result += `.${value.split(' ').join('.')}`; break
        default: {
          const val = value.replace(/'/g, "\\'") // Escape single quotes (\') in attribute values
          const quote = this.options.quote_style
          buffer.push(val ? `${name}=${quote}${val}${quote}` : name)
          break
        }
      }
      if (buffer.length != 0) result += '(' + buffer.join(this.options.separatorStyle) + ')'
    }
    return result
  }
  private convert_html_element_open_tag(element: Element): string {
    const { tagName, attributes } = element
    let open_tag = tagName.toLowerCase()
    {
      const has_selector =
        ['id', 'class'].map(attr_name => element.hasAttribute(attr_name)).some(val => val == true)
      const has_shorhand = (tagName === 'div') && has_selector // Shorhand for div if a selector is present e.g. div#form() -> #form()
      if (has_shorhand) open_tag = "."
    }
    if (attributes.length != 0) open_tag += this.convert_attributes(element.attributes)

    return open_tag
  }
}

export default PugSerializer
