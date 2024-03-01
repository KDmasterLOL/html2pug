import { JSDOM } from 'jsdom'

function escape(str: string) {
  const REPLACEMENTS = { '<': '&lt;', '>': '&gt;' }
  for (const [k, v] of Object.entries(REPLACEMENTS)) str = str.replace(new RegExp(k, 'g'), v)
  return str
}

const clear = {
  text_content(element: Element) { element.innerHTML = escape(element.textContent) },
  attributes(element: Element) {
    const attributes = Array.from(element.attributes)
    for (let attr of attributes) {
      if ((element.tagName == "a" && attr.name == "href")
        ||
        (['img', 'embed'].includes(element.tagName) && attr.name == "src")) continue
      element.removeAttribute(attr.name)
    }
  }
}

function is_empty(node: Node) { return /^\s*$/.test(node.textContent) }

export default function(document: Document): DocumentFragment {
  const result = document.createDocumentFragment()
  const body = document.body
  result.appendChild(body.querySelector("main, #main, [role=main]") || body)

  const elements = result.querySelectorAll('*')
  for (let index = 0; index < elements.length; index++) {
    const element = elements[index];
    if (is_empty(element)) element.remove()

    clear.attributes(element)
    switch (element.tagName.toLowerCase()) {
      case "code": clear.text_content(element); break;
    }
  }
  return result
}
