import { JSDOM } from "jsdom"

const Node = new JSDOM().window.Node

const DOCUMENT_TYPE_NODE = '#documentType'
const TEXT_NODE = '#text'
const DIV_NODE = 'div'
const COMMENT_NODE = '#comment'
const COMMENT_NODE_PUG = '//'

const hasSingleTextNodeChild = node => {
  return (
    node.childNodes &&
    node.childNodes.length === 1 &&
    node.childNodes[0].nodeName === TEXT_NODE
  )
}
type options = {
  indentStyle: '\t' | '  '
  separatorStyle: ', ' | ' '
  quoteStyle: '"' | "'"
  inlineCollapse: boolean // Using tag interpolation on inline elements or not
  removeAttributes: boolean
}


class Parser {
  pug: string = ''
  root: Node
  options: options
  level: number = 0
  inline_elements = ['a', 'em', 'strong']


  // Helpers
  public get indent(): string { return this.options.indentStyle.repeat(this.level) }

  has_only_inline_elements(element: Element) { return element.querySelector(`*:not(${this.inline_elements.join()})`) == null }
  // ------------------------
  constructor(root: Node, options: options) {
    this.root = root
    this.options = options
  }

  // TODO: Delete
  getIndent(level = 0): string {
    return this.options.indentStyle.repeat(level)
  }


  parse() {
    this.conv(this.root)
    return this.pug.substring(1)
  }


  convert(node: Node, level: number): string {
    switch (node.nodeType) {
      // case Node.DOCUMENT_NODE:
      //   return this.createDoctype(node, level)

      // case Node.COMMENT_NODE:
      //   return this.createComment(node, level)
      case Node.TEXT_NODE:
        return this.createText(node, level)
      default:
        return this.createElement(node as Element, level)
    }
    return ""
  }

  // conv(tree: NodeListOf<ChildNode>) {
  //   if (!tree) { return }
  //   for (let i = 0; i < tree.length; i++) {
  //     const node = tree[i]

  //     const newline = this.parseNode(node, this.level)
  //     if (newline) this.pug += `\n${newline}`

  //     if (
  //       node.childNodes &&
  //       node.childNodes.length > 0 &&
  //       !hasSingleTextNodeChild(node)
  //     ) { this.level++; this.conv(node.childNodes) }
  //   }
  // }
  conv(tree: Node) {
    if (!tree) { return }

    let result = this.convert_html_element_open_tag(tree as Element)
    let inline_buffer = []
    const flush_inline_buffer = () => { if (inline_buffer.length != 0) { this.pug += ` ${inline_buffer.join(' ')}`; inline_buffer = [] } }
    const childrens = tree.childNodes

    for (let i = 0; i < childrens.length; i++) {
      const node = childrens[i]
      switch (node.nodeType) {
        case Node.TEXT_NODE: inline_buffer.push(node.nodeValue.trim()); break
        case Node.ELEMENT_NODE:
          if (this.inline_elements.includes(node.nodeName.toLowerCase()))
            inline_buffer.push(`#[${this.parseNode(node, 0).trim()}]`)
          else {
            flush_inline_buffer()
            const pugNode = this.convert_html_element_open_tag(node)
            const newline = this.parseNode(node, this.level)
            if (newline) this.pug += `\n${newline}`
          }

          break;

        default:
          break;
      }

      if (
        node.childNodes &&
        node.childNodes.length > 0 &&
        !hasSingleTextNodeChild(node)
      ) { this.level++; this.conv(node) }
    }
    flush_inline_buffer()
  }
  convert_node(node: Node): string {
    return ""
  }
  /*
   * Returns a Pug node name with all attributes set in parentheses.
   */
  convert_attributes(attributes: NamedNodeMap): string {
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
      if (attributes.length) result += '(' + buffer.join(this.options.separatorStyle) + ')'
      return result
    }
  }
  convert_html_element_open_tag(node: Element): string {
    const { tagName, attributes } = node
    let pugNode = ""

    const is_true = val => val == true
    const has_selector = ['id', 'class'].map(attr_name => node.hasAttribute(attr_name)).some(is_true);

    {
      const has_shorhand = (tagName === DIV_NODE) && has_selector // Shorhand for div if a selector is present e.g. div#form() -> #form()
      if (has_shorhand == false) pugNode = tagName // Don't add div tag if shorhand present
    }
    {
      const has_attributes = has_selector == true || attributes.length != 0
      if (has_attributes) pugNode += this.convert_attributes(node.attributes)
    }

    return pugNode
  }

  /**
   * formatPugNode applies the correct indent for the current line,
   * and formats the value as either as a single or multiline string.
   *
   * @param {String} node - The pug node (e.g. header(class='foo'))
   * @param {String} value - The node's value
   * @param {Number} level - Current tree level to generate indent
   * @param {String} blockChar - The character used to denote a multiline value
   */
  formatPugNode(node: string, value: string = '', level: number, blockChar = '.') {
    const indent = this.getIndent(level)
    const result = `${indent}${node}`

    const lines = value.split('\n')

    // Create an inline node
    if (lines.length <= 1) {
      return value.length ? `${result} ${value}` : result
    }

    // Create a multiline node
    const indentChild = this.getIndent(level + 1)
    const multiline = lines.map(line => `${indentChild}${line}`).join('\n')

    return `${result}${blockChar}\n${multiline}`
  }

  /**
   * createDoctype formats a #documentType element
   */
  createDoctype(node, level) {
    const indent = this.getIndent(level)
    return `${indent}doctype html`
  }

  /**
   * createComment formats a #comment element.
   *
   * Block comments in Pug don't require the dot '.' character.
   */
  createComment(node, level) {
    return this.formatPugNode(COMMENT_NODE_PUG, node.data, level, '')
  }

  /**
   * createText formats a #text element.
   *
   * A #text element containing only line breaks (\n) indicates
   * unnecessary whitespace between elements that should be removed.
   *
   * Actual text in a single #text element has no significant
   * whitespace and should be treated as inline text.
   */
  createText(node: Node, level: number): string {
    const value = node.nodeValue
    const indent = this.getIndent(level)

    let result = ""

    { // Omit line breaks between HTML elements
      const is_line_break = /^[\n]+$/.test(value)
      if (is_line_break == false) result = `${indent}| ${value}`
    }

    return result
  }

  /**
   * createElement formats a generic HTML element.
   */
  createElement(node: Element, level: number) {
    const pugNode = this.convert_html_element_open_tag(node)

    const value = hasSingleTextNodeChild(node)
      ? node.childNodes[0].nodeValue
      : node.nodeValue

    return this.formatPugNode(pugNode, value || "", level)
  }

  my_parseNode(node: Node, level: number) {
    const { nodeName } = node

    switch (nodeName) {
      case DOCUMENT_TYPE_NODE: return this.createDoctype(node, level)
      case COMMENT_NODE: return this.createComment(node, level)
      case TEXT_NODE: return this.createText(node, level)
      default: return this.createElement(node as Element, level)
    }
  }
  parseNode(node: Node, level: number) {
    const { nodeName } = node

    switch (nodeName) {
      case DOCUMENT_TYPE_NODE: return this.createDoctype(node, level)
      case COMMENT_NODE: return this.createComment(node, level)
      case TEXT_NODE: return this.createText(node, level)
      default: return this.createElement(node as Element, level)
    }
  }
}

export default Parser