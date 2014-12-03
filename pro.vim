" TODO: fix scoping of identifiers
" TODO: Avoid putting focus on quickfixlist or locationlist

let g:prob_parser="probcli"

" Checking {{{1
function! Prob#Check()
  let cmd=g:prob_parser ." -p MAX_INITIALISATIONS 0 ".@%.' 1>/dev/null'
  let l:prob_lines=systemlist(cmd)
  if len(l:prob_lines) == 0
    cgete []
    lclose
    return
  endif

  set errorformat=%E\!\ source(parse_error),%C\!\ [%l\\,%c]\ %m " for probcli output
  set errorformat+=%W\!\ source(type_error),%C\ \ in\ file:\ %f,%C\ %f,%Z\!\ Line:\ %l\ Column:\ %c\ in\ file\ %*\\d,%Z\!\ Line:\ %l\ Column:\ %c\ in\ file\ %f,%C\!\ %m,%-G%.%#
  lgete l:prob_lines
  lope
endfunction " }}}1


augroup prob
  au! " clear autocommand in this group
  autocmd! BufWritepost,FileWritePost,BufReadPost *.mch call Prob#Check()
augroup END
