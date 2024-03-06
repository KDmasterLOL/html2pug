import { minify } from 'html-minifier'
import { JSDOM } from "jsdom"
import Pugify from './parser.js'

export type Options = {
  fragment: boolean,
  tabs: boolean,
  commas: boolean,
  doubleQuotes: boolean,
  simple: boolean,
}

export function html2pug(sourceHtml, options: Options) {
  const html = minify(sourceHtml, {
    caseSensitive: true,
    removeEmptyAttributes: true,
    collapseWhitespace: true,
    collapseBooleanAttributes: true,
    preserveLineBreaks: false
  })

  const { fragment, tabs, commas, doubleQuotes, simple } = options

  const dom = new JSDOM(html)
  const document = dom.window.document
  let root: Document | DocumentFragment = document


  const pugify = new Pugify(root, {
    indentStyle: tabs ? '\t' : '  ',
    separatorStyle: commas ? ', ' : ' ',
    quoteStyle: doubleQuotes ? '"' : "'",
    simple
  })
  return pugify.parse()
}
