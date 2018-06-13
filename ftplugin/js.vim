:nnoremap <F8> preact watch
":vmap 0 V'</*<Esc>'>*/<Esc>
:inoremap <space>> ><esc>vF<yf>pT<i/<esc>ji

if(!exists("*JumpToCSS"))
function! JumpToCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.css"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.css"
    endif
  endif
endfunction
endif

nnoremap <F9> :call JumpToCSS()<CR>

