:nnoremap \ll :! xdg-open *.html <CR>
"Autocompletes tag (obsolete with emmet)
":inoremap <space>> ><esc>vF<yf>pT<i/<esc>ji
:inoremap ,C <!--{{--><CR><++><CR><!--}}-->
:inoremap ,c <!--<++>-->
let g:comment_pre='<!--'
let g:comment_post='-->'

function! MakeEnv()
	let prea= '<!--/BEGIN '
	let posta='/-->'
	let preb='<!--/END '
	let postb='/-->'
	:call DuplicateAndSurround(g:phrase,prea,posta,preb,postb)
	:endfunc

:imap \env <esc>:call MakeEnv()<CR><esc>O

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
:set autoread
