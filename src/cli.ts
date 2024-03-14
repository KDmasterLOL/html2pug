#!/opt/homebrew/bin/bun

import { parseArgs } from 'node:util'
import getStdin from 'get-stdin'
import { html2pug, Options } from './index.js'
import packageInfo from '../package.json' assert { type: 'json'}
const { version } = packageInfo

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


let args = parseArgs({
  options: {
    // Arguments for CLI
    help: { type: 'boolean', short: 'h' },
    version: { type: 'boolean', short: 'v' },

    // Arguments for converter
    fragment: { type: 'boolean', short: 'f' },
    tabs: { type: 'boolean', short: 't' },
    commas: { type: 'boolean', short: 'c' },
    doubleQuotes: { type: 'boolean', short: 'd' },
    simple: { type: 'boolean', short: 's' },
    inline_elements: { type: 'string', default: "a, b, i, em , strong, code, span" }
  },
}).values

const exit = (text, exitCode = 0) => { // print logs to stdout and exits the process
  if (exitCode === 1) console.error(text); else console.log(text)
  process.exit(exitCode)
}

{
  let info = undefined
  if (args.help) info = help; if (args.version) info = version
  if (info) exit(info)
}

const stdin = await getStdin(); if (!stdin) exit(help)
exit(html2pug(stdin, args as Options))
