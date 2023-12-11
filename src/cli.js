#!/usr/bin/env node

import { parseArgs } from 'node:util'
import { getStdin } from 'get-stdin'
import html2pug from './index.cjs'
import { version } from '../package.json'

// help represents the usage guide
const help = `
  html2pug converts HTML to Pug.

  usage:
    html2pug [options] < [file]

  options:
    -f, --fragment       Don't wrap in enclosing <html> tag
    -t, --tabs           Use tabs for indentation
    -c, --commas         Use commas to separate attributes
    -d, --double-quotes  Use double quotes for attribute values
    -i, --interpolate    Use to interpolate inline tags
    -h, --help           Show this page
    -v, --version        Show version

  examples:
    # write to stdout
    html2pug < example.html

    # write to file
    html2pug < example.html > example.pug
`

function print(text, exitCode = 0) {
  // print logs to stdout and exits the process
  if (exitCode === 1) console.error(text)
  else console.log(text)
  process.exit(exitCode)
}

async function convert(options = {}) {
  // convert uses the stdin as input for the html2pug library
  const stdin = await getStdin()
  if (!stdin) return print(help)
  return html2pug(stdin, options)
}
let args = parseArgs({
  options: {
    help: { type: 'boolean', short: 'h' },
    version: { type: 'boolean', short: 'v' },
  },
}).positionals
if (args.help) print(help)
if (args.version) print(version)

args = parseArgs({
  options: {
    fragment: { type: 'boolean', short: 'f' },
    tabs: { type: 'boolean', short: 't' },
    commas: { type: 'boolean', short: 'c' },
    doubleQuotes: { type: 'boolean', short: 'd' },
  },
}).positionals

convert(args)
  .then(result => print(result))
  .catch(err => print(err, 1))
