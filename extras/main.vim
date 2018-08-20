" ==================[.vimrc safe testing env]=================
"Highlight overflown column in an unobtrusive way
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)
"Visual back/forward search (hide all but current found instance)
    nnoremap <silent> n   n:call HLNext(0.3)<cr>
    nnoremap <silent> N   N:call HLNext(0.3)<cr>

    function! HLNext (blinktime)
        highlight BlackOnBlack ctermfg=lightgray ctermbg=230
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let hide_pat = '\%<'.lnum.'l.'
                \ . '\|'
                \ . '\%'.lnum.'l\%<'.col.'v.'
                \ . '\|'
                \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
                \ . '\|'
                \ . '\%>'.lnum.'l.'
        let ring = matchadd('BlackOnBlack', hide_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
    endfunction
"
" Damian Conway Plugin configs.
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

vmap <silent> <expr>  <LEFT>   DVB_Drag('left')
vmap <silent> <expr>  <RIGHT>  DVB_Drag('right')
vmap <silent> <expr>  <DOWN>   DVB_Drag('down')
vmap <silent> <expr>  <UP>     DVB_Drag('up')
vmap <silent> <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1
" inoremap <expr>  <C-K>   BDG_GetDigraph()
