" TODO: fix scoping of identifiers
" TODO: Avoid putting focus on quickfixlist or locationlist
" TODO: CHECK opnening files in different direcotories
" Checking {{{1

" XXX check if overridden
let g:prob_parser="probcli"

function! Probcli#Check()
  let cmd=g:prob_parser ." -p MAX_INITIALISATIONS 0 ".@%.' 1>/dev/null'
  let l:prob_lines=systemlist(cmd)
  set errorformat=%E\!\ source(parse_error),%C\!\ [%l\\,%c]\ %m " for probcli output
  set errorformat+=%W\!\ source(type_error),%C\ \ in\ file:\ %f,%C\ %f,%Z\!\ Line:\ %l\ Column:\ %c\ in\ file\ %*\\d,%Z\!\ Line:\ %l\ Column:\ %c\ in\ file\ %f,%C\!\ %m,%-G%.%#
  cex l:prob_lines
  cw
endfunction " }}}1
