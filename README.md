# html2pug

Converts **HTML** to **Pug** templating language.

## Requirments

Require bun

## Overview

html2pug convert html markup to pug

### Features 
- Block expansion
- Text Block

### Example

Turns this :unamused:
```html
<!doctype html>
<html lang="en">
  <head>
    <title>Hello World!</title>
  </head>
  <body>
    <div id="content">
      <h1 class="title"><strong>Hello</strong> World!</h1>
    </div>
  </body>
</html>
```

Into this :tada:
```pug
doctype html
html(lang='en')
  head
    title Hello World!
   body
    #content
      h1.title #[strong Hello] World!
```

## Install

<!--  TODO: -->

## Usage

### CLI
Accept input from a file or stdin and write to stdout:

```bash
# choose a file
html2pug < example.html

# use pipe
echo '<h1>foo</h1>' | html2pug -f
```

Write output to a file:
```bash
html2pug < example.html > example.pug
```

See `html2pug --help` for more information.

### Programmatically

```js
import html2pug from 'html2pug'

const html = '<header><h1 class="title">Hello World!</h1></header>'
const pug = html2pug(html, { tabs: true })
```

### Options

Name | Type | Default | Description
--- | --- | --- | ---
`tabs` | `Boolean` | `false` | Use tabs instead of spaces for indentation
`commas` | `Boolean` | `true` | Use commas to separate node attributes
`doubleQuotes` | `Boolean` | `false` | Use double quotes instead of single quotes for attribute values
`fragment` | `Boolean` | `false` | Wraps result in enclosing `<html>` and `<body>` tags if false


