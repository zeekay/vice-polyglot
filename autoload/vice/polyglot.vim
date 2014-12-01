func! vice#polyglot#run(cmd, ...)
    if !executable(split(a:cmd)[0])
        echoerr 'Please install '.a:cmd
        return
    endif

    " Disable vim-signature temporarily
    call vice#standard_issue#signature_disable()

    " close preview window
    pclose

    " open preview window
    botright pedit [Run]

    if a:0 == 1 && a:1 == 'stdin'
        call vice#polyglot#run_stdin(a:cmd)
    else
        call vice#polyglot#run_file(a:cmd)
    endif

    " re-enable vim-signature.
    call vice#standard_issue#signature_enable()
endf

func! vice#polyglot#run_stdin(cmd)
    " save position
    normal! HmX``

    " get buffer
    let lines = getbufline(bufnr('%'), 1, '$')

    " switch to preview window
    silent! wincmd P

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
endf

func! vice#polyglot#run_file(cmd)
    " Save as temporary file
    let path = fnamemodify(resolve(expand('%:p')), ':h')  " head
    let filename = expand('%:t')  " tail
    let tmp_filename = path.'/'.'tmp-'.filename
    exe 'write '.tmp_filename

    " switch to preview window
    silent! wincmd P

    " Run command passign temporary file as
    exe '%!'.a:cmd.' '.shellescape(tmp_filename)

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

func! s:disable_check_and_write()
    let b:vice_ghcmod_disable_check = 1
    write
    unlet b:vice_ghcmod_disable_check
endf

func! vice#polyglot#ghcmod_expand()
    call s:disable_check_and_write()
    GhcModExpand
endf

func! vice#polyglot#ghcmod_info()
    call s:disable_check_and_write()
    GhcModInfo
endf

func! vice#polyglot#ghcmod_type()
    call s:disable_check_and_write()
    GhcModType
endf

func! vice#polyglot#ghcmod_type_clear()
    if exists('b:ghcmod_type')
        GhcModTypeClear
    endif
endf

func! vice#polyglot#ghcmod_type_insert()
    call s:disable_check_and_write()
    GhcModTypeInsert
    write
endf

func! vice#polyglot#ghcmod_check_and_lint()
    if !exists('b:vice_ghcmod_disable_check')
        GhcModCheckAndLintAsync
    endif
endf

func! vice#polyglot#rust()
    setlocal omnifunc=racer#Complete
    nnoremap <buffer> gd :call racer#JumpToDefinition()<CR>
endf
