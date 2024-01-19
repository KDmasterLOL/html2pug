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
// const test_html = `<div class="pane svelte-mwcui7"><section slot="a" class="content svelte-qkgzwg"><div class="container svelte-mgerx9 dark"><header class="svelte-mgerx9"><a class="prev-button svelte-mgerx9" href="/tutorial/updating-arrays-and-objects" aria-label="Previous"><svg class="icon svelte-5yec89" width="16" height="16"><use xlink:href="#arrow-left"></use></svg></a> <button class="heading svelte-mgerx9"><h1 class="svelte-mgerx9"><div class="mobile svelte-mgerx9"><div class="heading-row svelte-mgerx9"><strong class="svelte-mgerx9">Declaring props</strong></div> <div class="heading-row svelte-mgerx9"><span class="part-title svelte-mgerx9">Basic Svelte</span> <span class="separator svelte-mgerx9" data-svelte-h="svelte-1s3emed">/</span> <span class="chapter-title svelte-mgerx9">Props</span></div></div> <div class="desktop svelte-mgerx9"><span class="part-title svelte-mgerx9">Part 1</span><span class="separator svelte-mgerx9" data-svelte-h="svelte-1s3emed">/</span> <span class="chapter-title svelte-mgerx9">Props</span><span class="separator svelte-mgerx9" data-svelte-h="svelte-17rberu">/</span><strong class="svelte-mgerx9">Declaring props</strong></div> <span style="flex: 1 1 auto" class="svelte-mgerx9"></span></h1> <span class="expand-icon svelte-mgerx9"><svg class="icon svelte-5yec89" width="20" height="20"><use xlink:href="#chevron-down"></use></svg></span> </button> <a class="next-button svelte-mgerx9" href="/tutorial/default-values" aria-label="Next"><svg class="icon svelte-5yec89" width="16" height="16"><use xlink:href="#arrow-right"></use></svg></a></header></div> <section class="svelte-12fabrn"><div class="text svelte-12fabrn"><div><p>So far, we've dealt exclusively with internal state — that is to say, the values are only accessible within a given component.</p>
// <p>In any real application, you'll need to pass data from one component down to its children. To do that, we need to declare <em>properties</em>, generally shortened to 'props'. In Svelte, we do that with the <code>export</code> keyword. Edit the <code data-file="/src/lib/Nested.svelte">Nested.svelte</code> component:</p>
// <div class="code-block"><span class="filename">Nested.svelte</span><pre class="language-svelte"><code><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>script</span><span class="token punctuation">&gt;</span></span><span class="token script"><span class="token language-javascript">
// 	<span class="highlight add"><span class="token keyword">export</span></span> <span class="token keyword">let</span> answer<span class="token punctuation">;</span>
// </span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>script</span><span class="token punctuation">&gt;</span></span></code></pre></div><blockquote>
// <p>Just like <code>$:</code>, this may feel a little weird at first. That's not how <code>export</code> normally works in JavaScript modules! Just roll with it for now — it'll soon become second nature.</p>
// </blockquote>
// </div> <p><a href="/tutorial/default-values">Next: Default values</a></p></div> <footer class="svelte-12fabrn"><a target="_blank" rel="noreferrer" class="edit svelte-12fabrn" href="https://github.com/sveltejs/learn.svelte.dev/tree/main/content/tutorial/01-svelte/03-props/01-declaring-props">Edit this page</a></footer></section> </section></div>`
const test_html = `<pre>asdfasdfa
dafsdfasfasdf
sadfasdfasdfasdf <span>
	 sadfasfasdfassa
	adfasdfasdfasdf
</span> asdasfdasdfsad</pre>`
const test_fragment = `string of text node`



const res = html2pug(test_html)
console.log(res)
