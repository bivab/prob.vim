augroup prob
  au!
  autocmd! BufWritepost,FileWritePost,BufReadPost *.mch,*.rmch call probcli#Check()
augroup END
