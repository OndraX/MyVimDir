set conceallevel=1
set concealcursor=ni

:syntax match conceal /Alpha/ conceal cchar=Α 
:syntax match conceal /Beta/ conceal cchar=Β 
:syntax match conceal /Gamma/ conceal cchar=Γ 
:syntax match conceal /Delta/ conceal cchar=Δ 
:syntax match conceal /Epsilon/ conceal cchar=Ε 
:syntax match conceal /Zeta/ conceal cchar=Ζ 
:syntax match conceal /Eta/ conceal cchar=Η 
:syntax match conceal /Theta/ conceal cchar=Θ 
:syntax match conceal /Iota/ conceal cchar=Ι 
:syntax match conceal /Kappa/ conceal cchar=Κ 
:syntax match conceal /Lambda/ conceal cchar=Λ 
:syntax match conceal /Mu/ conceal cchar=Μ 
:syntax match conceal /Nu/ conceal cchar=Ν 
:syntax match conceal /Xi/ conceal cchar=Ξ 
:syntax match conceal /Omicron/ conceal cchar=Ο 
:syntax match conceal /Pi/ conceal cchar=Π 
:syntax match conceal /Rho/ conceal cchar=Ρ 
:syntax match conceal /Sigma/ conceal cchar=Σ 
:syntax match conceal /Tau/ conceal cchar=Τ 
:syntax match conceal /Upsilon/ conceal cchar=Υ 
:syntax match conceal /Phi/ conceal cchar=Φ 
:syntax match conceal /Chi/ conceal cchar=Χ 
:syntax match conceal /Psi/ conceal cchar=Ψ 
:syntax match conceal /Omega/ conceal cchar=Ω 

:syntax match conceal /alpha/ conceal cchar=α
:syntax match conceal /beta/ conceal cchar=β   
:syntax match conceal /gamma/ conceal cchar=γ 
:syntax match conceal /delta/ conceal cchar=δ 
:syntax match conceal /epsilon/ conceal cchar=ε 
:syntax match conceal /zeta/ conceal cchar=ζ 
:syntax match conceal /eta/ conceal cchar=η 
:syntax match conceal /theta/ conceal cchar=θ 
:syntax match conceal /iota/ conceal cchar=ι 
:syntax match conceal /kappa/ conceal cchar=κ 
:syntax match conceal /lambda/ conceal cchar=λ 
:syntax match conceal /mu/ conceal cchar=μ 
:syntax match conceal /nu/ conceal cchar=ν 
:syntax match conceal /xi/ conceal cchar=ξ 
:syntax match conceal /omicron/ conceal cchar=ο 
:syntax match conceal /pi/ conceal cchar=π 
:syntax match conceal /rho/ conceal cchar=ρ 
"End of word sigma
:syntax match conceal /sigma\s/ conceal cchar=ς
:syntax match conceal /sigma/ conceal cchar=σ 
:syntax match conceal /tau/ conceal cchar=τ 
:syntax match conceal /upsilon/ conceal cchar=υ 
:syntax match conceal /phi/ conceal cchar=φ 
:syntax match conceal /chi/ conceal cchar=χ 
:syntax match conceal /psi/ conceal cchar=ψ 
:syntax match conceal /omega/ conceal cchar=ω 

function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
    else
        setlocal conceallevel=0
    endif
endfunction

nnoremap <silent> <C-c><C-y> :call ToggleConcealLevel()<CR>
