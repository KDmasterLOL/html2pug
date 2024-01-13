import { minify } from 'html-minifier';
import { JSDOM } from "jsdom";
import Pugify from './parser.js';
const defaultOptions = {
    // html2pug options
    fragment: false,
    tabs: false,
    commas: true,
    doubleQuotes: false,
    inlineCollapse: true,
    keep_attr: true,
    clean: true,
    // html-minifier options
    caseSensitive: true,
    removeEmptyAttributes: true,
    collapseWhitespace: true,
    collapseBooleanAttributes: true,
    preserveLineBreaks: true,
};
function clean(DOM) {
    const body = DOM.window.document.body;
    let target;
    let buffer = body.getElementsByTagName('main');
    if (buffer.length != 0) {
        target = DOM.window.document.createDocumentFragment();
        target.append(buffer[0]);
    }
}
export default (sourceHtml, options = {}) => {
    // Minify source HTML
    const opts = { ...defaultOptions, ...options };
    const html = minify(sourceHtml, opts);
    const { fragment, tabs, commas, doubleQuotes, inlineCollapse, keep_attr, clean } = opts;
    const dom = new JSDOM(html);
    if (clean) {
        // clean(dom)
    }
    const pugify = new Pugify(dom.window.document.body, {
        indentStyle: tabs ? '\t' : '  ',
        separatorStyle: commas ? ', ' : ' ',
        quoteStyle: doubleQuotes ? '"' : "'",
        inlineCollapse,
        removeAttributes: !keep_attr
    });
    return pugify.parse();
};
