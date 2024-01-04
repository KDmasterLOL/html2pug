header.h-20.flex.items-center.bg-sand.dark:bg-dark-background_navigation(x-data='{ open: false }')
  nav.container-fluid.wide.header.flex.justify-between.items-center.gap-5.xl:gap-8
    ul.order-0.space.space-x-5.xl:space-x-8.items-center.flex.text-legacy-lighter.font-medium.dark:text-white.dark:text-opacity-60.dark:font-semibold
      li(style='width:132px')
        a.block.pb-2(href='/')
          img.dark:hidden(src='/_/MDBjN2M4YjIxY2Y1YWExZWE3Njk4M2FiZTg1NWZjNTM/logo-with-name.svg', width='132', alt='OCaml logo')
          img.hidden.dark:inline(src='/_/MTE3YWE5YzJlZmExNmYyMmI3ZmEwYjliMDEwNDBkMDY/logo-with-name-white.svg', width='132', alt='OCaml logo')
    ul.order-2.hidden.lg:flex.items-center
      li
        form(x-data='{ row: null, col: 0, max: 0, total: 0 }', @submit='if (row !== null) { window.location = document.getElementById(\'package-autocomplete-\'+row+\'-\'+col).getAttribute(\'href\'); $event.stopPropagation(); $event.preventDefault(); return false }', action='/packages/search', method='GET')
          .dropdown-container.flex.items-center.justify-center.h-10.rounded-md.focus-within:outline-primary_40.dark:focus-within:outline-dark-primary_40.focus-within:outline.focus-within:outline-2.lg:w-56.xl:w-80(tabindex='0')
            label.sr-only(for='q') Search OCaml packages
            input.bg-white.dark:bg-dark-card.h-full.w-full.font-medium.focus:border-primary.dark:focus:border-dark-primary.focus:ring-0.text-gray-800.dark:text-dark-title.border-primary.dark:border-dark-primary.rounded-md.rounded-r-none.px-3.py-1.placeholder-text-content.dark:placeholder-dark-title.appearance-none.focus:outline-none(type='search', name='q', placeholder='Search OCaml packages', @keydown.stop, @keyup.down='if (row === null) { row = 0; col = 0; } else { row +=1; if (row > max) { row = max } }', @keyup.up='if (row !== null) { row -=1; if (row < 0) { row = null } }', @keyup.right='if (col < 1) col++', @keyup.left='if (col >= 1) col--', :aria-activedescendant='row !== null ? \'package-autocomplete-\'+row+\'-\'+col : null', hx-get='/packages/autocomplete', hx-params='q', hx-trigger='keyup changed, search', hx-target='#header-search-results', hx-indicator='#header-search-indicator', autocomplete='off')
            button.h-full.flex.items-center.justify-center.rounded-r-md.bg-primary.dark:bg-dark-primary.text-white.dark:text-dark-card.px-4(aria-label='search', type='submit')
              svg.w-6.h-6(xmlns='http://www.w3.org/2000/svg', fill='none', viewBox='0 0 24 24', stroke='currentColor', aria-hidden='true')
                path(stroke-linecap='round', stroke-linejoin='round', stroke-width='2', d='M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z')
            .dropdown.w-full.lg:w-[32rem].xl:w-[32rem].z-10.absolute.rounded-md.mt-12.shadow-2xl.top-1.p-2.bg-legacy-default.dark:bg-legacy-dark-default.shadow-3xl
              #header-search-results(aria-live='polite')
              a.flex.py-2.px-2.mx-2.gap-4.hover:bg-legacy-primary-100.font-normal.rounded-md.text-primary(href='/releases/latest/api/index.html')
                | 
Standard Library API

                svg.w-6.h-6(xmlns='http://www.w3.org/2000/svg', fill='none', viewBox='0 0 24 24', stroke='currentColor', aria-hidden='true')
                  path(stroke-linecap='round', stroke-linejoin='round', stroke-width='2', d='M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14')
    ul.order-1.mr-auto.items-center.hidden.lg:flex.font-medium.dark:text-white.dark:text-opacity-60.dark:font-semibold
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.text-primary.dark:text-dark-primary.underline(href='/docs') Learn
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.text-title.dark:text-dark-title(href='/packages') Packages
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.text-title.dark:text-dark-title(href='/community') Community
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.text-title.dark:text-dark-title(href='/blog') Blog
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.text-title.dark:text-dark-title(href='/play') Playground
    ul.order-3.hidden.lg:flex.items-center
      li
        a.border.border-primary.dark:border-dark-primary.text-primary.dark:text-dark-primary.font-bold.py-2.5.px-7.whitespace-nowrap.rounded(href='/docs/get-started') Get Started
    ul.order-1.lg:hidden.flex.items-center
      li.h-12.w-12.hover:bg-legacy-primary-100.flex.items-center.justify-center.rounded-full.text-content.dark:text-dark-title
        button(aria-label='open menu', @click='open = ! open')
          svg.h-8.w-8(xmlns='http://www.w3.org/2000/svg', fill='none', viewBox='0 0 24 24', stroke='currentColor', aria-hidden='true')
            path(stroke-linecap='round', stroke-linejoin='round', stroke-width='2', d='M4 6h16M4 10h16M4 14h16M4 18h16')
  .bg-black.fixed.w-full.h-full.left-0.top-0.opacity-60.z-40(x-show='open', x-cloak)
  nav.z-50.h-full.fixed.right-0.top-0.max-w-full.w-96.bg-legacy-default.dark:bg-legacy-dark-default.shadow-lg(x-show='open', x-cloak, @click.away='open = false', x-transition:enter='transition duration-200 ease-out', x-transition:enter-start='translate-x-full', x-transition:leave='transition duration-100 ease-in', x-transition:leave-end='translate-x-full')
    ul.text-legacy-lighter.p-6.font-semibold
      li.flex.justify-between.items-center
        a(href='/')
          img.dark:hidden(src='/_/MDBjN2M4YjIxY2Y1YWExZWE3Njk4M2FiZTg1NWZjNTM/logo-with-name.svg', width='132', alt='OCaml logo')
          img.hidden.dark:inline(src='/_/MTE3YWE5YzJlZmExNmYyMmI3ZmEwYjliMDEwNDBkMDY/logo-with-name-white.svg', width='132', alt='OCaml logo')
        div(x-on:click='open = false')
          button.text-content.dark:text-dark-title(aria-label='close')
            svg.h-8.w-8(xmlns='http://www.w3.org/2000/svg', fill='none', viewBox='0 0 24 24', stroke='currentColor', aria-hidden='true')
              path(stroke-linecap='round', stroke-linejoin='round', stroke-width='2', d='M6 18L18 6M6 6l12 12')
      li.mt-6.mb-3
        form(action='/packages/search', method='GET')
          .dropdown-container.flex.items-center.justify-center.h-10.rounded-md.focus-within:outline-primary_40.dark:focus-within:outline-dark-primary_40.focus-within:outline.focus-within:outline-2(tabindex='0')
            label.sr-only(for='q') Search OCaml packages
            input.bg-white.dark:bg-dark-card.h-full.w-full.font-medium.focus:border-primary.dark:focus:border-dark-primary.focus:ring-0.text-gray-800.dark:text-dark-title.border-primary.dark:border-dark-primary.rounded-md.rounded-r-none.px-3.py-1.placeholder-text-content.dark:placeholder-dark-title.appearance-none.focus:outline-none(type='search', name='q', placeholder='Search OCaml packages')
            button.h-full.flex.items-center.justify-center.rounded-r-md.bg-primary.dark:bg-dark-primary.text-white.dark:text-dark-card.px-4(aria-label='search', type='submit')
              svg.w-6.h-6(xmlns='http://www.w3.org/2000/svg', fill='none', viewBox='0 0 24 24', stroke='currentColor', aria-hidden='true')
                path(stroke-linecap='round', stroke-linejoin='round', stroke-width='2', d='M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z')
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.block.text-primary.dark:text-dark-primary.underline(href='/docs') Learn
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.block.text-title.dark:text-dark-title(href='/packages') Packages
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.block.text-title.dark:text-dark-title(href='/community') Community
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.block.text-title.dark:text-dark-title(href='/blog') Blog
      li
        a.font-normal.py-3.mg:py-4.px-1.lg:px-3.hover:text-primary.dark:hover:text-dark-primary.block.text-title.dark:text-dark-title(href='/play') Playground
      li
        a.flex.py-3.px-1.gap-4.font-semibold.text-primary.dark:text-dark-primary(href='/releases/latest/api/index.html')
          | Standard Library API
          svg.w-6.h-6(xmlns='http://www.w3.org/2000/svg', fill='none', viewBox='0 0 24 24', stroke='currentColor', aria-hidden='true')
            path(stroke-linecap='round', stroke-linejoin='round', stroke-width='2', d='M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14')
      li.mt-3.mb-6
        a.w-full.rounded.font-normal.py-3.px-7.flex.items-center.justify-center.bg-primary.dark:bg-dark-primary.text-white.dark:text-dark-title(href='/docs/get-started') Get started
      li
        .space-x-6.text-2xl.flex.items-center
          a.opacity-60.hover:opacity-100.text-content.dark:text-dark-title.hover:text-primary.dark:hover:text-dark-primary(aria-label='OCaml\'s Discord', href='https://discord.gg/cCYQbqN')
            svg.w-6.h-6(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24', aria-hidden='true')
              path(fill-rule='evenodd', d='M18.9419 5.29661C17.6473 4.69088 16.263 4.25066 14.8157 4C14.638 4.32134 14.4304 4.75355 14.2872 5.09738C12.7487 4.86601 11.2245 4.86601 9.7143 5.09738C9.57116 4.75355 9.3588 4.32134 9.17947 4C7.73067 4.25066 6.3448 4.6925 5.05016 5.29982C2.43887 9.24582 1.73099 13.0938 2.08493 16.8872C3.81688 18.1805 5.49534 18.9662 7.14548 19.4804C7.55291 18.9196 7.91628 18.3235 8.22931 17.6953C7.63313 17.4688 7.06211 17.1892 6.52256 16.8647C6.6657 16.7586 6.80571 16.6478 6.94098 16.5337C10.2318 18.0729 13.8074 18.0729 17.0589 16.5337C17.1958 16.6478 17.3358 16.7586 17.4774 16.8647C16.9362 17.1908 16.3637 17.4704 15.7675 17.697C16.0805 18.3235 16.4423 18.9212 16.8513 19.4819C18.503 18.9678 20.183 18.1822 21.915 16.8872C22.3303 12.4897 21.2056 8.67705 18.9419 5.29661ZM8.67765 14.5543C7.68977 14.5543 6.87963 13.632 6.87963 12.509C6.87963 11.3859 7.67247 10.4621 8.67765 10.4621C9.68285 10.4621 10.493 11.3843 10.4757 12.509C10.4772 13.632 9.68285 14.5543 8.67765 14.5543ZM15.3223 14.5543C14.3344 14.5543 13.5243 13.632 13.5243 12.509C13.5243 11.3859 14.3171 10.4621 15.3223 10.4621C16.3275 10.4621 17.1376 11.3843 17.1203 12.509C17.1203 13.632 16.3275 14.5543 15.3223 14.5543Z', clip-rule='evenodd')
          a.opacity-60.hover:opacity-100.text-content.dark:text-dark-title.hover:text-primary.dark:hover:text-dark-primary(aria-label='The OCaml Compiler on GitHub', href='https://github.com/ocaml/ocaml')
            svg.w-6.h-6(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24', aria-hidden='true')
              path(fill-rule='evenodd', d='M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z', clip-rule='evenodd')
          a.opacity-60.hover:opacity-100.text-content.dark:text-dark-title.hover:text-primary.dark:hover:text-dark-primary(aria-label='The OCaml Language Twitter Account', href='https://twitter.com/ocamllang')
            svg.w-6.h-6(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24', aria-hidden='true')
              path(d='M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84')
main
  nav.px-4.flex.text-white.dark:text-dark-title.bg-title.md:hidden(aria-label='breadcrumbs')
    ul
      li.inline-block
        a.flex.items-center.px-2.py-2.border-transparent.border-2.border-b-4(href='/docs')
          | Learn

          span
            svg.w-3.h-3.ml-2(xmlns='http://www.w3.org/2000/svg', fill='none', viewBox='0 0 24 24', stroke-width='1.5', stroke='currentColor', aria-hidden='true')
              path(stroke-linecap='round', stroke-linejoin='round', d='M8.25 4.5l7.5 7.5-7.5 7.5')
      li.inline-block
        select.appearance-none.bg-legacy-text-title.border-2.border-b-4.bg-none.font-bold.border-none.w-auto.p-0.m-0.cursor-pointer.focus:outline-none.focus:ring-0(onchange='location = this.value;')
          option(value='/docs').
            
            Overview
            
          option(value='/docs/get-started').
            
            Get Started
            
          option(value='/docs/language', selected).
            
            Language
            
          option(value='/docs/platform').
            
            Platform
            
          option(value='/docs/guides').
            
            Guides
            
          option(value='/exercises').
            
            Exercises
            
          option(value='/books').
            
            Books
            
        span.text-primary.dark:text-dark-primary.cursor-pointer ▾
  .bg-title.dark:bg-[#111827].hidden.md:flex
    nav.container-fluid.wide.flex.flex-wrap
      a.justify-start.px-4.py-2.text-white.dark:text-dark-title.items-center.font-normal.border-2.border-b-4.border-transparent.rounded.opacity-80.hover:dark:text-primary.dark:hover:text-dark-primary(href='/docs').
        
        Overview
        
      a.justify-start.px-4.py-2.text-white.dark:text-dark-title.items-center.font-normal.border-2.border-b-4.border-transparent.rounded.opacity-80.hover:dark:text-primary.dark:hover:text-dark-primary(href='/docs/get-started').
        
        Get Started
        
      a.justify-start.px-4.py-2.text-white.dark:text-dark-title.items-center.font-normal.border-2.border-b-4.border-transparent.rounded.border-b-primary.dark:border-b-dark-primary(href='/docs/language').
        
        Language
        
      a.justify-start.px-4.py-2.text-white.dark:text-dark-title.items-center.font-normal.border-2.border-b-4.border-transparent.rounded.opacity-80.hover:dark:text-primary.dark:hover:text-dark-primary(href='/docs/platform').
        
        Platform Tools
        
      a.justify-start.px-4.py-2.text-white.dark:text-dark-title.items-center.font-normal.border-2.border-b-4.border-transparent.rounded.opacity-80.hover:dark:text-primary.dark:hover:text-dark-primary(href='/docs/guides').
        
        Guides
        
      a.justify-start.px-4.py-2.text-white.dark:text-dark-title.items-center.font-normal.border-2.border-b-4.border-transparent.rounded.opacity-80.hover:dark:text-primary.dark:hover:text-dark-primary(href='/exercises').
        
        Exercises
        
      a.justify-start.px-4.py-2.text-white.dark:text-dark-title.items-center.font-normal.border-2.border-b-4.border-transparent.rounded.opacity-80.hover:dark:text-primary.dark:hover:text-dark-primary(href='/books').
        
        Books
        
  .bg-legacy-default.dark:bg-legacy-dark-default(x-data='{ sidebar: window.matchMedia(\'(min-width: 64em)\').matches, showOnMobile: false}', @resize.window='sidebar = window.matchMedia(\'(min-width: 64em)\').matches', x-on:close-sidebar='sidebar=window.matchMedia(\'(min-width: 64em)\').matches')
    button.flex.items-center.bg-[#D54000].p-4.z-30.rounded-full.text-white.shadow-custom.bottom-24.md:bottom-36.fixed.lg:hidden.right-10(:title='(sidebar? "close" : "open")+" sidebar"', x-on:click='sidebar = ! sidebar')
      svg.h-6.w-6(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24')
        path(d='M14.25 14.375H19.875C20.4962 14.375 21 13.8712 21 13.25V9.875C21 9.25377 20.4962 8.75 19.875 8.75H14.25C13.6288 8.75 13.125 9.25377 13.125 9.875V11H7.5V7.625H9.75C10.3712 7.625 10.875 7.12122 10.875 6.5V3.125C10.875 2.50378 10.3712 2 9.75 2H4.125C3.50378 2 3 2.50378 3 3.125V6.5C3 7.12122 3.50378 7.625 4.125 7.625H6.375V19.4375C6.375 19.7482 6.62677 20 6.9375 20H13.125V21.125C13.125 21.7462 13.6288 22.25 14.25 22.25H19.875C20.4962 22.25 21 21.7462 21 21.125V17.75C21 17.1288 20.4962 16.625 19.875 16.625H14.25C13.6288 16.625 13.125 17.1288 13.125 17.75V18.875H7.5V12.125H13.125V13.25C13.125 13.8712 13.6288 14.375 14.25 14.375ZM14.25 9.875H19.875V13.25H14.25V9.875ZM4.125 6.5V3.125H9.75V6.5H4.125ZM14.25 17.75H19.875V21.125H14.25V17.75Z')
    .fixed.z-10.inset-0.bg-legacy-contrast/20.backdrop-blur-sm.lg:hidden(:class='sidebar ? "" : "hidden"', aria-hidden='true', x-on:click='sidebar = ! sidebar')
    .container-fluid.wide.pt-10
      .flex.flex-col.lg:flex-row.lg:gap-6.xl:gap-12
        .z-20.bg-legacy-default.dark:bg-legacy-dark-default.flex-col.fixed.h-screen.overflow-auto.lg:flex.left-0.top-0.lg:sticky.p-6.lg:px-0.w-80.lg:w-72.lg:px-0.lg:pt-6.lg:pb-72(x-show='sidebar', x-transition:enter='transition duration-200 ease-out', x-transition:enter-start='-translate-x-full', x-transition:leave='transition duration-100 ease-in', x-transition:leave-end='-translate-x-full')
          .flex.flex-col.gap-5
            .pl-2.pr-8.flex.flex-col
              .text-lg.font-bold.leading-10.flex.py-1.uppercase Introduction
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/values-and-functions').
                
                Values and Functions
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/basic-data-types').
                
                Basic Data Types and Pattern Matching
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.font-bold.text-primary.bg-legacy-primary-100.border-primary(href='/docs/functional-programming').
                
                Functional Programming
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/if-statements-and-loops').
                
                If Statements and Recursions
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/lists').
                
                Lists
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/labels').
                
                Labelled & Optional Arguments
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/mutability-loops-and-imperative').
                
                Mutability, Loops, and Imperative Programming
                
            .pl-2.pr-8.flex.flex-col
              .text-lg.font-bold.leading-10.flex.py-1.uppercase Module System
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/modules').
                
                Modules
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/functors').
                
                Functors
                
            .pl-2.pr-8.flex.flex-col
              .text-lg.font-bold.leading-10.flex.py-1.uppercase Data Structures
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/options').
                
                Options
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/arrays').
                
                Arrays
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/map').
                
                Map
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/sets').
                
                Sets
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/hash-tables').
                
                Hash Tables
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/sequences').
                
                Sequences
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/memoization')
                span.inline-block.px-1.bg-primary.text-white.rounded-md.mr-1.
                  
                  CS3110
                  
                | 
Memoization

              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/monads')
                span.inline-block.px-1.bg-primary.text-white.rounded-md.mr-1.
                  
                  CS3110
                  
                | 
Monads

            .pl-2.pr-8.flex.flex-col
              .text-lg.font-bold.leading-10.flex.py-1.uppercase Advanced Topics
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/metaprogramming').
                
                Preprocessors and PPXs
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/operators').
                
                Operators
                
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/objects').
                
                Objects
                
            .pl-2.pr-8.flex.flex-col
              .text-lg.font-bold.leading-10.flex.py-1.uppercase Runtime & Compiler
              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/memory-representation')
                span.inline-block.px-1.bg-primary.text-white.rounded-md.mr-1.
                  
                  RWO
                  
                | 
Memory Representation of Values

              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/garbage-collector')
                span.inline-block.px-1.bg-primary.text-white.rounded-md.mr-1.
                  
                  RWO
                  
                | 
Understanding the Garbage Collector

              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/compiler-frontend')
                span.inline-block.px-1.bg-primary.text-white.rounded-md.mr-1.
                  
                  RWO
                  
                | 
Compiler Frontend

              a.border-l-2.py-2.px-3.rounded-sm.leading-6.text-legacy-default.hover:bg-gray-100.border-transparent(href='/docs/compiler-backend')
                span.inline-block.px-1.bg-primary.text-white.rounded-md.mr-1.
                  
                  RWO
                  
                | 
Compiler Backend

        .flex-1.z-0.z-.min-w-0.lg:pt-6.lg:max-w-3xl
          .prose.prose-orange.max-w-full
            h1#functional-programming
              a.anchor(aria-hidden='true', href='#functional-programming')
              | Functional Programming
            h2#what-is-functional-programming
              a.anchor(aria-hidden='true', href='#what-is-functional-programming')
              | What Is Functional Programming?
            p
              | We've got quite far into the tutorial, yet we haven't really considered

              strong functional programming
              | . All the features given so far (rich data types, pattern matching, type inference, nested functions) could exist in a "super C" language. These are cool features that make your code concise, easy to read, and have fewer bugs; however, they actually have very little to do with functional programming. In fact, the reason functional languages are so great is 
              em not
              |  because of functional programming but because we've been stuck with C-like languages for years, and in the meantime, cutting-edge programming has progressed considerably. So while we were writing

              code struct { int type; union { ... } }
              |  for the umpteenth time, ML and Haskell programmers had safe variants and pattern matching on datatypes. While we were being careful to 
              code free
              |  all our 
              code malloc
              | s, there have been languages with garbage collectors able to outperform hand coding since the 80s.
            p Let's explore functional programming.
            p
              | The basic, and not very enlightening, distinction in 
              strong functional programming
              | 
is that 
              strong functions
              |  are first-class citizens.
            p
              | (Remember that OCaml runs code when it sees the double semicolon 
              code ;;
              | . Throughout this tutorial, executable code examples begin with the command prompt 
              code #
              | , end in 
              code ;;
              | , and show the expected output. If it doesn't, it's showcasing the code pattern rather than an executable code block.)
            p Let's look at an example to illustrate:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding double
                span.ocaml-source  
                span.ocaml-source x
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source x
                span.ocaml-source  
                span.ocaml-keyword-operator *
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-source  
                span.ocaml-keyword-other in
                span.ocaml-source.
                  
                  
                span.ocaml-source     
                span.ocaml-constant-language-capital-identifier List
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source map
                span.ocaml-source  
                span.ocaml-source double
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 4
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 6
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
            p
              | In this example, we first defined a nested function called 
              code double
              | 
that took the argument 
              code x
              |  and returned 
              code x * 2
              | . Then 
              code map
              |  calls

              code double
              |  on each element of the given list (
              code [1; 2; 3]
              | ) to produce the result: a list with each number doubled.
            p
              code map
              |  is known as a 
              strong higher-order function
              |  (HOF). Higher-order functions are just a fancy way of saying that the function takes a function as one of its arguments. Simple so far. If you're familiar with C/C++ then this looks like passing a function pointer around.
            p
              strong Closures
              |  are functions which carry around some of the "environment" in which they were defined. In particular, a closure can reference variables which were available at the point of its definition. Let's generalise the function above so that now we can take any list of integers and multiply each element by an arbitrary value 
              code n
              | :
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding multiply
                span.ocaml-source  
                span.ocaml-source n
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source.
                  
                  
                span.ocaml-source     
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding f
                span.ocaml-source  
                span.ocaml-source x
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source n
                span.ocaml-source  
                span.ocaml-keyword-operator *
                span.ocaml-source  
                span.ocaml-source x
                span.ocaml-source  
                span.ocaml-keyword-other in
                span.ocaml-source.
                  
                  
                span.ocaml-source       
                span.ocaml-constant-language-capital-identifier List
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source map
                span.ocaml-source  
                span.ocaml-source f
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
            p Hence:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 4
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 6
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 5
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 5
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 10
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 15
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
            p
              | The important point to note about the 
              code multiply
              |  function is the nested function 
              code f
              | . This is a closure. Look at how 
              code f
              |  uses the value of 
              code n
              | 
which isn't actually passed as an explicit argument to 
              code f
              | . Instead 
              code f
              | 
picks it up from its environment; it's an argument to the 
              code multiply
              | 
function and hence available within this function.
            p
              | This might sound straightforward, but let's look a bit closer at that call to map: 
              code List.map f list
              | .
            p
              code map
              |  is defined in the 
              code List
              |  module, far away from the current code. In other words, we're passing 
              code f
              |  into a module defined "a long time ago, in a galaxy far far away." For all we know, that code might pass 
              code f
              | 
to other modules or save a reference to 
              code f
              |  somewhere and call it later. Whether it does or not, the closure will ensure that 
              code f
              | 
always has access back to its parental environment, and to 
              code n
              | .
            p Here's the code pattern (skeleton) extracted from a real example from LabGtk. This is actually a method on a class (we haven't talked about classes and objects yet, but just think of it as a function definition for now).
            //  $MDX skip 
            pre
              code
                span.ocaml-keyword-other class
                span.ocaml-source  
                span.ocaml-source html_skel
                span.ocaml-source  
                span.ocaml-source obj
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-other object
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-source self
                span.ocaml-source )
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-keyword-other method
                span.ocaml-source  
                span.ocaml-source save_to_channel
                span.ocaml-source  
                span.ocaml-source chan
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source.
                  
                  
                span.ocaml-source     
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding receiver_fn
                span.ocaml-source  
                span.ocaml-source content
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source.
                  
                  
                span.ocaml-source       
                span.ocaml-source output_string
                span.ocaml-source  
                span.ocaml-source chan
                span.ocaml-source  
                span.ocaml-source content
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source       
                span.ocaml-constant-language-boolean true
                span.ocaml-source.
                  
                  
                span.ocaml-source     
                span.ocaml-keyword-other in
                span.ocaml-source.
                  
                  
                span.ocaml-source       
                span.ocaml-source save
                span.ocaml-source  
                span.ocaml-source obj
                span.ocaml-source  
                span.ocaml-source receiver_fn
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other end
                span.ocaml-source.
                  
                  
            p
              | First of all you need to know that the 
              code save
              |  function called at the end of the method takes a function as its second argument: (
              code receiver_fn
              | ). It repeatedly calls 
              code receiver_fn
              |  with snippets of text from the widget that it's trying to save.
            p
              | Now look at the definition of 
              code receiver_fn
              | . This function is a closure alright because it keeps a reference to 
              code chan
              |  from its environment.
            h2#partial-function-applications
              a.anchor(aria-hidden='true', href='#partial-function-applications')
              | Partial Function Applications
            p
              | Let's define a 
              code plus
              |  function, which just adds two integers:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding plus
                span.ocaml-source  
                span.ocaml-source a
                span.ocaml-source  
                span.ocaml-source b
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source.
                  
                  
                span.ocaml-source     
                span.ocaml-source a
                span.ocaml-source  
                span.ocaml-keyword-operator +
                span.ocaml-source  
                span.ocaml-source b
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
            p Some questions for people asleep at the back of the class.
            ol
              li
                | What is 
                code plus
                | ?
              li
                | What is 
                code plus 2 3
                | ?
              li
                | What is 
                code plus 2
                | ?
            p
              | Question 1 is easy: 
              code plus
              |  is a function. It takes two arguments that are integers and returns an integer. We write its type like this:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
            p
              | Question 2 is even easier: 
              code plus 2 3
              |  is a number, the integer 
              code 5
              | . We write its value and type like this:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 5
                span.ocaml-comment-line-directive ;;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 5
                span.ocaml-source.
                  
                  
            p
              | But what about question 3? It looks like 
              code plus 2
              |  is a typo or an incomplete copy-paste, but it isn't. If we type this into the OCaml toplevel, it returns:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
            p
              | This isn't an error. It's telling us that 
              code plus 2
              |  is in fact a

              em function
              | , which takes an 
              code int
              |  and returns an 
              code int
              | .
            p
              | What sort of function is this? Let's experiment by first giving this mysterious function a name (
              code f
              | ) and then trying it out on a few integers to see what it does:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding f
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source f
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source f
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 10
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 12
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source f
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 15
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 17
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source f
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 99
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 101
                span.ocaml-source.
                  
                  
            p
              | In engineering, this is sufficient proof to state

              code f
              |  (i.e., 
              code plus 2
              | ) is the function that adds 2 to its parameter.
            p
              | Looking at the types of these expressions, we may be able to see some rationale for the strange 
              code ->
              |  arrow notation used for function types:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 5
                span.ocaml-source.
                  
                  
            p
              | This process is called 
              strong partial application
              |  of a function.
            p
              | Remember our 
              code double
              |  and 
              code multiply
              |  functions from earlier on?

              code multiply
              |  was defined as this:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding multiply
                span.ocaml-source  
                span.ocaml-source n
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding f
                span.ocaml-source  
                span.ocaml-source x
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source n
                span.ocaml-source  
                span.ocaml-keyword-operator *
                span.ocaml-source  
                span.ocaml-source x
                span.ocaml-source  
                span.ocaml-keyword-other in
                span.ocaml-source.
                  
                  
                span.ocaml-source     
                span.ocaml-constant-language-capital-identifier List
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source map
                span.ocaml-source  
                span.ocaml-source f
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
            p
              | We can now define 
              code double
              |  and 
              code triple
              |  functions very easily, like this:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding double
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source double
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding triple
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source triple
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
            p They really are functions, look:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source double
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 4
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 6
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source triple
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 6
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 9
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
            p
              | You can also use partial application directly (without the intermediate

              code f
              |  function) like this:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding multiply
                span.ocaml-source  
                span.ocaml-source n
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-language-capital-identifier List
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source map
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-source (
                span.ocaml-source  
                span.ocaml-keyword-operator *
                span.ocaml-source  
                span.ocaml-source )
                span.ocaml-source  
                span.ocaml-source n
                span.ocaml-source )
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding double
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source double
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding triple
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source multiply
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source triple
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source double
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 4
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 6
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source triple
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 6
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 9
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
            p
              | In the example above, 
              code (( * ) n)
              |  is the partial application of the 
              code ( * )
              | 
(times) function. Note the extra spaces needed so that OCaml doesn't think 
              code (*
              |  starts a comment.
            p
              | You can also put infix operators into brackets to make functions. Here's an identical definition of the 
              code plus
              |  function as before:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding plus
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-source  
                span.ocaml-keyword-operator +
                span.ocaml-source  
                span.ocaml-source )
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 5
                span.ocaml-source.
                  
                  
            p Here's some more examples of partial application:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-constant-language-capital-identifier List
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source map
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-source )
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 4
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 5
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding list_of_functions
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-language-capital-identifier List
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source map
                span.ocaml-source  
                span.ocaml-source plus
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 2
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source ]
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source list_of_functions
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source )
                span.ocaml-source  
                span.ocaml-source list
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source [
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source ]
                span.ocaml-source.
                  
                  
            h2#what-is-functional-programming-good-for
              a.anchor(aria-hidden='true', href='#what-is-functional-programming-good-for')
              | What Is Functional Programming Good For?
            p
              | Functional programming, like any good programming technique, is a useful tool for solving some classes of problems. It's very good for callbacks, which have multiple uses from GUIs to event-driven loops. It's great for expressing generic algorithms.

              code List.map
              |  is really a generic algorithm for applying functions over any type of list. Similarly you can define generic functions over trees. Certain types of numerical problems can be solved more quickly with functional programming (for example, numerically calculating the derivative of a mathematical function).
            h2#pure-and-impure-functional-programming
              a.anchor(aria-hidden='true', href='#pure-and-impure-functional-programming')
              | Pure and Impure Functional Programming
            p
              | A 
              strong pure function
              |  is one without any 
              strong side effects
              | . A side effect means that the function keeps some sort of hidden state inside it. 
              code strlen
              |  is a good example of a pure function in C. If you call

              code strlen
              |  with the same string, it always returns the same length. The output of 
              code strlen
              |  (the length) only depends on the inputs (the string) and nothing else. Many functions in C are, unfortunately, impure. For example, 
              code malloc
              | . If you call it with the same number, it certainly won't return the same pointer to you. 
              code malloc
              | , of course, relies on a huge amount of hidden internal state (objects allocated on the heap, the allocation method in use, grabbing pages from the operating system, etc.).
            p ML-derived languages like OCaml are "mostly pure," meaning they allow side effects through things like references and arrays. But most of the code you'll write will be "pure functional" because functional languages encourage this thinking. Haskell, another functional language, is pure functional. OCaml is therefore more practical because writing impure functions is sometimes useful.
            p There are various theoretical advantages of having pure functions. One advantage is that if a function is pure, it is called several times with the same arguments. The compiler only needs to actually call the function once. A good example in C is:
            pre
              code.language-C.
                for (i = 0; i < strlen (s); ++i)
                  {
                    // Do something which doesn't affect s.
                  }
                
            p
              | If naively compiled, this loop is O(n
              sup 2
              | ) because 
              code strlen (s)
              | 
is called each time and 
              code strlen
              |  needs to iterate over the whole of 
              code s
              | . If the compiler is smart enough to work out that 
              code strlen
              |  is pure functional 
              em and
              |  that 
              code s
              |  is not updated in the loop, then it can remove the redundant extra calls to 
              code strlen
              |  and make the loop O(n). Do compilers really do this? In the case of 
              code strlen
              |  yes, in other cases, probably not.
            p Concentrating on writing small pure functions allows you to construct reusable code using a bottom-up approach, testing each small function as you go along. The current fashion is to carefully plan your programs using a top-down approach, but in this author's opinion, this often results in projects failing.
            h2#strictness-vs-laziness
              a.anchor(aria-hidden='true', href='#strictness-vs-laziness')
              | Strictness vs. Laziness
            p C-derived and ML-derived languages are strict. Haskell and Miranda are non-strict, or lazy, languages. OCaml is strict by default, but it allows a lazy style of programming when needed.
            p
              | In a strict language, arguments to functions are always evaluated first, and the results are then passed to the function. For example, in a strict language, the call 
              code give_me_a_three (1/0)
              |  is always going to result in a 
              code divide-by-zero
              |  error:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding give_me_a_three
                span.ocaml-source  
                span.ocaml-constant-language _
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source give_me_a_three
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-storage-type 'a
                span.ocaml-source  
                span.ocaml-keyword-operator ->
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other fun
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source give_me_a_three
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-source  
                span.ocaml-keyword-operator /
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 0
                span.ocaml-source )
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-constant-language-capital-identifier Exception
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-constant-language-capital-identifier Division_by_zero
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source.
                  
                  
            p If you've programmed in any conventional language, this is just how things work. You might be surprised that things could work any other way.
            p
              | In a lazy language, something stranger happens. Arguments to functions are only evaluated if the function actually uses them. Remember that the

              code give_me_a_three
              |  function throws away its argument and always returns a 3? In a lazy language, the above call would 
              em not
              |  fail because

              code give_me_a_three
              |  never looks at its first argument, so the first argument is never evaluated. Thus, the division by zero doesn't happen.
            p Lazy languages also let you do really odd things like defining an infinitely long list, provided you don't actually try to iterate over the whole list this works (say, instead, that you just try to fetch the first 10 elements).
            p
              | OCaml is a strict language, but has a 
              code lazy
              |  module that lets you write lazy expressions. Here's an example. First we create a lazy expression for 
              code 1/0
              | :
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding lazy_expr
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-other lazy
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-constant-numeric-decimal-integer 1
                span.ocaml-source  
                span.ocaml-keyword-operator /
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 0
                span.ocaml-source )
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-other val
                span.ocaml-source  
                span.ocaml-source lazy_expr
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-source lazy_t
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-keyword-operator <
                span.ocaml-keyword-other lazy
                span.ocaml-keyword-operator >
                span.ocaml-source.
                  
                  
            p
              | Notice the type of this lazy expression is 
              code int lazy_t
              | .
            p
              | Because 
              code give_me_a_three
              |  takes 
              code 'a
              |  (any type) we can pass this lazy expression into the function:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source give_me_a_three
                span.ocaml-source  
                span.ocaml-source lazy_expr
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-keyword-operator -
                span.ocaml-source  
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-support-type int
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-constant-numeric-decimal-integer 3
                span.ocaml-source.
                  
                  
            p
              | To evaluate a lazy expression, you must use the 
              code Lazy.force
              |  function:
            pre
              code
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-constant-language-capital-identifier Lazy
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source force
                span.ocaml-source  
                span.ocaml-source lazy_expr
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-constant-language-capital-identifier Exception
                span.ocaml-keyword-other-ocaml.punctuation-other-colon.punctuation :
                span.ocaml-source  
                span.ocaml-constant-language-capital-identifier Division_by_zero
                span.ocaml-keyword-other-ocaml.punctuation-other-period.punctuation-separator .
                span.ocaml-source.
                  
                  
            h2#boxed-vs-unboxed-types
              a.anchor(aria-hidden='true', href='#boxed-vs-unboxed-types')
              | Boxed vs. Unboxed Types
            p "Boxes" is a term you'll hear often when discussing functional languages. It can be confusing, but in fact the distinction between boxed and unboxed types is quite simple if you've used C, C++, or Java before (in Perl, everything is boxed).
            p
              | The way to understand a boxed object is to think of an object which has been allocated on the heap using 
              code malloc
              |  in C (or equivalently 
              code new
              |  in C++) and/or is referred to through a pointer. Take a look at this example C program:
            pre
              code.language-C.
                #include <stdio.h>
                
                void
                printit (int *ptr)
                {
                  printf ("the number is %d\n", *ptr);
                }
                
                void
                main ()
                {
                  int a = 3;
                  int *p = &a;
                
                  printit (p);
                }
                
            p
              | The variable 
              code a
              |  is allocated on the stack, and it is quite definitely unboxed.
            p
              | The function 
              code printit
              |  takes a boxed integer and prints it.
            p The diagram below shows an array of unboxed (top) vs. boxed (below) integers:
            p
              img(src='/media/tutorials/boxedarray.png', alt='Boxed Array')
            p (No prizes for guessing that the array of unboxed integers is much faster than the array of boxed integers.)
            p In addition, because there are fewer separate allocations, garbage collection is much faster and simpler on the array of unboxed objects.
            p
              | In C or C++, you shouldn't have problems constructing either of the two array types above. In Java, you have two types, 
              code int
              |  which is unboxed and 
              code Integer
              |  which is boxed, hence considerably less efficient. In OCaml, the basic types are all unboxed.
            h2#aliases-for-function-names-and-arguments
              a.anchor(aria-hidden='true', href='#aliases-for-function-names-and-arguments')
              | Aliases for Function Names and Arguments
            p It's possible to use this as a neat trick to save typing: aliasing function names and function arguments.
            p
              | Although we haven't looked at object-oriented programming (that's the subject for the 
              a(href='/docs/objects') "Objects" section
              | ), here's an example code pattern of an aliased function call that can be found in OCamlNet. All you need to know is that

              code cgi # output # output_string "string"
              |  is a method call, similar to

              code cgi.output().output_string ("string")
              |  in Java.
            //  $MDX skip 
            pre
              code
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding begin_page
                span.ocaml-source  
                span.ocaml-source cgi
                span.ocaml-source  
                span.ocaml-source title
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding out
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source cgi
                span.ocaml-source  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source output
                span.ocaml-source  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source output_string
                span.ocaml-source  
                span.ocaml-keyword-other in
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double <html>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double <head>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double <title>
                span.ocaml-string-quoted-double "
                span.ocaml-source  
                span.ocaml-keyword-operator ^
                span.ocaml-source  
                span.ocaml-source text
                span.ocaml-source  
                span.ocaml-source title
                span.ocaml-source  
                span.ocaml-keyword-operator ^
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double </title>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-source )
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double <style type=
                span.ocaml-constant-character-escape \"
                span.ocaml-string-quoted-double text/css
                span.ocaml-constant-character-escape \"
                span.ocaml-string-quoted-double >
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-source )
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double body { background: white; color: black; }
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double </style>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double </head>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double <body>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
                span.ocaml-source   
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-source (
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double <h1>
                span.ocaml-string-quoted-double "
                span.ocaml-source  
                span.ocaml-keyword-operator ^
                span.ocaml-source  
                span.ocaml-source text
                span.ocaml-source  
                span.ocaml-source title
                span.ocaml-source  
                span.ocaml-keyword-operator ^
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double </h1>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-source )
                span.ocaml-source.
                  
                  
            p
              | The 
              code let out = ...
              |  is a partial function application for that method call (partial, because the string parameter hasn't been applied). 
              code out
              | 
is therefore a function, which takes a string parameter.
            //  $MDX skip 
            pre
              code
                span.ocaml-source out
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double <html>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
            p is equivalent to:
            //  $MDX skip 
            pre
              code
                span.ocaml-source cgi
                span.ocaml-source  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source output
                span.ocaml-source  
                span.ocaml-keyword-other #
                span.ocaml-source  
                span.ocaml-source output_string
                span.ocaml-source  
                span.ocaml-string-quoted-double "
                span.ocaml-string-quoted-double <html>
                span.ocaml-constant-character-escape \n
                span.ocaml-string-quoted-double "
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
            p By altering the code pattern, we saved ourselves a lot of typing there.
            p
              | We can also add arguments. This alternative definition of 
              code print_string
              | 
can be thought of as a kind of alias for a function name plus arguments:
            //  $MDX skip 
            pre
              code
                span.ocaml-keyword let
                span.ocaml-source  
                span.ocaml-entity-name-function-binding print_string
                span.ocaml-source  
                span.ocaml-keyword-operator =
                span.ocaml-source  
                span.ocaml-source output_string
                span.ocaml-source  
                span.ocaml-source stdout
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-keyword-other-ocaml.punctuation-separator-terminator.punctuation-separator ;
                span.ocaml-source.
                  
                  
            p
              code output_string
              |  takes two arguments (a channel and a string), but since we have only supplied one, it is partially applied. So 
              code print_string
              |  is a function that expects one string argument.
            .pt-10.mt-16.border-t.border-slate-200.lg:grid.lg:grid-cols-3.gap-4.text-slate-500
              .lg:col-span-1
                h2.mt-0.mb-4.text-base.font-semibold.leading-6.lg:text-base Help Improve Our Documentation
                p.text-sm.mt-0.mb-4.max-w-xs All OCaml docs are open source. See something that's wrong or unclear? Submit a pull request.
                a.inline-block.relative.py-1.px-4.font-medium.no-underline.align-middle.bg-transparent.rounded-md.border.border-solid.appearance-none.cursor-pointer.select-none.whitespace-no-wrap.hover:no-underline(href='https://github.com/ocaml/ocaml.org/blob/bed1d58cf746037559c7d4c726ad22c44870c12a/data/tutorials/language/0it_02_functional_programming.md')
                  svg.inline-block.overflow-visible.mr-0.align-text-bottom.select-none(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 16 16', aria-hidden='true', width='16', height='16', style='display: inline-block; user-select: none; vertical-align: text-bottom; overflow: visible; fill: currentcolor')
                    path(fill-rule='evenodd', d='M7.177 3.073L9.573.677A.25.25 0 0110 .854v4.792a.25.25 0 01-.427.177L7.177 3.427a.25.25 0 010-.354zM3.75 2.5a.75.75 0 100 1.5.75.75 0 000-1.5zm-2.25.75a2.25 2.25 0 113 2.122v5.256a2.251 2.251 0 11-1.5 0V5.372A2.25 2.25 0 011.5 3.25zM11 2.5h-1V4h1a1 1 0 011 1v5.628a2.251 2.251 0 101.5 0V5A2.5 2.5 0 0011 2.5zm1 10.25a.75.75 0 111.5 0 .75.75 0 01-1.5 0zM3.75 12a.75.75 0 100 1.5.75.75 0 000-1.5z')
                  | 
Contribute
              .mt-4.lg:mt-0.lg:col-span-1.lg:col-start-3
                h2.mt-0.mb-4.text-base.font-semibold.leading-6.lg:text-base Still need help?
                .text-sm.mb-2
                  a.font-semibold.no-underline.bg-transparent.cursor-pointer.hover:underline(href='https://discuss.ocaml.org/')
                    svg.inline.h-4.w-4(xmlns='http://www.w3.org/2000/svg', fill='none', viewBox='0 0 24 24', stroke='currentColor', aria-hidden='true')
                      path(stroke-linecap='round', stroke-linejoin='round', stroke-width='2', d='M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z')
                    | 
Ask the OCaml Community
                .text-sm.mb-2
                  a.font-semibold.no-underline.bg-transparent.cursor-pointer.hover:underline(href='https://github.com/ocaml/ocaml.org/issues/new')
                    svg.inline.h-4.w-4(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 16 16', aria-hidden='true')
                      path(d='M8 9.5a1.5 1.5 0 100-3 1.5 1.5 0 000 3z')
                      path(fill-rule='evenodd', d='M8 0a8 8 0 100 16A8 8 0 008 0zM1.5 8a6.5 6.5 0 1113 0 6.5 6.5 0 01-13 0z')
                    | 
Open an Issue
          footer.flex.flex-col.gap-7.pt-5.mt-6.border-solid.border-t-[1px].border-[#00000033]
            section.flex.flex-col.gap-6.md:gap-0.md:flex-row.md:justify-between.md:items-end
              div
                a(href='/')
                  img.h-8(src='/_/MDBjN2M4YjIxY2Y1YWExZWE3Njk4M2FiZTg1NWZjNTM/logo-with-name.svg', alt='OCaml')
                p.text-base.leading-6.text-content.dark:text-dark-title.mt-2 Innovation. Community. Security.
              .flex.items-center.gap-4.pr-4
                a.text-title.hover:text-primary(href='https://github.com/ocaml/ocaml')
                  span.sr-only GitHub
                  svg.h-8.w-8(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24', aria-hidden='true')
                    path(fill-rule='evenodd', d='M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z', clip-rule='evenodd')
                a.text-title.hover:text-primary(href='https://discord.gg/cCYQbqN')
                  span.sr-only Discord
                  svg.h-8.w-8(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24', aria-hidden='true')
                    path(fill-rule='evenodd', d='M18.9419 5.29661C17.6473 4.69088 16.263 4.25066 14.8157 4C14.638 4.32134 14.4304 4.75355 14.2872 5.09738C12.7487 4.86601 11.2245 4.86601 9.7143 5.09738C9.57116 4.75355 9.3588 4.32134 9.17947 4C7.73067 4.25066 6.3448 4.6925 5.05016 5.29982C2.43887 9.24582 1.73099 13.0938 2.08493 16.8872C3.81688 18.1805 5.49534 18.9662 7.14548 19.4804C7.55291 18.9196 7.91628 18.3235 8.22931 17.6953C7.63313 17.4688 7.06211 17.1892 6.52256 16.8647C6.6657 16.7586 6.80571 16.6478 6.94098 16.5337C10.2318 18.0729 13.8074 18.0729 17.0589 16.5337C17.1958 16.6478 17.3358 16.7586 17.4774 16.8647C16.9362 17.1908 16.3637 17.4704 15.7675 17.697C16.0805 18.3235 16.4423 18.9212 16.8513 19.4819C18.503 18.9678 20.183 18.1822 21.915 16.8872C22.3303 12.4897 21.2056 8.67705 18.9419 5.29661ZM8.67765 14.5543C7.68977 14.5543 6.87963 13.632 6.87963 12.509C6.87963 11.3859 7.67247 10.4621 8.67765 10.4621C9.68285 10.4621 10.493 11.3843 10.4757 12.509C10.4772 13.632 9.68285 14.5543 8.67765 14.5543ZM15.3223 14.5543C14.3344 14.5543 13.5243 13.632 13.5243 12.509C13.5243 11.3859 14.3171 10.4621 15.3223 10.4621C16.3275 10.4621 17.1376 11.3843 17.1203 12.509C17.1203 13.632 16.3275 14.5543 15.3223 14.5543Z', clip-rule='evenodd')
                a.text-title.hover:text-primary(href='https://twitter.com/ocamllang')
                  span.sr-only Twitter
                  svg.h-8.w-8(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24', aria-hidden='true')
                    path(d='M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84')
                a.text-title.hover:text-primary(href='https://watch.ocaml.org/')
                  span.sr-only Peertube
                  svg.h-8.w-8(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24', aria-hidden='true')
                    path(fill-rule='evenodd', d='M5 2V12L12.4998 7.00047', clip-rule='evenodd')
                    path(fill-rule='evenodd', d='M5 12V22L12.4998 17.0005', clip-rule='evenodd')
                    path(fill-rule='evenodd', d='M12.4998 6.99951V16.9995L19.9995 12', clip-rule='evenodd')
                a.text-title.hover:text-primary(href='/feed.xml')
                  span.sr-only RSS
                  svg.h-8.w-8(xmlns='http://www.w3.org/2000/svg', fill='currentColor', viewBox='0 0 24 24', aria-hidden='true')
                    path(fill-rule='evenodd', d='M15.2692 22H11.3846C11.3846 16.8462 7.11538 12.6154 2 12.6154V8.73077C9.26923 8.73077 15.2692 14.7308 15.2692 22ZM18 22C18 13.2308 10.7692 6 2 6V2C12.9615 2 22 11.0385 22 22H18Z', clip-rule='evenodd')
                    path(fill-rule='evenodd', d='M4.73077 22C6.23893 22 7.46154 20.7774 7.46154 19.2692C7.46154 17.7611 6.23893 16.5385 4.73077 16.5385C3.22261 16.5385 2 17.7611 2 19.2692C2 20.7774 3.22261 22 4.73077 22Z', clip-rule='evenodd')
            section.mt-6.grid.grid-cols-2.mt-6
              .flex.flex-col.gap-1
                .flex.flex-col
                  h5.font-bold.text-base.leading-7.py-2.5.text-black About
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/changelog') Changelog
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/releases') Releases
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/industrial-users') Industrial Users
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/academic-users') Academic Users
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/about') Why OCaml
                .flex.flex-col
                  h5.font-bold.text-base.leading-7.py-2.5.text-black.
                    
                    Ecosystem
                    
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/packages') Packages
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/community') Community
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/blog') Blog
                  a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/jobs') Jobs
              .flex.flex-col
                h5.font-bold.text-base.leading-7.py-2.5.text-black Resources
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/install') Install OCaml
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/docs/get-started') Get Started
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/docs/platform') Platform Tools
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/releases/latest/manual.html') Language Manual
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/releases/latest/api/index.html') Standard Library API
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/books') Books
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/exercises') Exercises
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/papers') Papers
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/play') OCaml Playground
                a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/logo') Logo
            .flex.flex-wrap.gap-x-7.md:justify-between.items-center.py-2.border-solid.border-t-[1px].border-[#00000033].bottom-0.bg-white
              h5.font-bold.text-base.leading-7.py-2.5.text-black Policies
              a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/policies/carbon-footprint') Carbon Footprint
              a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/governance') Governance
              a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/policies/privacy-policy') Privacy
              a.font-normal.text-legacy-lighter.leading-7.py-2.5(href='/policies/code-of-conduct') Code of Conduct
        .hidden.xl:block.top-0.sticky.h-screen.overflow-auto.lg:pt-6
          .w-60.lg:pb-72
            div(x-data='toc', @scroll.window='scrollY = window.scrollY', @resize.window='setTimeout(() => sectionYPositions = computeSectionYPositions($el), 10)', x-init='setTimeout(() => sectionYPositions = computeSectionYPositions($el), 10)')
              .font-semibold.text-gray-500.text-sm.mb-4 On This Page
              ol.leading-6.text-sm.border-l
                li
                  a.text-legacy-default.py-1.pl-2.pr-1.block.transition-colors.border-l-4.border-t-2.border-b-2.border-r-2.border-transparent.rounded(href='#what-is-functional-programming', :class='isWithin(scrollY, "#what-is-functional-programming", sectionYPositions) ? "font-semibold border-l-primary text-primary bg-legacy-primary-200": "hover:text-primary"', :style='isWithin(scrollY, "#what-is-functional-programming", sectionYPositions) ? "letter-spacing: -0.012em;" : ""').
                    
                    What Is Functional Programming?
                    
                li
                  a.text-legacy-default.py-1.pl-2.pr-1.block.transition-colors.border-l-4.border-t-2.border-b-2.border-r-2.border-transparent.rounded(href='#partial-function-applications', :class='isWithin(scrollY, "#partial-function-applications", sectionYPositions) ? "font-semibold border-l-primary text-primary bg-legacy-primary-200": "hover:text-primary"', :style='isWithin(scrollY, "#partial-function-applications", sectionYPositions) ? "letter-spacing: -0.012em;" : ""').
                    
                    Partial Function Applications
                    
                li
                  a.text-legacy-default.py-1.pl-2.pr-1.block.transition-colors.border-l-4.border-t-2.border-b-2.border-r-2.border-transparent.rounded(href='#what-is-functional-programming-good-for', :class='isWithin(scrollY, "#what-is-functional-programming-good-for", sectionYPositions) ? "font-semibold border-l-primary text-primary bg-legacy-primary-200": "hover:text-primary"', :style='isWithin(scrollY, "#what-is-functional-programming-good-for", sectionYPositions) ? "letter-spacing: -0.012em;" : ""').
                    
                    What Is Functional Programming Good For?
                    
                li
                  a.text-legacy-default.py-1.pl-2.pr-1.block.transition-colors.border-l-4.border-t-2.border-b-2.border-r-2.border-transparent.rounded(href='#pure-and-impure-functional-programming', :class='isWithin(scrollY, "#pure-and-impure-functional-programming", sectionYPositions) ? "font-semibold border-l-primary text-primary bg-legacy-primary-200": "hover:text-primary"', :style='isWithin(scrollY, "#pure-and-impure-functional-programming", sectionYPositions) ? "letter-spacing: -0.012em;" : ""').
                    
                    Pure and Impure Functional Programming
                    
                li
                  a.text-legacy-default.py-1.pl-2.pr-1.block.transition-colors.border-l-4.border-t-2.border-b-2.border-r-2.border-transparent.rounded(href='#strictness-vs-laziness', :class='isWithin(scrollY, "#strictness-vs-laziness", sectionYPositions) ? "font-semibold border-l-primary text-primary bg-legacy-primary-200": "hover:text-primary"', :style='isWithin(scrollY, "#strictness-vs-laziness", sectionYPositions) ? "letter-spacing: -0.012em;" : ""').
                    
                    Strictness vs. Laziness
                    
                li
                  a.text-legacy-default.py-1.pl-2.pr-1.block.transition-colors.border-l-4.border-t-2.border-b-2.border-r-2.border-transparent.rounded(href='#boxed-vs-unboxed-types', :class='isWithin(scrollY, "#boxed-vs-unboxed-types", sectionYPositions) ? "font-semibold border-l-primary text-primary bg-legacy-primary-200": "hover:text-primary"', :style='isWithin(scrollY, "#boxed-vs-unboxed-types", sectionYPositions) ? "letter-spacing: -0.012em;" : ""').
                    
                    Boxed vs. Unboxed Types
                    
                li
                  a.text-legacy-default.py-1.pl-2.pr-1.block.transition-colors.border-l-4.border-t-2.border-b-2.border-r-2.border-transparent.rounded(href='#aliases-for-function-names-and-arguments', :class='isWithin(scrollY, "#aliases-for-function-names-and-arguments", sectionYPositions) ? "font-semibold border-l-primary text-primary bg-legacy-primary-200": "hover:text-primary"', :style='isWithin(scrollY, "#aliases-for-function-names-and-arguments", sectionYPositions) ? "letter-spacing: -0.012em;" : ""').
                    
                    Aliases for Function Names and Arguments
                    
    script.
      
      document.addEventListener('alpine:init', () => {
      
          function computeSectionYPositions(toc_el) {
            function get_y(href) {
              let heading = document.getElementById(href.substring(1));
              return heading.getBoundingClientRect().top + window.scrollY - 60;
            }
      
            let sections = {};
      
            let els = toc_el.querySelectorAll("a");
            let l = els.length;
            for (let i=0; i<l; i++) {
              let target_href = els[i].getAttribute("href");
              let next_el_href = i < l-1 ? els[i+1].getAttribute("href") : null;
      
              sections[target_href] = {
                start: get_y(target_href),
                end: next_el_href ? get_y(next_el_href) : null,
              }
            }
      
            return sections;
          }
      
          function isWithin(scrollY, href, sectionYPositions) {
            if (sectionYPositions == null) return false;
            return scrollY > sectionYPositions[href].start
              && (scrollY <= sectionYPositions[href].end || sectionYPositions[href].end == null)
          }
      
          Alpine.data('toc', () => (
            {
              scrollY: window.scrollY,
              sectionYPositions: null,
      
              isWithin,
              computeSectionYPositions,
            }
          ))
        })
      
button.fixed.bottom-8.right-10.md:bottom-[5rem].lg:bottom-[8.37rem].lg:right-[6.5rem].border-0.hidden.focus:outline-none.z-50.rounded-full.shadow-custom.p-4.bg-primary.dark:bg-dark-primary#scrollToTop(onclick='scrollToTop()', title='Scroll to top')
  svg.h-6.w-6(viewBox='0 0 24 24', fill='currentColor', xmlns='http://www.w3.org/2000/svg')
    path(d='M4.5 10.5L12 3M12 3L19.5 10.5M12 3V21', stroke='white', stroke-width='1.5', stroke-linecap='round', stroke-linejoin='round')
script.
  
  function scrollToTop() {
            window.scrollTo(0, 0);
          }
  
          window.onscroll = function() {
            showScrollButton();
          };
  
          function showScrollButton() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
              document.getElementById("scrollToTop").style.display = "block";
            } else {
              document.getElementById("scrollToTop").style.display = "none";
            }
          }
  
