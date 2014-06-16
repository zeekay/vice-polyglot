" Indent {{{
    au FileType xml,xhtml,htmldjango setl shiftwidth=4
    au FileType css,html,coffee,haml,stylus,jade,javascript setl shiftwidth=2
" }}}

" Enable omnicomplete {{{
    au FileType c setl omnifunc=ccomplete#Complete
    au FileType coffee setl omnifunc=javascriptcomplete#CompleteJS
    au FileType css setl omnifunc=csscomplete#CompleteCSS
    au FileType php setl omnifunc=phpcomplete#CompletePHP
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType ruby,eruby setl omnifunc=rubycomplete#Complete
    au FileType xhtml,html setl omnifunc=htmlcomplete#CompleteTags
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags
    if !exists('g:vice.neocompletion.enable_tern')
        au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
    endif
" }}}

" Detect filetypes {{{
    au BufNewFile,BufRead *.as setl filetype=actionscript
    au BufNewFile,BufRead *.coffee,Cakefile setl filetype=coffee
    au BufNewFile,BufRead *.go setl filetype=go
    au BufNewFile,BufRead *.haml setl filetype=haml
    au BufNewFile,BufRead *.jade setl filetype=jade
    au BufNewFile,BufRead *.json setl filetype=json
    au BufNewFile,BufRead *.sass setl filetype=sass
    au BufNewFile,BufRead *.scss setl filetype=scss
    au BufNewFile,BufRead *.sbt,*.scala setl filetype=scala
    au BufNewFile,BufRead *.styl setl filetype=stylus
    au BufNewFile,BufRead *.{brainfuck,bf} setl filetype=brainfuck
    au BufNewFile,BufRead *.{ex,exs} setl filetype=elixir
    au BufNewFile,BufRead *.{md,mkd,mkdn,mark*} setl filetype=markdown
    au BufNewFile,BufRead /etc/nginx/* setl filetype=nginx
    au BufNewFile,BufRead /etc/pmta/config setl filetype=config
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
        \ 'haskell': [
            \ 'github:wlangstroth/vim-haskell',
            \ 'github:zeekay/haskellmode-vim',
            \ 'github:bitc/vim-hdevtools',
        \ ],
        \ 'help': [
            \ 'github:juanpabloaj/help.vim',
	    \ ],
        \ 'html\|xhtml\|xml': [
            \ 'github:othree/html5.vim',
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
        \ 'lua\|ruby\|sh\|vim\|zsh': [
            \ 'github:tpope/vim-endwise',
        \ ],
        \ 'markdown': [
            \ 'github:zeekay/vim-instant-markdown',
            \ 'github:tpope/vim-markdown',
        \ ],
        \ 'mustache': [
            \ 'github:mustache/vim-mustache-handlebars',
        \ ],
        \ 'nginx': [
            \ 'github:evanmiller/nginx-vim-syntax',
        \ ],
        \ 'perl': [
            \ 'github:c9s/perlomni.vim',
        \ ],
        \ 'python': [
            \ 'github:hynek/vim-python-pep8-indent',
            \ 'github:hdima/python-syntax',
            \ 'github:jmcantrell/vim-virtualenv',
        \ ],
        \ 'scala': [
            \ 'github:derekwyatt/vim-scala',
        \ ],
        \ 'play2-html': [
            \ 'github:derekwyatt/vim-scala',
            \ 'github:gre/play2vim',
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
" }}}

" Go {{{
    let g:go_fmt_autofmt = 0
" }}}

" Haskell {{{
    let g:haddock_browser="open"
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
" }}}

" JSON {{{
    au FileType json setl nobomb
    au FileType json setl conceallevel=0
" }}}

" Markdown {{{
    au FileType markdown set textwidth=80
" }}}

" Python {{{
    let g:python_highlight_all = 1
    let g:python_show_sync = 1
    let g:python_print_as_function = 1
    let g:virtualenv_auto_activate = 1
    let g:virtualenv_directory = '~/ve'
    au FileType python setlocal nosmartindent
    au FileType python setlocal nocindent
" }}}

" Hacks {{{
    au BufNewFile,BufRead *.scala.html call vice#polyglot#play2html() | setl filetype=html syntax=play2-html
    au BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs call vice#polyglot#mustache() | setl filetype=html syntax=mustache
    au FileType clojure call vice#polyglot#clojure()
    au BufNewFile,BufRead *.bats call vice#ForceActivateAddon('github:vim-scripts/bats.vim') | setl filetype=bats syntax=sh
" }}}

au FileType stylus call vice#polyglot#bebop_reload()

au FileType javascript command! Uglify silent! :%!uglifyjs

au FileType coffee nnoremap <buffer> <leader>c :CoffeeCompile vert<cr>
au FileType coffee nnoremap <buffer> <leader>t :!cake test<cr>

func! <SID>RunCoffee()
    " save position
    normal! Hmx``

    " close preview window
    pclose

    " open preview window
    botright pedit [Run]

    " get buffer
    let lines = getbufline(bufnr('%'), 1, '$')

    " jump to preview window
    wincmd p

    " put bufferlines
    call append(0, lines)
    " normal 1d_

    " eval buffer with coffeescript
    silent! exec "%!coffee -s"

    " set some modes
    setlocal ro
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal nobuflisted

    " return to original window
    wincmd p

    " restore position
    normal! `xzt``
endf

au FileType coffee nnoremap <buffer> <leader>r :call <SID>RunCoffee()<cr>

au FileType go nnoremap <buffer> <leader>r :w<cr>:GoRun<cr>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <leader>r call vice#polyglot#run("runhaskell ".expand("%"))
