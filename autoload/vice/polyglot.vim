func! vice#polyglot#bebop_reload()
    au InsertLeave * :w!
endf

func! vice#polyglot#clojure()
    if exists('g:vice_polyglot_clojure_loaded') | return | endif
    let g:vice_polyglot_clojure_loaded = 1
endf

func! vice#polyglot#play2html()
    if exists('g:vice_polyglot_play2html_loaded') | return | endif
    let g:vice_polyglot_play2html_loaded = 1

    call vice#ForceActivateAddon('github:othree/html5.vim')
    call vice#ForceActivateAddon('github:derekwyatt/vim-scala')
    call vice#ForceActivateAddon('github:gre/play2vim')
endf

func! vice#polyglot#mustache()
    if exists('g:vice_polyglot_mustache_loaded') | return | endif
    let g:vice_polyglot_mustache_loaded = 1

    call vice#ForceActivateAddon('github:mustache/vim-mustache-handlebars')
endf

let g:go_tools = {
    \ 'errcheck':  'github.com/kisielk/errcheck',
    \ 'gocode':    'github.com/nsf/gocode',
    \ 'godef':     'code.google.com/p/rog-go/exp/cmd/godef',
    \ 'goimports': 'github.com/bradfitz/goimports',
    \ 'golint':    'github.com/golang/lint/golint',
    \ 'oracle':    'code.google.com/p/go.tools/cmd/oracle',
\ }

func! vice#polyglot#install_go_tools()
    let urls = []

    if len(a:000) > 0
        for cmd in a:000
            call add(urls, g:go_tools[cmd])
        endfor
    else
        let urls = values(g:go_tools)
    endif

    for url in urls
        let cmd = 'go get -u '.url
        echo cmd
        silent! exe '!'.cmd
    endfor
endf

func! vice#polyglot#go()
    " This will try to install any missing tools
    let gopath = expand('~/go')
    let cmds = keys(g:go_tools)

    for cmd in cmds
        let bin = gopath.'/bin/'.cmd
        if !filereadable(bin)
            call vice#polyglot#install_go_tools(cmd)
        endif
        exe 'let g:go_'.cmd.'_bin="'.bin.'"'
    endfor
endf

func! vice#polyglot#run_stdin(cmd)
    call vice#standard_issue#signature_disable()

    " save position
    normal! HmX``

    " get buffer
    let lines = getbufline(bufnr('%'), 1, '$')

    " close preview window
    pclose

    " open preview window
    botright pedit [Run]

    " switch to preview window
    wincmd p

    " put bufferlines
    call append(0, lines)
    normal 1d_

    " run command passing buffer as stdin
    silent! exe '%!'.a:cmd

    " set some modes
    setl ro
    setl buftype=nofile
    setl bufhidden=hide
    setl nobuflisted
    nnoremap <buffer> q :pclose<cr>

    " return to original window
    wincmd p

    " restore position
    normal! `Xt``

    " clear mark
    normal mX

    call vice#standard_issue#signature_enable()
endf

func! vice#polyglot#run_file(cmd)
    " Save as temporary file
    let path = fnamemodify(resolve(expand('%:p')), ':h')
    let filename = expand('%:t')
    let tmp_filename = path.'/'.'tmp-'.filename
    exe 'write '.tmp_filename

    " open preview window
    botright pedit [Run]

    " switch to preview window
    wincmd p

    " Run command passign temporary file as
    silent! exe '%!'.a:cmd.' '.tmp_filename

    " set some modes
    setl ro
    setl buftype=nofile
    setl bufhidden=hide
    setl nobuflisted
    nnoremap <buffer> q :pclose<cr>

    " return to original window
    wincmd p

    " Delete temporary file
    call delete(tmp_filename)
endf
