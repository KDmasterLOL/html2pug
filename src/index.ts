import { minify } from 'html-minifier'
import { JSDOM } from "jsdom"
import Pugify from './parser.js'

export type Options = {
  fragment: boolean,
  tabs: boolean,
  commas: boolean,
  doubleQuotes: boolean,
  simple: boolean,
  inline_elements: string
}

export function html2pug(sourceHtml, options: Options) {
  const html = minify(sourceHtml, {
    caseSensitive: true,
    removeEmptyAttributes: true,
    collapseWhitespace: true,
    collapseBooleanAttributes: true,
    preserveLineBreaks: false
  })

  const { fragment, tabs, commas, doubleQuotes, simple, inline_elements } = options

  const root = fragment ? JSDOM.fragment(html) : new JSDOM(html).window.document


  const pugify = new Pugify(root, {
    indentStyle: tabs ? '\t' : '  ',
    separatorStyle: commas ? ', ' : ' ',
    quote_style: doubleQuotes ? '"' : "'",
    simple,
    inline_elements
  })
  return pugify.parse()
}
