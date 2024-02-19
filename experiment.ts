import { JSDOM } from 'jsdom'
import { minify } from 'html-minifier'
import html2pug from './src/index.ts'

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
// const test_html = `<pre>asdfasdfa
// dafsdfasfasdf
// sadfasdfasdfasdf <span>
// 	 sadfasfasdfassa
// 	adfasdfasdfasdf
// </span> asdasfdasdfsad</pre>`
// const test_html = `<pre>asdfasdfa
// dafsdfasfasdf
// sadfasdfa <b> bold </b> sdfasdf  <b> bold last </b>
// asdasfdasdfsad</pre>`
// const test_html = `<div class="post"><h1 class="post-title">Build your first Neovim configuration in lua</h1><span class="post-date">2022-07-04 | 21 min read | <a href="https://vonheikemen.github.io/devlog/es/tools/build-your-first-lua-config-for-neovim/"> Leer en español </a> </span><blockquote>Last updated: 2023-09-26</blockquote><p>Neovim is a tool both powerful and extensible. With some effort it can do more than just modify text in a file. Today I hope I can teach you enough about Neovim's <code>lua</code> api to be able to build your own configuration.</p><p>We will create a configuration file called <code>init.lua</code>, add a couple of plugins and I'll tell you how to make your own commands.</p><p>This tutorial is meant for people totally new to Neovim. If you already have a configuration written in vimscript and want to migrate to lua, you might find this other article more useful: <a href="https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/">Everything you need to know to configure neovim using lua</a>.</p><h2 id="some-advice">Some advice</h2><p>Before we start, I suggest you install the latest stable version of Neovim. You can go to the <a href="https://github.com/neovim/neovim/releases" rel="noopener" target="_blank">release page</a> in the github repository and download it from there. From now on I will assume you are using version 0.8 or greater.</p><p>If you don't feel comfortable using Neovim as an editor, follow the tutorial that comes bundled with it. You can start it using this command in the terminal.</p><pre class="language-sh" data-lang="sh" style="background:#2b2c2f;color:#cccece"><code class="language-sh" data-lang="sh"><span style="color:#6699cc">nvim +Tutor</span></code></pre>
const test_html = `<pre class="language-sh" data-lang="sh" style="background:#2b2c2f;color:#cccece"><code class="language-sh" data-lang="sh"><span style="color:#6699cc">nvim +Tutor</span></code></pre>
<pre class="language-sh" data-lang="sh" style="background:#2b2c2f;color:#cccece"><code class="language-sh" data-lang="sh"><span style="color:#6699cc">nvim +Tutor
bsd i am </span></code></pre>`

const test_fragment = `string of text node`




const res = html2pug(minify(test_html, {
  caseSensitive: true,
  removeEmptyAttributes: true,
  collapseWhitespace: true,
  collapseBooleanAttributes: true,
  preserveLineBreaks: false,
}), { simple: false, clean: false })
console.log(res)
