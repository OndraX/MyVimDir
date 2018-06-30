:inoremap \sc {%  %}<esc>hhi
:inoremap \bl {% <++>block %}<esc>hhi 
:inoremap \br {{  }}<esc>hhi

:function! MakeEnv(...)
if a:0>=1
	:call DuplicateAndSurround('Enter environment name:','{% block ',' %}','{% endblock ',' %}',get(a:,1,0))
endif
	:call DuplicateAndSurround('Enter environment name:','{% block ',' %}','{% endblock ',' %}')
:endfunction																	
:inoremap \env <esc>:call MakeEnv()<CR><esc>O
function! lh#visual#selection() abort
  try
    let a_save = @a
    silent! normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction
function! VisualEnv()

:vnoremap \env <esc>:call MakeEnv()
