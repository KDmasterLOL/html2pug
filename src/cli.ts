#!/opt/homebrew/bin/bun

import { parseArgs } from 'node:util'
import getStdin from 'get-stdin'
import { html2pug, type Options } from './index.js'
import { version } from '../package.json' assert { type: 'json'}

const help = `
  html2pug converts HTML to Pug.

  usage:
    html2pug [options] < [file]

  options:
    -f, --fragment       Don't wrap in enclosing <html> tag
    -t, --tabs           Use tabs for indentation
    -c, --commas         Use commas to separate attributes
    -d, --double-quotes  Use double quotes for attribute values
    -s, --simple         Doesn't do interpoltaion, block expansion

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

const exit = (text: string, exitCode = 0) => { // print logs to stdout and exits the process
	if (exitCode === 1) console.error(text); else console.log(text)
	process.exit(exitCode)
}

{
	let info: string | undefined = undefined
	if (args.help) info = help; if (args.version) info = version
	if (info) exit(info)
}

const stdin = await getStdin(); if (!stdin) exit(help)
exit(html2pug(stdin, args as Options))
