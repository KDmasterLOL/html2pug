function extract_angular
    cat ./test.html | bun ../clear_html/src/cli.ts -acdem -s 'div.content' -r 'a.header-link, code-example button'
end
function minify
    html-minifier --remove-comments | ../clear_html/src/cli.ts --keep_only_code -macd -s 'div.content' -r button -u 'code-example, aio-code, aio-toc, div'
end

# cat ./test.html | minify | bun ./src/cli.ts -f
bun ../download_page/index.js 'https://angular.io/guide/rx-library#loosely-coupled-apps' | minify | bun ./src/cli.ts
