# How this works

`pre-wrap` property can be only set up when current element is or has as parent `pre` element

## Rules

### Block expansion

- Has only one `Node` of type `Node.ELEMENT_NODE` child

### Multiline content

- Has pre-wrap property
- All childrens are inline elements or text nodes
- All child elements doesn't multiline

It is not
```html
<pre>asdfasdfa
dafsdfasfasdf
sadfasdfasdfasdf <span>
	 sadfasfasdfassa
	adfasdfasdfasdf
</span> asdasfdasdfsad</pre>
```

It is
```html
<pre>asdfasdfa
dafsdfasfasdf
sadfasdfasdfasdf <span> sadfasfasdfassa adfasdfasdfasdf </span>
asdasfdasdfsad</pre>
```

pre
	.
		asdfasdfa
		dafsdfasfasdf
		sadfasdfasdfasdf
	span.
		 sadfasfasdfassa
		adfasdfasdfasdf
	| asdasfdasdfsad

<pre>asdfasdg sdfd</pre>
pre asdfasdg sdfd

<pre>asdfdf <span>adf
adfasfdafd</span> asdfasdfasdf</pre>
pre.
	asdfdf 
	span.
		adf
		adfasfdafd
	asdfasdfasdf

<pre>asdfdf <span>adf
adfasfdafd</span></pre>
pre asdfdf 
	span.
		adf
		adfasfdafd