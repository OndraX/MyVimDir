"===================[CONCEAL]====================================================
setlocal conceallevel=2
"A nonretarded conceal cursor:
set concealcursor=c

:syntax keyword conceal Alpha conceal cchar=Α 
:syntax keyword conceal Beta conceal cchar=Β 
:syntax keyword conceal Gamma conceal cchar=Γ 
:syntax keyword conceal Delta conceal cchar=Δ 
:syntax keyword conceal Epsilon conceal cchar=Ε 
:syntax keyword conceal Zeta conceal cchar=Ζ 
:syntax keyword conceal Eta conceal cchar=Η 
:syntax keyword conceal Theta conceal cchar=Θ 
:syntax keyword conceal Iota conceal cchar=Ι 
:syntax keyword conceal Kappa conceal cchar=Κ 
:syntax keyword conceal Lambda conceal cchar=Λ 
:syntax keyword conceal Mu conceal cchar=Μ 
:syntax keyword conceal Nu conceal cchar=Ν 
:syntax keyword conceal Xi conceal cchar=Ξ 
:syntax keyword conceal Omicron conceal cchar=Ο 
:syntax keyword conceal Pi conceal cchar=Π 
:syntax keyword conceal Rho conceal cchar=Ρ 
:syntax keyword conceal Sigma conceal cchar=Σ 
:syntax keyword conceal Tau conceal cchar=Τ 
:syntax keyword conceal Upsilon conceal cchar=Υ 
:syntax keyword conceal Ypsilon conceal cchar=Υ 
:syntax keyword conceal Phi conceal cchar=Φ 
:syntax keyword conceal Chi conceal cchar=Χ 
:syntax keyword conceal Psi conceal cchar=Ψ 
:syntax keyword conceal Omega conceal cchar=Ω 

:syntax keyword conceal alpha conceal cchar=α
:syntax keyword conceal beta conceal cchar=β   
:syntax keyword conceal gamma conceal cchar=γ 
:syntax keyword conceal delta conceal cchar=δ 
:syntax keyword conceal epsilon conceal cchar=ε 
:syntax keyword conceal zeta conceal cchar=ζ 
:syntax keyword conceal eta conceal cchar=η 
:syntax keyword conceal theta conceal cchar=θ 
:syntax keyword conceal iota conceal cchar=ι 
:syntax keyword conceal kappa conceal cchar=κ 
:syntax keyword conceal lambda conceal cchar=λ 
:syntax keyword conceal mu conceal cchar=μ 
:syntax keyword conceal nu conceal cchar=ν 
:syntax keyword conceal xi conceal cchar=ξ 
:syntax keyword conceal omicron conceal cchar=ο 
:syntax keyword conceal pi conceal cchar=π 
:syntax keyword conceal rho conceal cchar=ρ 
"End of word sigma
:syntax match conceal /sigma/ conceal cchar=σ 
:syntax match SigmaEnd contained "sigma" conceal cchar=ς
:syntax match SigmaSpace contained " " conceal cchar= 
:syntax match   FinalSigma "sigma " contains=SigmaEnd,SigmaSpace
:syntax cluster sigmaGroup add=SigmaEnd,SigmaSpace
:syntax keyword conceal tau conceal cchar=τ 
"TODO: fix regex for [uy]psilon -- works in search not in conceal keyword; in
"the meantime, this:
:syntax keyword conceal upsilon conceal cchar=υ 
:syntax keyword conceal ypsilon conceal cchar=υ 
:syntax keyword conceal phi conceal cchar=φ 
:syntax keyword conceal chi conceal cchar=χ 
:syntax keyword conceal psi conceal cchar=ψ 
:syntax keyword conceal omega conceal cchar=ω 
function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
    else
        setlocal conceallevel=0
    endif
endfunction

nnoremap <silent> <C-c><C-y> :call ToggleConcealLevel()<CR>
"==================[SEARCH RESULT HIGHLIGHTING]==================================


    function! HLNext (blinktime)
        highlight BlackOnBlack ctermfg=black ctermbg=black
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

    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>
