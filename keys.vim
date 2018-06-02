""Unified file for keybindings from vim to keep vimrc fom getting cluttered
"These two should work to delete whole previous word, as C-Backspace is meant
"to do
:inoremap <C-BS> <esc><C-v>bd<esc>i
:inoremap <C-Del> <esc><C-v>ed<esc>i
"Reloads the .vimrc // consider AutoCmding
:noremap <C-R>e <esc>:so $MYVIMRC<CR>
"Convenient switching between buffers // instead of tabs
:noremap <C-Right> <esc>:bnext<CR>
:noremap <C-Left> <esc>:bprev<CR>
"Searches word under cursor
:nnoremap <Leader>s /\<<C-r><C-w>/>
"Replaces word under cursor
:nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
:imap <Leader>b <CR><+1+><esc>,cci
":inoremap \uv  \uv{}<++><esc>4hi
:inoremap <C-x>c <esc>d0i<del><BS>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
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
:noremap <A-M> <esc>:tabe ~/.vim

"Insert mode maps
:inoremap (( ()<++><esc>4hi
:inoremap {{ {}<++><esc>4hi
:inoremap [[ []<++><esc>4hi
