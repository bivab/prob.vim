" TODO: Avoid putting focus on quickfixlist or locationlist
" TODO: CHECK opening files in different dirs, java parser only prints
" filename and not the path information
"
if exists("g:loaded_probcli")
    finish
endif

let g:loaded_probcli = 1

if !exists("g:prob_parser")
  let g:prob_parser="probcli"
end

function! Probcli#Check() "{{{1
  let cmd=g:prob_parser ." -p MAX_INITIALISATIONS 0 ".@%.' 1>/dev/null'
  let l:prob_lines=systemlist(cmd)
  set errorformat=%E\!\ source(parse_error),%C\!\ [%l\\,%c]\ %m " for probcli output
  set errorformat+=%W\!\ source(type_error),%C\ \ in\ file:\ %f,%C\ %f,%Z\!\ Line:\ %l\ Column:\ %c\ in\ file\ %*\\d,%Z\!\ Line:\ %l\ Column:\ %c\ in\ file\ %f,%C\!\ %m,%-G%.%#
  cex l:prob_lines
  cw
endfunction " }}}1
