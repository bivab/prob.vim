augroup prob
  au!
  autocmd! BufWritepost,FileWritePost,BufReadPost *.mch call probcli#Check()
augroup END
