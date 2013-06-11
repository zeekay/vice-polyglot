call vice#Extend({
    \ 'ft_addons': {
        \ 'actionscript': [
            \ 'github:endel/actionscript.vim',
        \ ],
        \ 'brainfuck': [
           \   'github:vim-scripts/brainfuck-syntax'
        \ ],
        \ 'css\|sass\|scss\|stylus': [
            \ 'github:hail2u/vim-css3-syntax',
        \ ],
        \ 'clojure': [
            \ 'github:tpope/vim-foreplay',
            \ 'github:tpope/vim-classpath',
            \ 'github:guns/vim-clojure-static',
        \ ],
        \ 'coffee': [
            \ 'github:kchmck/vim-coffee-script',
        \ ],
        \ 'go': [
            \ 'github:jnwhiteh/vim-golang',
        \ ],
        \ 'haml\|sass\|scss': [
            \ 'github:tpope/vim-haml',
        \ ],
        \ 'haskell': [
            \ 'github:wlangstroth/vim-haskell',
            \ 'github:zeekay/haskellmode-vim',
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
        \ 'lua\|ruby\|sh\|vim\|zsh': [
            \ 'github:tpope/vim-endwise',
        \ ],
        \ 'markdown': [
            \ 'github:tpope/vim-markdown',
            \ 'github:zeekay/vim-instant-markdown',
        \ ],
        \ 'nginx': [
            \ 'github:evanmiller/nginx-vim-syntax'
        \ ],
        \ 'python': [
            \ 'github:zeekay/python.vim',
        \ ],
        \ 'php': [
            \ 'github:spf13/PIV',
        \ ],
        \ 'stylus': [
            \ 'github:wavded/vim-stylus',
        \ ],
    \ },
\ })

" Indent {{{
    au FileType xml,xhtml,htmldjango setl shiftwidth=4
    au FileType css,html,coffee,haml,stylus,jade,javascript setl shiftwidth=2
" }}}

" Enable omnicomplete {{{
    au FileType c setl omnifunc=ccomplete#Complete
    au FileType coffee,javascript setl omnifunc=javascriptcomplete#CompleteJS
    au FileType css setl omnifunc=csscomplete#CompleteCSS
    au FileType php setl omnifunc=phpcomplete#CompletePHP
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType ruby,eruby setl omnifunc=rubycomplete#Complete
    au FileType xhtml,html setl omnifunc=htmlcomplete#CompleteTags
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags
" }}}

" Detect filetypes {{{
    au BufNewFile,BufRead *.as set filetype=actionscript
    au BufNewFile,BufRead *.clj set filetype=clojure
    au BufNewFile,BufRead *.coffee,Cakefile set filetype=coffee
    au BufNewFile,BufRead *.go set filetype=go
    au BufNewFile,BufRead *.haml set filetype=haml
    au BufNewFile,BufRead *.jade set filetype=jade
    au BufNewFile,BufRead *.json set filetype=json
    au BufNewFile,BufRead *.sass set filetype=sass
    au BufNewFile,BufRead *.scss set filetype=scss
    au BufNewFile,BufRead *.styl set filetype=stylus
    au BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
" }}}

" Clojure {{{
    let g:vimclojure#SplitPos = "left"
    let g:vimclojure#HighlightBuiltins = 1
    let g:vimclojure#HighlightContrib = 1
    let g:vimclojure#ParenRainbow = 1
    let g:vimclojure#DynamicHighlighting = 1
    if executable('ng')
        let g:vimclojure#WantNailgun = 1
    endif
" }}}

" CoffeeScript {{{
    au FileType coffee setl foldmethod=indent nofoldenable
    au FileType coffee setl nosmartindent
    au FileType coffee map <buffer><leader>c :CoffeeCompile watch vertical<cr>
    " au FileType coffee map <buffer><leader>r :CoffeeRun<cr>
" }}}

" Haskell {{{
    let g:haddock_browser="open"
" }}}

" Javascript {{{
    au FileType javascript hi link javascriptBraces Text |
                         \ hi link javascriptParens Text |
                         \ hi link javaScriptOpSymbols Text |
                         \ hi link javaScriptEndColons Text |
                         \ hi link javaScriptExceptions Statement |
                         \ hi link javaScriptPrototype Text

    " Run current file in node for quick evaluation
    func! s:RunInNode()
        w
        !node %
    endf

    if executable('node')
        au FileType javascript command! RunInNode call s:RunInNode()
        au FileType javascript map <buffer><leader>r :RunInNode<cr>
    endif
" }}}

" JSON {{{
    au FileType json setl nobomb
    au FileType json setl conceallevel=0
" }}}

" Markdown {{{
    au FileType markdown set textwidth=80
" }}}

" Python {{{
    let g:virtualenv_directory = expand($HOME."/ve")
    let g:python_highlight_all = 1
    let g:python_show_sync = 1
    let g:python_print_as_function = 1
    let g:pythonmode_enable_django = 1
    let g:pythonmode_enable_rope = 0
    let g:ropevim_vim_completion = 1
    let g:ropevim_extended_complete = 1
    " au FileType python setl foldmethod=syntax
" }}}

" VimL {{{
    au FileType vim nnoremap <buffer><leader>r :w<cr> <bar> :so %<cr>
" }}}

" Brainfuck {{{
    au BufRead,BufNewFile *.bf set filetype=brainfuck
    au BufRead,BufNewFile *.brainfuck set filetype=brainfuck
" }}}
