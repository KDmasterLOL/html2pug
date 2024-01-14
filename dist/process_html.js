export default function (document) {
    const frag = document.createDocumentFragment();
    frag.appendChild(document.body);
    return frag;
}
// function remove_attributes(element: HTMLElement) {
// 	[...element.attributes].forEach(
// 		attr => {
// 			if (
// 				(element.tagName == 'a' && attr.name == 'href') || // Save links
// 				(['img', 'svg'].includes(element.tagName) && attr.name == 'src') // Save media
// 			) return;
// 			element.removeAttribute(attr.name);
// 		})
// }
// function* walk(tree: NodeListOf<ChildNode>, level: number) {
// 	if (!tree) {
// 		return
// 	}
// 	for (let i = 0; i < tree.length; i++) {
// 		const node = tree[i]
// 		const newline = this.parseNode(node, level)
// 		if (newline) {
// 			this.pug += `\n${newline}`
// 		}
// 		yield* this.walk(node.childNodes, level + 1)
// 	}
// }
// function iter(params: type) {
// }
// export default function (html: string, clear: boolean = true): Document | DocumentFragment {
// 	const DOM = new JSDOM(html)
// 	const document = DOM.window.document
// 	if (clear == false) { return document }
// 	const result = document.createDocumentFragment()
// 	{
// 		let main = document.querySelector('main, #main, #fmain, #content')
// 		result.append(main)
// 	}
// 	let array = f.children[0]
// 	for (let index = 0; index < array.length; index++) {
// 		const element = array[index];
// 		console.log(element.tagName);
// 	}
// }
