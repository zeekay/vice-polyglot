if !exists('g:vice.polyglot')
    let g:vice.polyglot = {}
endif

if !exists('g:vice.polyglot.enable_ghcmod')
    let g:vice.polyglot.enable_ghcmod = 0
endif

" Indent {{{
    au FileType xml,xhtml,htmldjango setl shiftwidth=4
    au FileType css,html,less,coffee,haml,stylus,jade,javascript setl shiftwidth=2
" }}}

" Enable omnicomplete {{{
    au FileType c          setl omnifunc=ccomplete#Complete
    au FileType coffee     setl omnifunc=javascriptcomplete#CompleteJS
    au FileType css        setl omnifunc=csscomplete#CompleteCSS
    au FileType php        setl omnifunc=phpcomplete#CompletePHP
    au FileType python     setl omnifunc=pythoncomplete#Complete
    au FileType ruby,eruby setl omnifunc=rubycomplete#Complete
    au FileType xhtml,html setl omnifunc=htmlcomplete#CompleteTags
    au FileType xml        setl omnifunc=xmlcomplete#CompleteTags

    if !exists('g:vice.neocompletion.enable_tern')
        au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
    endif
" }}}


" Detect filetypes {{{
    au BufNewFile,BufRead *.as                          setl filetype=actionscript
    au BufNewFile,BufRead *.bats                        setl filetype=bats syntax=sh | call vice#ForceActivateAddon('github:vim-scripts/bats.vim')
    au BufNewFile,BufRead *.coffee,Cakefile             setl filetype=coffee | call vice#ForceActivateAddon('github:zeekay/vim-cake')
    au BufNewFile,BufRead *.go                          setl filetype=go
    au BufNewFile,BufRead *.haml                        setl filetype=haml
    au BufNewFile,BufRead *.idr                         setl filetype=idris
    au BufNewFile,BufRead *.jade                        setl filetype=jade
    au BufNewFile,BufRead *.json                        setl filetype=json
    au BufNewFile,BufRead *.less                        setl filetype=less
    au BufNewFile,BufRead *.moon                        setl filetype=moon
    au BufNewFile,BufRead *.mustache,*.handlebars,*.hbs setl filetype=html syntax=mustache | call vice#ForceActivateAddon('github:mustache/vim-mustache-handlebars')
    au BufNewFile,BufRead *.purs                        setl filetype=purescript
    au BufRead,BufNewFile *.rs                          setl filetype=rust
    au BufNewFile,BufRead *.sass                        setl filetype=sass
    au BufNewFile,BufRead *.sbt,*.scala                 setl filetype=scala
    au BufNewFile,BufRead *.scala.html                  setl filetype=html syntax=play2-html | call vice#ForceActivateAddons(['github:derekwyatt/vim-scala', 'github:gre/play2vim'])
    au BufNewFile,BufRead *.scss                        setl filetype=scss
    au BufNewFile,BufRead *.styl                        setl filetype=stylus
    au BufNewFile,BufRead *.{brainfuck,bf}              setl filetype=brainfuck
    au BufNewFile,BufRead *.{ex,exs}                    setl filetype=elixir
    au BufNewFile,BufRead *.{md,mkd,mkdn,mark*}         setl filetype=markdown
    au BufNewFile,BufRead nginx.conf,/etc/nginx/*       setl filetype=nginx
    au BufNewFile,BufRead /usr/local/etc/nginx/*        setl filetype=nginx
    au BufNewFile,BufRead /etc/pmta/config              setl filetype=config
" }}}

call vice#Extend({
    \ 'ft_addons': {
        \ 'actionscript': [
            \ 'github:endel/actionscript.vim',
        \ ],
        \ 'brainfuck': [
           \ 'github:vim-scripts/brainfuck-syntax'
        \ ],
        \ 'css\|sass\|scss\|stylus': [
            \ 'github:hail2u/vim-css3-syntax',
            \ 'github:skammer/vim-css-color',
        \ ],
        \ 'clojure': [
            \ 'github:guns/vim-clojure-static',
            \ 'github:kien/rainbow_parentheses.vim',
            \ 'github:vim-scripts/paredit.vim',
            \ 'github:tpope/vim-fireplace',
        \ ],
        \ 'coffee': [
            \ 'github:kchmck/vim-coffee-script',
        \ ],
        \ 'elixir': [
            \ 'github:elixir-lang/vim-elixir',
        \ ],
        \ 'go': [
            \ 'github:fatih/vim-go',
        \ ],
        \ 'haml\|sass\|scss': [
            \ 'github:tpope/vim-haml',
        \ ],
        \ 'help': [
            \ 'github:juanpabloaj/help.vim',
	    \ ],
        \ 'html\|xhtml\|xml': [
            \ 'github:zeekay/vim-html2jade',
            \ 'github:othree/html5.vim',
        \ ],
        \ 'idris': [
            \ 'github:idris-hackers/idris-vim',
        \ ],
        \ 'jade': [
            \ 'github:digitaltoad/vim-jade',
        \ ],
        \ 'javascript': [
            \ 'github:zeekay/vim-js2coffee',
            \ 'github:jelera/vim-javascript-syntax',
            \ 'github:pangloss/vim-javascript',
        \ ],
        \ 'json': [
            \ 'github:elzr/vim-json',
        \ ],
        \ 'less': [
            \ 'github:groenewege/vim-less',
        \ ],
        \ 'lua': [
            \ 'github:xolox/vim-misc',
            \ 'github:xolox/vim-lua-ftplugin',
            \ 'github:xolox/vim-lua-inspect',
        \ ],
        \ 'lua\|ruby\|sh\|vim\|zsh': [
            \ 'github:tpope/vim-endwise',
        \ ],
        \ 'markdown': [
            \ 'github:zeekay/vim-instant-markdown',
            \ 'github:tpope/vim-markdown',
        \ ],
        \ 'moon': [
            \ 'github:leafo/moonscript-vim',
        \ ],
        \ 'nginx': [
            \ 'github:evanmiller/nginx-vim-syntax',
        \ ],
        \ 'perl': [
            \ 'github:c9s/perlomni.vim',
        \ ],
        \ 'play2-html': [
            \ 'github:derekwyatt/vim-scala',
            \ 'github:gre/play2vim',
        \ ],
        \ 'purescript': [
            \ 'github:raichoo/purescript-vim',
        \ ],
        \ 'python': [
            \ 'github:hynek/vim-python-pep8-indent',
            \ 'github:hdima/python-syntax',
            \ 'github:jmcantrell/vim-virtualenv',
        \ ],
        \ 'rust': [
            \ 'github:wting/rust.vim',
            \ 'github:ebfe/vim-racer',
        \ ],
        \ 'scala': [
            \ 'github:derekwyatt/vim-scala',
        \ ],
        \ 'scss': [
            \ 'github:cakebaker/scss-syntax.vim',
        \ ],
        \ 'stylus': [
            \ 'github:wavded/vim-stylus',
        \ ],
    \ },
\ })

" CoffeeScript {{{
    au FileType coffee setl foldmethod=indent nofoldenable
    au FileType coffee setl nosmartindent

    au FileType coffee nnoremap <buffer> <leader>r :call vice#polyglot#run('coffee -s', 'stdin')<cr>
    au FileType coffee nnoremap <buffer> <leader>c :CoffeeCompile vert<cr>
    au FileType coffee nnoremap <buffer> <leader>t :!cake test<cr>

    hi link coffeeFunction  Function
    hi link coffeeMethod    Function
    hi link coffeeObjAssign Statement
" }}}

" Go {{{
    let g:go_fmt_autosave = 0

    au FileType go nnoremap <buffer> gd <Plug>(go-def)
    au FileType go nnoremap <buffer> <Leader>ds <Plug>(go-def-split)
    au FileType go nnoremap <buffer> <Leader>dt <Plug>(go-def-tab)
    au FileType go nnoremap <buffer> <Leader>dv <Plug>(go-def-vertical)
    au FileType go nnoremap <buffer> <Leader>gb <Plug>(go-doc-browser)
    au FileType go nnoremap <buffer> <Leader>d <Plug>(go-doc)
    au FileType go nnoremap <buffer> <Leader>i <Plug>(go-info)
    au FileType go nnoremap <buffer> <Leader>gv <Plug>(go-doc-vertical)
    au FileType go nnoremap <buffer> <leader>b  <Plug>(go-build)
    au FileType go nnoremap <buffer> <leader>t  <Plug>(go-test)
    au FileType go nnoremap <buffer> <leader>r  :call vice#polyglot#run('go run')<cr>
" }}}

" Haskell {{{
    au FileType haskell call vice#ForceActivateAddons([
        \ 'github:wlangstroth/vim-haskell',
    \ ])

    au FileType haskell nnoremap <buffer> <leader>r :call vice#polyglot#run('runhaskell', 'stdin')<cr>

    if g:vice.polyglot.enable_ghcmod
        au FileType haskell call vice#ForceActivateAddons([
            \ 'github:eagletmt/ghcmod-vim',
        \ ])

        au FileType haskell nnoremap <buffer> te :call vice#polyglot#ghcmod_expand()<cr>
        au FileType haskell nnoremap <buffer> ti :call vice#polyglot#ghcmod_info()<cr>
        au FileType haskell nnoremap <buffer> tn :call vice#polyglot#ghcmod_type_insert()<cr>
        au FileType haskell nnoremap <buffer> tt :call vice#polyglot#ghcmod_type()<cr>

        au BufWritePost *.hs call vice#polyglot#ghcmod_check_and_lint()
        au CursorMoved  *.hs call vice#polyglot#ghcmod_type_clear()

        let g:ghcmod_hlint_options = ['--ignore=Redundant $']
        let g:syntastic_haskell_checkers = []
    endif
" }}}

" HTML {{{
    let html_no_rendering=1
" "}}}

" Javascript {{{
    au FileType javascript hi link javascriptBraces Text |
                         \ hi link javascriptParens Text |
                         \ hi link javaScriptOpSymbols Text |
                         \ hi link javaScriptEndColons Text |
                         \ hi link javaScriptExceptions Statement |
                         \ hi link javaScriptPrototype Text

    au FileType javascript command! -buffer Uglify silent! :%!uglifyjs
    au FileType javascript nnoremap <buffer> <leader>r :call vice#polyglot#run('node')<cr>
" }}}

" JSON {{{
    au FileType json setl nobomb
    au FileType json setl conceallevel=0
" }}}

" Lua/Moonscript {{{
    au FileType lua  nnoremap <buffer> <leader>r :call vice#polyglot#run('lua', 'stdin')<cr>
    au FileType moon nnoremap <buffer> <leader>r :call vice#polyglot#run('moon')<cr>
" }}}

" Markdown {{{
    au FileType markdown set textwidth=80
" }}}

" Python {{{
    let g:python_highlight_all = 1
    let g:python_show_sync = 1
    let g:python_print_as_function = 1
    let g:virtualenv_auto_activate = 1
    let g:virtualenv_directory = $VIRTUALENVS_DIR
    au FileType python setlocal nosmartindent
    au FileType python setlocal nocindent
" }}}

" Stylus {{{
    au FileType stylus call vice#polyglot#bebop_reload()
" }}}
