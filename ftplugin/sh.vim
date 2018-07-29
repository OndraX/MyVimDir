:augroup sh
:autocmd!
:autocmd BufWritePre *.sh if !filereadable(expand('%')) | let b:is_new = 1 | endif
:autocmd BufWritePost *.sh if get(b:, 'is_new', 0) | silent execute '!sudo chmod +x %' | endif
:augroup END
