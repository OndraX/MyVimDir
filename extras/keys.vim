""Unified file for keybindings from vim to keep vimrc fom getting cluttered
"These two should work to delete whole previous word, as C-Backspace is meant
"to do
:map <space> <leader>
:inoremap <C-BS> <esc><C-v>db<esc>i
:inoremap <C-Del> <esc><C-v>de<esc>i

"Get vim home directory ( y tho )
if has('win32') || has ('win64')
	let g:vimhome=$VIM."/vimfiles"
else
	let g:vimhome=$HOME."/.vim"
endif

"Reloads the .vimrc // consider AutoCmding
:noremap <C-R>e <esc>:so $MYVIMRC<CR>
" Open vimrc and cd to vim folder
" :noremap <C-V>i <esc>:e ~/.vim/.vimrc<CR>:lcd %:p:h<CR>
" Shortcuts to .vim directory
:call SetupCommandAlias('V','e '.g:vimhome)
:call SetupCommandAlias('VR','e '.$MYVIMRC)
:call SetupCommandAlias('S','vsplit '.g:vimhome)
:call SetupCommandAlias('s','split '.g:vimhome)

" Open relevant ftplugin
:fun! ToFTPlugin()
	let varft=&ft
	execute ":e ".g:vimhome."/ftplugin/".varft.".vim"
:endfun!
:noremap <C-F>p <esc>:call ToFTPlugin()<CR>


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
"vnoremap <leader>rst 	
" window split commands
"  window
:noremap <leader><right> 10<C-w>> 
:noremap <leader><left> 10<C-w>< 

:noremap <leader><up> 10<C-w>+
:noremap <leader><down> 10<C-w>-

:noremap <C-s> :let g:split='vertical'<CR>:Vex
":noremap <C-s> :let g:split='horizontal'<CR>:Sex

":cmap Q<Cr> bd<CR>

:noremap <C-O>p <esc>:e

"Normal mode word, character, line replaces:
"Source: http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines

"Opfunc to swap using motion:
"<leader>s to swap forward, <leader>S to swap backward

fun! SwapMotion(is_forward)

endfun

nnoremap ,s <esc>:set opfunc=SwapMotion(1)<CR>g@
nnoremap ,S <esc>:set opfunc=SwapMotion(0)<CR>g@

"Swap letters, words
:nnoremap <silent> sc xph
:nnoremap <silent> sC Xph
:nnoremap <silent> sw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
:nnoremap <silent> sl ddp
:nnoremap <silent> sL ddkkp
:nnoremap <silent> sl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
:nnoremap <silent> sr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>
:nnoremap s{ {dap}p{
" Select current do_u_ble or s_i_ngle q_uote wrapped sentence
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
" circular windows navigation
:nnoremap <Tab>   <esc>:bn<CR>
:nnoremap <S-Tab> <esc>:bp<CR>


"TODO: finger out these darnwed keycodes -- <C-Left> and <C-Right> get buggered
"   by tmux
:noremap [1;5C <c-W>w
:noremap [1;5D <c-W>W
" jump list
" :nmap <c-j> <c-i>
" :nmap <c-k> <c-o>
:nmap <c-j> i<c-j>
"[Obsoleted by autocommand -- bit which quits vim entirely on empty buffer,
"otherwise just destroys current buffer
"fun! QuitFileOrVim()
	":if @%==""
		"echom("File empty")
		":q!
	":else
		"echom("File full")
		":bd
	":endif
":endfun
"Smart window quitting (in conjunction with autocommand):
"	-quits window and vim if was last window
"	-deletes buffer keeping split
:noremap <C-c> <esc>:bp \|bd #<CR>
"Splits line at cursor position leaving cursor in its place
:nnoremap r<CR>  <esc>i<CR><Esc>k$
"Retain selection when tabbing -- allows multiple tabation
:vnoremap << <<<esc>gv
:vnoremap >> >><esc>gv
"search for visually selected text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
vnoremap /% y:%s/\V<C-r>=escape(@",'/\')<CR>//g<left><left>
"G_et p_revious visual selection
nnoremap gp `[v`]
:inoremap <leader>ul <esc>yyPj^v$r-
:inoremap <leader>uu <esc>yyPj^v$r=
"pop { from JSON-et-al scope tree (keeping contents)
:inoremap <leader>p{ <esc>yi{va{p
:nnoremap <leader>p{ yi{va{p
"pop tag from DOM tree (keeping contents)
noremap <leader>pt yitvatp
"Underline current line
:map <leader>uu yyp^v$r=cj
:imap <leader>uu <esc>yyp^v$r=cj
:map <leader>ui yyp^v$r-cj
:imap <leader>ui <esc>yyp^v$r-cj

"" Toggles
:nnoremap <leader>tl ALEToggle<CR>
"" Silly stuff
:inoremap <space><space>fl ☙
:inoremap <space><space>fr ❧
:inoremap <space><space>fm ❦
" Inserts double-space "insert leader sequence" in a *very* hackish way
:inoremap <space><space>SS space>space><esc>bi<<esc>2bi<<esc>3ei

"l_ock s_crolling in parallel windows (toggle)
:nmap <leader>ls :scb!<CR>
"c_enter s_croll within a window (toggle)
:nmap <leader>cs let &scrolloff=999-&scrolloff<CR>
"Make visually nice one-line comment
:imap <space><space>cl <esc>80i=<esc>gcc^20ůR[
" :imap <space><space>cl <esc>80i=<esc>gcc^20lR[
" Trim unwanted whitespace
:nnoremap <silent> <leader>tw :%s/\s\+$//e<cr>
" Fix no whitespace after : and , indentation error
:nnoremap <silent> <leader>fi :%s/\([:,]\)\(\S\)/\1 \2/g
"Scroll only screen, not cursor
:set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
