"TODO: remap d and D and dd to delete into named register (d?) and add key to
"paste last deleted ting ((pp | PP)?)
"
autocmd!
filetype plugin on
syntax on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set number
"hides unused buffers so as to keep undo history
set hidden 
set conceallevel=1
:let mapleader=','
:nnoremap <F2> :!python3 %<cr>
:set pastetoggle=<F3>
"
"Make CapsLock also Esc only when in vim
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
"
if empty(glob('~/.vim/autoload/plug.vim'))
	execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"Reload current active ftplugin on .vimrc load for quick plugin editing
let g:do_reload_ftplugin=1
:function! ReloadAll()
	let varft=&ft
	if varft
		execute ":so ".expand('<sfile>:p:h')."/ftplugin/".varft.".vim"
	endif
:endfunction 
if g:do_reload_ftplugin
	:call ReloadAll()
endif
"Plug to load all plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"For faster xml-like syntax editing 
:command! -nargs=1 Ms execute 'vimgrep /<args>/ **/*.' . expand('%:e')
Plug 'tpope/vim-fugitive'
Plug 'OndraX/xml.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
"Pretty vim colour scheme
Plug 'altercation/vim-colors-solarized'
"Pretty vim utility line
Plug 'bling/vim-airline'
Plug 'tmux-plugins/vim-tmux-focus-events'
"YCM install scripts
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"
Plug 'vim-airline/vim-airline-themes'
"Tern -- javascript code completion
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'evidens/vim-twig'
"Run asynchronous commands
Plug 'skywind3000/asyncrun.vim'
"Faster HTML and JS code expansion
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
"Markdown syntax highlighting
Plug 'plasticboy/vim-markdown'
"Asynchronous Linting Engine
Plug 'w0rp/ale'
Plug 'vim-latex/vim-latex'
"Local vimrc
Plug 'embear/vim-localvimrc'
"HTML live editing
Plug 'jaxbot/browserlink.vim'
"Gulp from vim
Plug 'KabbAmine/gulp-vim'
call plug#end()
"Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1

"Hotfixes
au BufReadPost,BufNewFile *.tex set filetype=tex "Fix for LaTeX files not getting correct filetype
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
autocmd BufWritePost *.js AsyncRun -post=checktime eslint --fix % 
":command RunServer AsyncRun preact watch
" Map Ctrl-Backspace to delete the previous word in insert mode.

" omnifuncs
"
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
"
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif 

" Load separate keybindings file
"
:source ~/.vim/keys.vim
" Conceal replacement patterns also offloaded into another file for size
"
:source ~/.vim/conceal.vim

"Colorscheme settings
"
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized

:nmap <leader>uv<CR> <esc>:%s/"\(.\{-}\)"/\\uv{\1}/g
:nmap \dc<CR> <esc>:%s/\%TC\:ignore/\%__IGNORE__/g<CR>:%s/\%TC\:endignore/%__ENDIGNORE__/g
:nmap \rc<CR> <esc>:%s/"\(.\{-}\)"/\\uv{\1}/g

"Localvimrc anti-annoyment settings
"
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0

"Autoreload settings for Chrome Dev Tools
"

function! AutoLoad()
	" Triger `autoread` when files changes on disk
	" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	" Notification after file change
	" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
	autocmd FileChangedShellPost *
	  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
endfunction
"Convenience function for multiple ftplugin files -- makes a block given the
"surrounding phrases

"TODO: use expression which allows buffer or paste instead of string for name
"cross-platform
:function! DuplicateAndSurround(phrase,prefix_first,suffix_first,prefix_second,suffix_second,...)
let name = ''
if a:0==0
	let line = getline('.')
	call inputsave()
	let name = input(a:phrase)
	call inputrestore()
else
	let name=get(a:,1,0)
endif
let lineone=a:prefix_first .name.a:suffix_first
let linetwo=a:prefix_second.name.a:suffix_second
put =lineone
put =linetwo
:endfunction			

let g:phrase='Enter environment name: '
let g:prefix_first='{ '
let g:suffix_first=' }'
let g:prefix_second='{ '
let g:suffix_second=' }'

"Convenience function for sensible extensibility (no need to reprogram
"functionality with optional arguments in every ftplugin, just change globals)
"TODO: support optional arguments
"TODO: a second thing I forgot
:function! DefaultMakeEnv(...)
call DuplicateAndSurround(g:phrase,g:prefix_first,g:suffix_first,g:prefix_second,g:suffix_second)
:endfunction
"Fix html autoindent in php
autocmd FileType php setlocal autoindent
"Move movement keys to a more convenient position for ATF typing
:noremap j h
:noremap k j
:noremap l k
:noremap ů l
"For English keyboard (slightly dumb)
:noremap ; l 
