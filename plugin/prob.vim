augroup prob
  au!
  autocmd! BufWritepost,FileWritePost,BufReadPost *.mch call Probcli#Check()
  autocmd! BufNewFile,BufReadPost *.mch set foldmethod=marker
  autocmd! BufReadPost *.mch normal zM
augroup END
