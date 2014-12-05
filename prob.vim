augroup prob
  au!
  autocmd! BufWritepost,FileWritePost,BufReadPost *.mch call Probcli#Check()
augroup END
