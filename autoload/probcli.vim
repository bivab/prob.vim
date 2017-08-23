" TODO: Avoid putting focus on quickfixlist or locationlist
" TODO: CHECK opening files in different dirs, java parser only prints
" filename and not the path information
"
if exists("g:loaded_probcli")
    finish
endif

let g:loaded_probcli = 1
set errorformat+=%E\!\ An\ error\ occurred\ \!,%Z\!\ Line:\ %l\ Column:\ %c\ %s\ in\ file:\ %f,%C\!\ source(%m),%C\!\ %m,%-G%.%#
" old error formats
set errorformat+=%E\!\ source(parse_error),%C\!\ [%*\\d\\,%*\\d]\ %m\ in\ file%.%#
set errorformat+=%W\!\ source(type_error),%Z\!\ Line:\ %l\ Column:\ %c\ in\ file\ %f,%C\!\ %m\ in\ file%.%#,%-G\!\ \/%.%#,%C\!\ %m,%-G%.%#

if !exists("g:prob_parser")
  let g:prob_parser="probcli"
end

function! probcli#Check() "{{{1
  let cmd=g:prob_parser ." -p MAX_INITIALISATIONS 0 -p show_full_error_span true ". @%
  if v:version < 800
    call s:ProbSync(cmd)
  else
    call s:ProbAsync(cmd)
  endif
endfunction

function! s:ProbAsync(cmd)
  if exists('g:backgroundProBOutput')
    return
  endif
  "
  " echo "Calling ProB to check file..."
  cclose
  "
  let g:backgroundProBOutput = []
  let l:options = {'close_cb': 'probcli#closeCallback', 'out_io': 'null', 'err_cb': 'probcli#errorCallback', 'err_io': 'buffer'}

	let job = job_start(a:cmd, l:options)
endfunction

function! probcli#errorCallback(channel, msg)
  let g:backgroundProBOutput += [a:msg]
endfunction

function! probcli#closeCallback(channel)
  cgete g:backgroundProBOutput
  cw
  unlet g:backgroundProBOutput
endfunction

function! s:ProbSync(cmd)
  cclose
  "
  let l:prob_lines=split(system(a:cmd .' 1>/dev/null'), '\n')
  cgete l:prob_lines
  cw
endfunction " }}}1
