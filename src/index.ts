import { minify } from 'html-minifier'
import { JSDOM } from "jsdom"
import Pugify from './parser.js'
import processHTML from "./process_html.js"

const defaultOptions = {
  // html2pug options
  fragment: false,
  tabs: false,
  commas: true,
  doubleQuotes: false,
  inlineCollapse: true,
  keep_attr: true,
  clean: true,
  simple: false,
}

function clean(DOM: JSDOM) {
  const body = DOM.window.document.body
  let target: Document | DocumentFragment
  let buffer = body.getElementsByTagName('main')
  if (buffer.length != 0) {
    target = DOM.window.document.createDocumentFragment()
    target.append(buffer[0])
  }

}
export default (sourceHtml, options = {}) => {
  const opts = { ...defaultOptions, ...options }

  const html = minify(sourceHtml, {
    caseSensitive: true,
    removeEmptyAttributes: true,
    collapseWhitespace: true,
    collapseBooleanAttributes: true,
    preserveLineBreaks: false
  })

  const { fragment, tabs, commas, doubleQuotes, inlineCollapse, keep_attr, clean, simple } = opts

  const dom = new JSDOM(html)
  const document = dom.window.document
  let root: Document | DocumentFragment = document

  if (clean) root = processHTML(document)

  const pugify = new Pugify(root, {
    indentStyle: tabs ? '\t' : '  ',
    separatorStyle: commas ? ', ' : ' ',
    quoteStyle: doubleQuotes ? '"' : "'",
    inlineCollapse,
    removeAttributes: !keep_attr,
    simple
  })
  return pugify.parse()
}
