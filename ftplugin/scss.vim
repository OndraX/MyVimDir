:autocmd!
:setlocal tabstop     =2
:setlocal softtabstop =2
:setlocal shiftwidth  =2
:setlocal expandtab

:call AutoLoad()

:let g:sassFilePath="../" 
"Change depending on file structure

":autocmd BufWritePost *.scss execute "AsyncRun sass % " . g:sassFilePath . expand('%:r') . ".css"
:augroup scss
:au!
:au BufWritePost *.scss,*.sass :ALEFix
:augroup END
:syntax on
:AirlineRefresh
let b:ale_fixers= ['stylelint']
"Add variable
:inoremap <space><space>av ggi

