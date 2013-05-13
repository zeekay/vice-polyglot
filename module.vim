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
            \ 'github:zeekay/xml.vim',
        \ ],
        \ 'jade': [
            \ 'github:digitaltoad/vim-jade',
        \ ],
        \ 'javascript': [
            \ 'github:zeekay/vim-js2coffee',
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
