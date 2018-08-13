"TODO: remap d and D and dd to delete into named register (d?) and add key to
"paste last deleted ting ((pp | PP)?)
"
autocmd!
syntax on
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set number
set relativenumber
"Automatically multiline comments (/*\n *\n *\n */)
set formatoptions+=r
set autowrite
"hides unused buffers so as to keep undo history
set hidden 
:let mapleader='\'
:nnoremap <F2> :!python3 %<cr>
:set pastetoggle=<F3>
:set hlsearch
"
"Make CapsLock <-> Esc only when in vim
" "Not currently used -- switched permanently in xkbmap options
:let g:switch_caps_esc=0
:if(g:switch_caps_esc == 1)
:   augroup esc_lock
:   autocmd!
:   au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
:   au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
:   augroup END
:endif
"if empty(glob('~/.vim/autoload/plug.vim'))
"	execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
"endif

"Reload current active ftplugin on .vimrc load for quick plugin editing
let g:do_reload_ftplugin=1
:fun! ReloadAll()
	let varft=&ft
	if varft
		execute ":so ".expand('<sfile>:p:h')."/ftplugin/".varft.".vim"
	endif
:endfun 
if g:do_reload_ftplugin
	:call ReloadAll()
endif
"Plugin to load all plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
"For faster xml-like syntax editing 
:command! -nargs=1 Ms execute 'vimgrep /<args>/ **/*.' . expand('%:e')
Plugin 'tpope/vim-fugitive'
Plugin 'OndraX/xml.vim'
Plugin 'scrooloose/nerdtree'

"Change: switched NERDCommenter for tcomment because of motion support and
"embedded syntax
"Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim'

Plugin 'tpope/vim-surround'
"Pretty vim colour scheme
Plugin 'altercation/vim-colors-solarized'
"Pretty vim utility line
Plugin 'bling/vim-airline'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'SirVer/UltiSnips'
Plugin 'honza/vim-snippets'
"YCM install scripts
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PluginInstall! or PluginUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plugin 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"
Plugin 'vim-airline/vim-airline-themes'
"Tern -- javascript code completion
Plugin 'ternjs/tern_for_vim', {'do': 'npm install'}
Plugin 'evidens/vim-twig'
"Run asynchronous commands
Plugin 'skywind3000/asyncrun.vim'
"Faster HTML and JS code expansion
Plugin 'mattn/emmet-vim'
"Plugin 'pangloss/vim-javascript'
"Markdown syntax highlighting
Plugin 'plasticboy/vim-markdown'
"Asynchronous Linting Engine
Plugin 'w0rp/ale'

Plugin 'vim-latex/vim-latex'
Plugin   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for VimPlugin

"Local vimrc
Plugin 'embear/vim-localvimrc'
"HTML live editing
"Plugin 'jaxbot/browserlink.vim'
"Gulp from vim
"Plugin 'KabbAmine/gulp-vim'
"simple template files
Plugin 'ap/vim-templates'
"Recent file list
Plugin 'yegappan/mru'
call vundle#end()
filetype plugin indent on
"Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
"UltiSnips config
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<leader>x"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
"Hotfixes
au BufReadPost,BufNewFile *.tex set filetype=tex "Fix for LaTeX files not getting correct filetype
let g:user_emmet_leader_key=','
execute pathogen#infect()
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/snippets.json')), "\n"))
"" TODO: figure out how to join these two settings
"let g:user_emmet_settings = {
  "\  'javascript.jsx' : {
	"\      'extends' : 'jsx',
	"\  },
    "\  'html' : {
    "\    'snippets': {
    "\      'foo': 'bar',
    "\    },
    "\  },
  "\}
	 let g:user_emmet_settings = {
	 \  'indentation' : '  ',
	 \  'perl' : {
	 \    'aliases' : {
	 \      'req' : 'require '
	 \    },
	 \    'snippets' : {
	 \      'use' : "use strict\nuse warnings\n\n",
	 \      'warn' : "warn \"|\";",
	 \    }
	 \  }
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
set rtp+=~/.vim/plugged/vim-colors-solarized
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

fun! AutoLoad()
	" Triger `autoread` when files changes on disk
	" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	" Notification after file change
	" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
	autocmd FileChangedShellPost *
	  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
endfun
"Convenience function for multiple ftplugin files -- makes a block given the
"surrounding phrases

"TODO: use expression which allows buffer or paste instead of string for name
"cross-platform
:fun! DuplicateAndSurround(phrase,prefix_first,suffix_first,prefix_second,suffix_second,...)
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
:endfun			

let g:phrase='Enter environment name: '
let g:prefix_first='{ '
let g:suffix_first=' }'
let g:prefix_second='{ '
let g:suffix_second=' }'

"Convenience function for sensible extensibility (no need to reprogram
"functionality with optional arguments in every ftplugin, just change globals)
"TODO: support optional arguments
"TODO: a second thing I forgot
:fun! DefaultMakeEnv(...)
call DuplicateAndSurround(g:phrase,g:prefix_first,g:suffix_first,g:prefix_second,g:suffix_second)
:endfun
"Fix html autoindent in php
autocmd FileType php setlocal autoindent
"Load filetype-based .vim/templates:
"Move movement keys to a more convenient position for ATF typing
:noremap j h
:noremap k j
:noremap l k
:noremap ů l
"For English keyboard (slightly dumb)
:noremap ; l 
"Change local directory on buffer load
:autocmd Filetype,BufEnter * :lcd %:p:h

" Alias commands without unwanted behaviour
" via https://stackoverflow.com/a/3879737

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
"Command to find files
" find files and populate the quickfix list

fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=1 FindFile call FindFiles(<q-args>)

:call SetupCommandAlias('f','FindFiles')
" quit if no buffers loaded
:autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif
"Write to readonly file
:call SetupCommandAlias('sudow','w !sudo tee %')
