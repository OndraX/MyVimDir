"Syntax highlighting shim -- TODO: move to after directory
"	in proper place
:hi VertSplit ctermbg=none ctermfg=gray
:hi SignColumn ctermbg=none 
:hi LineNr ctermbg=none ctermfg=gray
:hi SpecialKey ctermbg=none ctermfg=254

:hi Search cterm=NONE ctermfg=none ctermbg=254

:hi CursorLine cterm=NONE ctermbg=229

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

:set fillchars+=vert:\| 
"Used to be │
:set fillchars+=fold:―
:set listchars=tab:│﮲,extends:›,precedes:‹,nbsp:·,trail:·
:set list
