:autocmd!

:call AutoLoad()

:let g:sassFilePath="../" "Change depending on file structure

:autocmd BufWritePost * execute "AsyncRun sass % " . g:sassFilePath . expand('%:r') . ".css"
