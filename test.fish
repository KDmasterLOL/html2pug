function extract_angular
    cat ./test.html | bun ../clear_html/src/cli.ts -acdem -s 'div.content' -r 'a.header-link, code-example button'
end
extract_angular | bun ./src/cli.ts # TODO: Make that work
