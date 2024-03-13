import { JSDOM } from "jsdom"


const Node = new JSDOM().window.Node

enum Flags {
  None = 0,
  PreWrap = 1 << 0,
  Interpolate = 1 << 1,
  SingleChild = 1 << 2,
  FirstChild = 1 << 3,
  ParentTextBlock = 1 << 4,
  TextBlock = 1 << 5,
  BlockExpansion = 1 << 6,
  HasNewLines = 1 << 7,
}
interface FlagHanger {
  hang_flags(entry: tree_value, previous_child: tree_value): Flags
}
function has_flag(source: Flags, target: Flags): boolean { return (source & target) == target }
function has_any_flag(source: Flags, target: Flags) { return (source & target) != 0 }

type tree_value = { node: Node, child_index: number, flags: Flags }

type options = {
  indentStyle: '\t' | '  '
  separatorStyle: ', ' | ' '
  quoteStyle: '"' | "'"
  simple: boolean
}


class PugSerializer {
  pug: string = ''
  inline_elements: string = "a, b, i, em , strong, code, span"
  converter: Converter

  constructor(private root: Node, options: options) {
    this.converter = new Converter(options)
  }


  parse() {
    this.serialize(this.root).substring(1)
  }

  private can_interpolate(node: Node, parent_flags: Flags, previous_child: tree_value | undefined): boolean {
    if (parent_flags & Flags.Interpolate) return true
    switch (node.nodeType) {
      case Node.TEXT_NODE:
        return previous_child == undefined || previous_child.node.nodeType == Node.TEXT_NODE || (previous_child.flags & Flags.Interpolate) != 0
      case Node.ELEMENT_NODE:
        const element = node as HTMLElement

        const is_inline_element = element.matches(this.inline_elements)
        const has_only_inline_elements = element.querySelector(`*:not(${this.inline_elements})`) == null
        return is_inline_element && has_only_inline_elements
    }
    return false

  }
  private can_make_text_block(node: Node, flags: Flags): boolean {
    if (node.nodeType != Node.TEXT_NODE) return false
    const has_element_with_many_lines = Array.from(node.childNodes).some((v) => v.nodeType != Node.TEXT_NODE && v.textContent.includes('\n'))
    return has_flag(flags, Flags.PreWrap | Flags.FirstChild) &&
      (node.nodeValue.includes('\n') || has_flag(flags, Flags.SingleChild) == false) &&
      has_element_with_many_lines == false
  }
  private can_make_parent_text_block(element: HTMLElement, flags: Flags): boolean {
    if (has_flag(flags, Flags.PreWrap) == false || has_flag(flags, Flags.TextBlock)) return false
    for (const child of element.children)
      if (child.textContent.includes('\n') || child.matches(this.inline_elements) == false) return false

    return true
  }
  private can_block_expansion(node: Node) { return node.childNodes.length == 1 && node.childNodes[0].nodeType == Node.ELEMENT_NODE }

  private hang_flags({ node: parent_node, flags: parent_flags, child_index }: tree_value, previous_child: tree_value): Flags { // Get parent node and previous child of node
    let new_flags = Flags.None

    if (child_index == 0) new_flags |= Flags.FirstChild
    if (parent_node.childNodes.length == 1) new_flags |= Flags.SingleChild
    if ((parent_flags & Flags.PreWrap) || (parent_node.nodeName.toLowerCase() == "pre")) new_flags |= Flags.PreWrap
    if (has_any_flag(parent_flags, Flags.ParentTextBlock | Flags.TextBlock)) new_flags |= Flags.TextBlock

    const child_node = parent_node.childNodes[child_index]
    if (child_node.textContent.includes('\n')) new_flags |= Flags.HasNewLines

    if (child_node.nodeType == Node.ELEMENT_NODE) {
      const element = child_node as HTMLElement
      if (this.can_make_parent_text_block(element, new_flags)) new_flags |= Flags.ParentTextBlock
      if (this.can_block_expansion(parent_node)) new_flags |= Flags.BlockExpansion
    }

    if (has_any_flag(new_flags, Flags.BlockExpansion | Flags.ParentTextBlock | Flags.HasNewLines) == false &&
      this.can_interpolate(child_node, parent_flags, previous_child)) new_flags |= Flags.Interpolate
    return new_flags
  }



  // simple_node_convert(node: Node, level: number = 0) { // TODO: Merge simple_node_convert with convert tree
  //   const add = (str: string) => this.pug += '\n' + this.getIndent(level) + str
  //   switch (node.nodeType) {
  //     case Node.TEXT_NODE: add('| ' + node.nodeValue); break
  //     case Node.DOCUMENT_FRAGMENT_NODE: node.childNodes.forEach(n => this.simple_node_convert(n, level)); break
  //     case Node.ELEMENT_NODE: add(node.nodeName.toLowerCase())
  //     default: node.childNodes.forEach(n => this.simple_node_convert(n, level + 1))
  //   }
  // }

  serialize(tree: Node) {
    let result = ""

    const can_continue = ({ node, flags, child_index }: tree_value) => {
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

      if (can_continue(last_stack_entry) == false) { previous_child = tree_stack.pop(); continue }

      if (last_stack_entry.child_index == 0) previous_child = undefined

      const child = last_stack_entry.node.childNodes[last_stack_entry.child_index],
        level = tree_stack.length

      const child_entry = create_entry(child, this.hang_flags(last_stack_entry, previous_child))
      const { value, prefix } = this.converter.convert_node(child_entry, last_stack_entry, level)

      tree_stack.push(child_entry)

      result += prefix + value
      last_stack_entry.child_index += 1

    }
    return result
  }

}

class ComplexFlagHanger implements FlagHanger {

}

class Converter {

  constructor(private options: options) { }
  private getIndent(level = 0): string { return this.options.indentStyle.repeat(level) }

  convert_node(child_entry: tree_value, parent_entry: tree_value, level: number): { value: string, prefix: string } {
    switch (child_entry.node.nodeType) {
      case Node.TEXT_NODE: return this.convert_text_node(child_entry, parent_entry, level)
      case Node.ELEMENT_NODE: return this.convert_element_node(child_entry, level)
      // case Node.COMMENT_NODE: return this.convert
      default: throw new Error("Unimplemented for node of type " + child_entry.node.nodeType)
    }
  }
  private convert_comment_node(
    { node, flags }: tree_value,
    level: number
  ): { value: string, prefix: string } {
    return { value: node.nodeValue, prefix: "" }
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

    let value = node.nodeValue
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
          const quote = this.options.quoteStyle
          buffer.push(val ? `${name}=${quote}${val}${quote}` : name)
          break
        }
      }
      if (buffer.length != 0) result += '(' + buffer.join(this.options.separatorStyle) + ')'
      return result
    }
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
