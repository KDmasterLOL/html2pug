import { JSDOM } from 'jsdom'
import html2pug from './dist/index.js'

// const test_html = `<!DOCTYPE html>
// <html lang="en">
//   <head></head>
// 	<body>
// 	<p>Text inside body</p>
// 	</body>
// </html>
// `
const test_html = `<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<main>
		<h1>Main <strong>text</strong></h1>
		<p class="a1 a2 a3" data-a="dsd">Paragtahp text <strong>asdf</strong> <a href="https://example.com">Some link</a></p>
		<p class="b1 b2 b3">Paragtahp with secondary text <strong>asdf</strong> <a href="https://example.com">Some secondary link</a></p>	
		<script>
			console.log('aa')
		</script>
	</main>
</body>
</html>`
const test_fragment = `string of text node`

const DOM = new JSDOM(test_html)

const document = DOM.window.document

let f = document.createDocumentFragment()
let main = document.getElementsByTagName('main')[0]
let p = document.querySelector('p')
f.append(main);
{
	const elements = [...main.children].reduce((arr, el) => (arr += ` ${el.tagName} `), "")
	console.log(elements)
}

function* walk(tree, level) {
	if (!tree) {
		return
	}

	for (let i = 0; i < tree.length; i++) {
		const node = tree[i]

		const newline = node.nodeName
		if (newline) {
			console.log(`${level}: ${newline}`);
		}
		yield* walk(node.childNodes, level + 1)
	}
}

const walki = walk(main.childNodes)
let it

// do {
// 	it = walki.next()
// 	console.log(it.value);
// } while (!it.done)
// console.log(walki.next(), walki.next())

// main.childNodes.forEach(element => {
// 	console.log(element.nodeName);
// });

let a = JSDOM.fragment('<p>AAA</p>')
a.append("String of text")
a.childNodes.forEach(el => console.log(el, el.nodeName, el.nodeValue))
const Node = DOM.window.Node
console.log(a.nodeType, Node.DOCUMENT_FRAGMENT_NODE, a.firstChild.outerHTML);

const res = html2pug('<p> AAA <em>adf<strong>AA</strong></em> </p>')
console.log(res)
