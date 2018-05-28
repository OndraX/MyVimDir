"Ohledně Latex suite
imap <buffer> ° <Plug>Tex_InsertItemOnThisLine


"Česká jazyková makra 
:inoremap zr<space><space> zrychlení
":inoremap ry<space><space> rychlost
:inoremap pe<space><space> period
:inoremap pů<space><space> působ

"Fyzikální makra
:inoremap \eu \mathrm{e}
:inoremap \cc \mathrm{c}
:inoremap \G \mathrm{G}
:inoremap \ii \mathrm{i}
:inoremap \jj \mathrm{j}

"Latex příkazy
:inoremap \geometry \usepackage[top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}
:inoremap \s<CR> \section{}<++><esc>4hi
:inoremap \ss<CR> \subsection{}<++><esc>4hi
:inoremap \sss<CR> \subsubsection{}<++><esc>4hi
:inoremap \e<CR> \begin{equation*}<CR>\begin{split}<CR><CR>\end{split}<CR>\end{equation*}<++><esc>kki
:inoremap \ni \noindent
:inoremap frac \frac{}{<+2+>}<++><esc>11hi
:inoremap \enum \begin{itemize}<CR>\item{<++>}<CR>\end{itemize}<++><CR><esc>23hi
:inoremap \i \item{}<++><esc>4hi
"Kompilace
:nnoremap \fvl :!fks-vlnka.sh % <CR>
:nnoremap \vl :!vlna % <CR>
:nnoremap \xl :!xelatex % <CR><CR>
:nnoremap \kl :!pdflatex -interaction=nonstopmode % 

"Newfile makra
" memoir newfile fks article zapis
:inoremap \newfile \documentclass[10pt,a4paper]{article}<CR>\usepackage[utf8]{inputenc}<CR>\usepackage[czech]{babel}<CR>\usepackage[T1]{fontenc}<CR>\usepackage{amsmath}<CR>\usepackage{amsfonts}<CR>\usepackage{amssymb}<CR>\usepackage{graphicx}<CR>\usepackage{lmodern}<CR>\begin{document}<CR><CR>\end{document}<esc>ki
:inoremap \fks \documentclass{fkssolpub}<CR>\usepackage[utf8]{inputenc}<CR>\usepackage[T1]{fontenc}<CR>\usepackage{lmodern}<CR>\usepackage[czech]{babel}<CR>\usepackage{graphicx}<CR>\usepackage{fkssugar}<CR>\author{Jindřich Dušek}<CR>\school{Gymnázium Jana Keplera}<CR>\series{}<CR>\begin{document}<CR>\begin{problem}{<++>}<CR><++><CR>\end{problem}<CR>\end{document}<esc>5ki


:inoremap \memoir \documentclass[openright]{memoir}<CR>\usepackage[utf8]{inputenc}<CR>\usepackage[T1]{fontenc}<CR>\usepackage{lmodern}<CR>\usepackage[czech]{babel}<CR>\usepackage{graphicx}<CR>%\usepackage{fkssugar}<CR>\usepackage{lipsum}<CR>\usepackage{geometry}<CR>%\usepackage{fancyhdr}<CR>%\usepackage{dtk-logos}<CR>\usepackage{amsthm}<CR><CR>%-----------Sekce---------------------------<CR>\geometry{a4paper}<CR>\chapterstyle{bianchi}%ALT BIANCHI,VEELO<CR><CR>%-----------Obal knihy---------------------<CR>\usepackage[T1]{fontenc}<CR><CR>\newlength{\drop}<CR><CR>%------------------------------------------<CR>%------------Dělení knihy-------------------------<CR>\addto\captionsczech{\renewcommand*\contentsname{Obsah}}<CR><CR>%---TOC<CR>\addto\captionsczech{\renewcommand*\chaptername{Téma}}  %---Kapitola<CR>\newtheorem*{shrn}{Shrnutí}%----Shrnutí<CR>\newtheorem*{dlzt}{Zapamatujte si}%---Důležité fakty<CR>\newtheorem{esnc}{Věc do testu}%---Potřebnévěcidodlouhedoby<CR><CR>%-------------------------------------------<CR>\clubpenalty=10000<CR>\widowpenalty=10000<CR>\raggedbottom<CR>\author{Jindřich Dušek}<CR>\pagenumbering{arabic}<CR><CR>\begin{document}<CR>\pagestyle{ruled}<CR>%------------Přebal zvenku-------------------------------<CR>%MISSING<CR>%------------Nadpis--------------------------------------<CR>\mainmatter<CR>\thispagestyle{empty}<CR>\newpage<CR>{<CR>\drop=0.1\textheight<CR>\centering<CR><CR>\vspace*{\baselineskip}<CR>\scshape<CR>JINDŘICH ŠIMON DUŠEK<CR>\rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt}<CR>\rule{\textwidth}{0.4pt}\\[\baselineskip]<CR>{\LARGE <++>[0.3\baselineskip]<++>}\\[0.2\baselineskip]<CR>\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt}<CR>\rule{\textwidth}{1.6pt}\\[\baselineskip]<CR>\scshape<CR><++>\par<CR>\vspace*{2\baselineskip}<CR>Upravoval: \\[\baselineskip]<CR>{\Large JINDŘICH ŠIMON DUŠEK  \par}<CR>%{\itshape Organisation \\ Address\par}<CR>\vfill<CR>\begin{center}<CR>{\scshape Nakladatelství JINDRA 2017}%{\large JINDŘICH ŠIMON DUŠEK}<CR>\end{center}<CR>}<CR>%-----------------Prázdný přebal zevnitř-------------------------<CR>\newpage<CR>\thispagestyle{empty}<CR>\phantom{<3}<CR>%-----------------Obsah-----------------------------------------<CR>\newpage<CR>\tableofcontents<CR>%-----------------Prázdná strana---------------------------------<CR>\newpage<CR>\thispagestyle{empty}<CR>\phantom{<3}<CR>%-----------------Předmluva--------------------------------------<CR>\newpage<CR>%\pagestyle{headings}<CR>\addcontentsline{toc}{chapter}{Předmluva}\markboth{Předmluva}{}<CR>\chapter*{<++>}<CR><CR>\end{document}<esc>ggi


:inoremap \article \documentclass[10pt,a4paper]{article}<CR>\usepackage[utf8]{inputenc}<CR>\usepackage[czech]{babel}<CR>\usepackage[T1]{fontenc}<CR>\usepackage{amsmath}<CR>\usepackage{amsfonts}<CR>\usepackage{amssymb}<CR>\usepackage{graphicx}<CR>\usepackage{lmodern}<CR>\usepackage[top = 2cm, bottom = 2cm, left = 2cm, right = 2cm]{geometry}<CR>\usepackage[sc]{mathpazo}<CR>\linespread{1.05}<CR>\usepackage{microtype}<CR>\usepackage{lettrine}<CR>\usepackage{titlesec}<CR>\usepackage{titling}<CR>\setlength{\droptitle}{-4\baselineskip}<CR>\pretitle{\begin{center}\huge\bfseries}<CR>\posttitle{\end{center}}<CR>\renewcommand\thesection{\Roman{section}}<CR>\renewcommand\thesubsection{\arabic{subsection}}<CR>\titleformat{\section}[block]{\large\scshape\centering}{\thesection.}{1em}{}<CR>\titleformat{\subsection}[block]{\large}{\thesubsection.}{1em}{}<CR>\author{\textsc{Jindřich Dušek}\\ GJK}<CR>\title{<++>}<CR>\date{\today}<CR>\begin{document}\maketitle\thispagestyle{empty}<CR><CR>\end{document}


:inoremap \zapis \documentclass[10pt,a4paper]{article}<CR>\usepackage[utf8]{inputenc}<CR>\usepackage[czech]{babel}<CR>\usepackage[T1]{fontenc}<CR>\usepackage{amsmath}<CR>\usepackage{amsfonts}<CR>\usepackage{amssymb}<CR>\usepackage{amsthm}<CR>\usepackage{graphicx}\usepackage{lmodern}<CR>\usepackage[top = 2cm, bottom = 2cm, left = 2cm, right = 2cm]{geometry}<CR>\usepackage{lettrine}<CR>\usepackage{titlesec}<CR>\usepackage{fkssugar}<CR><CR>\usepackage{titling}<CR>\setlength{\droptitle}{-4\baselineskip}<CR>\pretitle{\begin{center}\huge\bfseries}<CR>\posttitle{\end{center}}<CR>\renewcommand\thesection{\Roman{section}}<CR>\renewcommand\thesubsection{\arabic{subsection}}<CR>\titleformat{\section}[block]{\large\scshape\centering}{\thesection.}{1em}{}<CR>\titleformat{\subsection}[block]{\bfseries \large}{\thesubsection.}{1em}{}<CR><CR>\usepackage{fancyhdr}<CR>\pagestyle{fancy}<CR><CR>%----------------------------------------------------------------<CR>%INFO O DOKUMENT<CR>\fancyhead[L]{<+Prilezitost+>}<CR>\fancyhead[C]{\textbf{<+Tema+>}}<CR>\fancyhead[R]{\textsc{Jindřich Dušek}, <+Instituce+>}<CR>%----------------------------------------------------------------<CR>%VLASTNÍ MAKRA<CR>\newtheorem{dlzt}{Důležité:}<CR>\newtheorem{defi}{Definice:}<CR>\begin{document}<CR><++><CR>\end{document}<esc>gg





"Makra na řecká písmena
:inoremap <space>al<space> <space>\alpha 
:inoremap <space>bt<space> <space>\beta 
:inoremap <space>ga<space> <space>\gamma 
:inoremap <space>dl<space> <space>\delta 
:inoremap <space>ep<space> <space>\epsilon 
:inoremap <space>zt<space> <space>\zeta 
:inoremap <space>et<space> <space>\eta 
:inoremap <space>th<space> <space>\theta 
:inoremap <space>io<space> <space>\iota 
:inoremap <space>ka<space> <space>\kappa 
:inoremap <space>mu<space> <space>\mu 
:inoremap <space>nu<space> <space>\nu 
:inoremap <space>xi<space> <space>\xi 
:inoremap <space>pi<space> <space>\pi 
:inoremap <space>rh<space> <space>\rho 
:inoremap <space>sg<space> <space>\sigma 
:inoremap <space>tau<space> <space>\tau 
:inoremap <space>up<space> <space>\upsilon 
:inoremap <space>ph<space> <space>\phi 
:inoremap <space>ch<space> <space>\chi 
:inoremap <space>ps<space> <space>\psi 
:inoremap <space>om<space> <space>\omega 
:inoremap <space>la<space> <space>\lambda 

:inoremap <space>Al<space> <space>\Alpha 
:inoremap <space>Bt<space> <space>\Beta 
:inoremap <space>Ga<space> <space>\Gamma 
:inoremap <space>Dl<space> <space>\Delta 
:inoremap <space>Ep<space> <space>\Epsilon 
:inoremap <space>Zt<space> <space>\Zeta 
:inoremap <space>Et<space> <space>\Eta 
:inoremap <space>Th<space> <space>\Theta 
:inoremap <space>Io<space> <space>\Iota 
:inoremap <space>Ka<space> <space>\Kappa 
:inoremap <space>Mu<space> <space>\Mu 
:inoremap <space>Nu<space> <space>\Nu 
:inoremap <space>Xi<space> <space>\Xi 
:inoremap <space>Pi<space> <space>\Pi 
:inoremap <space>Rh<space> <space>\Rho 
:inoremap <space>Sg<space> <space>\Sigma 
:inoremap <space>Tau<space> <space>\Tau 
:inoremap <space>Up<space> <space>\Upsilon 
:inoremap <space>Ph<space> <space>\Phi 
:inoremap <space>Ch<space> <space>\Chi 
:inoremap <space>Ps<space> <space>\Psi 
:inoremap <space>Om<space> <space>\Omega 
:inoremap <space>La<space> <space>\Lambda 

:inoremap <space>\al<space> <space>$\alpha $
:inoremap <space>\bt<space> <space>$\beta $ 
:inoremap <space>\ga<space> <space>$\gamma $
:inoremap <space>\dl<space> <space>$\delta $
:inoremap <space>\ep<space> <space>$\epsilon $
:inoremap <space>\zt<space> <space>$\zeta $
:inoremap <space>\et<space> <space>$\eta $
:inoremap <space>\th<space> <space>$\theta $
:inoremap <space>\io<space> <space>$\iota $
:inoremap <space>\ka<space> <space>$\kappa $
:inoremap <space>\mu<space> <space>$\mu $
:inoremap <space>\nu<space> <space>$\nu $
:inoremap <space>\xi<space> <space>$\xi $
:inoremap <space>\pi<space> <space>$\pi $
:inoremap <space>\rh<space> <space>$\rho $
:inoremap <space>\sg<space> <space>$\sigma $
:inoremap <space>\tau<space> <space>$\tau $
:inoremap <space>\up<space> <space>$\upsilon $
:inoremap <space>\ph<space> <space>$\phi $
:inoremap <space>\ch<space> <space>$\chi $
:inoremap <space>\ps<space> <space>$\psi $
:inoremap <space>\om<space> <space>$\omega $
:inoremap <space>\la<space> <space>$\lambda $

:inoremap <space>\Al<space> <space>$\Alpha $
:inoremap <space>\Bt<space> <space>$\Beta $
:inoremap <space>\Ga<space> <space>$\Gamma $
:inoremap <space>\Dl<space> <space>$\Delta $
:inoremap <space>\Ep<space> <space>$\Epsilon $
:inoremap <space>\Zt<space> <space>$\Zeta $
:inoremap <space>\Et<space> <space>$\Eta $
:inoremap <space>\Th<space> <space>$\Theta $
:inoremap <space>\Io<space> <space>$\Iota $
:inoremap <space>\Ka<space> <space>$\Kappa $
:inoremap <space>\Mu<space> <space>$\Mu $
:inoremap <space>\Nu<space> <space>$\Nu $
:inoremap <space>\Xi<space> <space>$\Xi $
:inoremap <space>\Pi<space> <space>$\Pi $
:inoremap <space>\Rh<space> <space>$\Rho $
:inoremap <space>\Sg<space> <space>$\Sigma $
:inoremap <space>\Tau<space> <space>$\Tau $
:inoremap <space>\Up<space> <space>$\Upsilon $
:inoremap <space>\Ph<space> <space>$\Phi $
:inoremap <space>\Ch<space> <space>$\Chi $
:inoremap <space>\Ps<space> <space>$\Psi $
:inoremap <space>\Om<space> <space>$\Omega $
:inoremap <space>\La<space> <space>$\Lambda $

:inoremap <C-i> \textit{}<++><esc>4hi
:inoremap <C-b> \textbf{}<++><esc>4hi
:inoremap <C-l> \underline{}<++><esc>4hi
:inoremap <C-D> <esc>ddi
"Todo: make work to italicise current word