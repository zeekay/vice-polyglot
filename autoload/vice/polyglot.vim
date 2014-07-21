" filetype specific mappings
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
