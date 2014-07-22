func! vice#polyglot#bebop_reload()
    au InsertLeave * :w!
endf

func! vice#polyglot#run(cmd)
  echo a:cmd
  let expanded_cmd = a:cmd

  for part in split(a:cmd, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmd = substitute(expanded_cmd, part, expanded_part, '')
     endif
  endfor

  botright new

  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap

  call setline(1, 'You entered:    ' . a:cmd)
  call setline(2, 'Expanded Form:  ' .expanded_cmd)
  call setline(3,substitute(getline(2),'.','=','g'))

  execute '$read !'. expanded_cmd
  setlocal nomodifiable
  1
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

func! vice#polyglot#run_coffee()
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
