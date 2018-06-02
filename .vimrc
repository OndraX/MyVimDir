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
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
:imap <Leader>b <CR><+1+><esc>,cci
":inoremap \uv  \uv{}<++><esc>4hi
:inoremap <C-x>c <esc>d0i<del><BS>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <C-Space> <C-W>++
:noremap <A-M> <esc>:tabe ~/.vim
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
