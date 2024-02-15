function escape(str) {
    const REPLACEMENTS = {
        '<': '&lt;',
        '>': '&gt;',
    };
    for (const [k, v] of Object.entries(REPLACEMENTS))
        str = str.replace(new RegExp(k, 'g'), v);
    return str;
}
function clear_codes(document) {
    let code_elements = document.querySelectorAll('code');
    for (let index = 0; index < code_elements.length; index++) {
        const code_element = code_elements[index];
        code_element.innerHTML = escape(code_element.textContent);
    }
}
export default function (document) {
    const result = document.createDocumentFragment();
    const body = document.body;
    result.appendChild(body.querySelector("main, #main, [role=main]") || body);
    clear_codes(result);
    return result;
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
//# sourceMappingURL=process_html.js.map