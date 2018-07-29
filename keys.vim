""Unified file for keybindings from vim to keep vimrc fom getting cluttered
"These two should work to delete whole previous word, as C-Backspace is meant
"to do
:inoremap <C-BS> <esc><C-v>bd<esc>i
:inoremap <C-Del> <esc><C-v>ed<esc>i
"Reloads the .vimrc // consider AutoCmding
:noremap <C-R>e <esc>:so $MYVIMRC<CR>
" Open vimrc and cd to vim folder
:noremap <C-V>i <esc>:e ~/.vim/.vimrc<CR>:lcd %:p:h<CR>

"Searches word under cursor
:nnoremap <Leader>s /\<<C-r><C-w>/>
"Replaces word under cursor
:nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
:imap <Leader>b <CR><+1+><esc>,cci
"":inoremap \uv  \uv{}<++><esc>4hi
"delete line until beginning
:inoremap <C-z> <esc>d0i<del><BS>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
"nmap <silent> <C-Left> :wincmd h<CR>
"nmap <silent> <C-Right> :wincmd l<CR>
"remove tag from DOM tree (keeping contents)
noremap <leader>rt yitvatp  
"remove tag surrounding selection (redundant and unreliable?)
"vnoremap <leader>rst 	
" window split commands
"  window
nmap <leader>S<left>  :topleft  vnew<CR>
nmap <leader>S<right> :botright vnew<CR>
nmap <leader>S<up>    :topleft  new<CR>
nmap <leader>S<down>  :botright new<CR>
"  buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>
:noremap <leader><right> 10<C-w>> 
:noremap <leader><left> 10<C-w>< 

:noremap <leader><up> 10<C-w>+
:noremap <leader><down> 10<C-w>-

":noremap <C-s> :let g:split='vertical'<CR>:Vex
":noremap <C-s> :let g:split='horizontal'<CR>:Sex

:noremap s<C-Down> <C-W>
:noremap \v :e ~/.vim
":cmap q<CR> bd<CR>
":cmap Q<Cr> bd<CR>

:noremap <C-O>p <esc>:e

"Normal mode word, character, line replaces:
"Source: http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines

:nnoremap <silent> gc xph
:nnoremap <silent> gC Xph
:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
:nnoremap <silent> gl ddp
:nnoremap <silent> gL ddkkp
":nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
:nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>
:nnoremap g{ {dap}p{
" Select current do_u_ble or s_i_ngle q_u_ote wrapped sentence
:nnoremap <leader>qi F'v,
:inoremap <leader>qi <esc>F'v,
:nnoremap <leader>qu F"v,
:inoremap <leader>qu <esc>F'v,
" Analogously select _p_arenthetical statements
:nnoremap <leader>p( F(vf)
:inoremap <leader>p( <esc>F(vf)
:nnoremap <leader>p[ F[vf]
:inoremap <leader>p[ <esc>F[vf]
:nnoremap <leader>p{ F{vf}
:inoremap <leader>p{ <esc>F{vf}


"Insert mode maps
:inoremap (( ()<++><esc>4hi
:inoremap {{ {<cr>}<++><esc>kA
:inoremap [[ []<++><esc>4hi

"Convenient switching between buffers // instead of tabs
"TODO: finger out these darned keycodes -- <C-Left> and <C-Right> get buggered
"   by tmux
:noremap [1;5C <esc>:bn<CR>
:noremap [1;5D <esc>:bp<CR>
fun! QuitFileOrVim()
	:if @%==""
		echom("File empty")
		:q!
	:else
		echom("File full")
		:bd
	:endif
:endfun
:noremap <C-x> <esc>:call QuitFileOrVim()<CR>
"Splits line at cursor position leaving cursor in its place
:nnoremap r<CR>  <esc>i<CR><Esc>k$
"Retain selection when tabbing -- allows multiple tabation
:vnoremap << <<<esc>gv
:vnoremap >> >><esc>gv
nnoremap gp `[v`]
