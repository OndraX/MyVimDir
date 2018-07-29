:autocmd!

:call AutoLoad()

:let g:sassFilePath="../" 
"Change depending on file structure

:autocmd BufWritePost *.scss execute "AsyncRun sass % " . g:sassFilePath . expand('%:r') . ".css"
:syntax on
:AirlineRefresh
