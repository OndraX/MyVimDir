autocmd!
filetype plugin on
syntax on
execute pathogen#infect()
set autoindent
set noexpandtab
set tabstop=8
:let mapleader=','
:nnoremap <F2> :!python3 %<cr>
:set pastetoggle=<F3>
au BufReadPost,BufNewFile *.tex set filetype=tex
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
augroup  linter
	autocmd!
	autocmd BufWritePost *.js AsyncRun -post=checktime eslint --fix % 
augroup END
":command RunServer AsyncRun preact watch
" Map Ctrl-Backspace to delete the previous word in insert mode.
:inoremap <C-BS> <esc><C-v>bd<esc>i
:inoremap <C-Del> <esc><C-v>ed<esc>i
:noremap <C-R>e <esc>:so $MYVIMRC<CR>
:noremap <C-Right> <esc>:tabn<CR>
:noremap <C-Left> <esc>:tabp<CR>
:noremap <C-w> <esc>:tabe ~/.vim
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
:imap <Leader>b <CR><+1+><esc>,cci
":inoremap \uv  \uv{}<++><esc>4hi
:inoremap <C-x>c <esc>d0i<del><BS>
