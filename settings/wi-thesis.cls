% ============================================================
% Version simplifiée pour une thèse en français
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{settings/wi-thesis}

% Options principales
\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\SetupKeyvalOptions{family=wi,prefix=wi@}
\DeclareStringOption[]{language}[french]
\DeclareStringOption[]{thesis}[master]
\DeclareStringOption[]{chair}[csssa]
\ProcessKeyvalOptions*

\LoadClass[a4paper,12pt]{report}

% Packages essentiels
\RequirePackage[a4paper,left=2.9cm, top=2.9cm, bottom=2.3cm, right=2.9cm,includefoot,heightrounded]{geometry}
\usepackage{tikz}           % pour dessiner des graphiques avec TikZ
\usepackage{pgfplots}       % pour tracer des graphiques avec PGFPlots (basé sur TikZ)
\pgfplotsset{compat=1.18}  % définit la version de compatibilité de PGFPlots
\usepackage[titles]{tocloft}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[french]{babel}
\RequirePackage{booktabs}
\RequirePackage{lipsum}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\usetikzlibrary{arrows.meta}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{eurosym}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{algorithmicx}
\RequirePackage{minted}
\usemintedstyle{tango}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{enumitem}
\RequirePackage{lmodern}
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{MnSymbol,wasysym}
\setlength{\headheight}{14.49999pt}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{afterpage}
\RequirePackage[strict]{changepage}
\RequirePackage{longtable}
\RequirePackage[flushmargin,hang,bottom]{footmisc}
\usepackage{listings}
\usepackage{tabularx} 
\usepackage{csquotes}


% Bibliographie (IEEE, backend biber)
\RequirePackage[
    style=numeric,
    backend=biber,
    sorting=none,
    hyperref=true,
    url=true
]{biblatex}

\newenvironment{backmatter}{
    \setlength{\parskip}{10pt}%
    \newgeometry{left=2.9cm, top=2.9cm, bottom=2cm, right=2.9cm}
    \pagestyle{fancyplain}
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \clearpage{\thispagestyle{empty}\cleardoublepage}
}



% Table des matières
\let\default@tableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
    \newgeometry{left=3cm, top=3cm, bottom=2.5cm, right=3cm}
    \clearpage%
    \phantomsection%
    \setlength{\parskip}{0pt}%
    \setcounter{tocdepth}{2}%
    \default@tableofcontents%
    \thispagestyle{empty}
    \restoregeometry{}
    \pagebreak
}

% Listes des figures et tableaux
\let\default@listoffigures\listoffigures
\renewcommand{\listoffigures}{
    \newgeometry{left=3cm, top=3cm, bottom=2.5cm, right=3cm}
    \clearpage%
    \phantomsection%
    \setlength{\parskip}{0pt}%
    \setlength{\cftfigindent}{0pt}
    \default@listoffigures%
    \thispagestyle{fancy}
    \restoregeometry{}
    \pagebreak
}
\let\default@listoftables\listoftables
\renewcommand{\listoftables}{
    \newgeometry{left=3cm, top=3cm, bottom=2.5cm, right=3cm}
    \clearpage%
    \phantomsection%
    \setlength{\parskip}{0pt}%
    \setlength{\cfttabindent}{0pt}
    \default@listoftables%
    \thispagestyle{fancy}
    \restoregeometry{}
    \pagebreak
}

% En-têtes
\newcommand{\niceHeader}{
    \pagestyle{fancyplain}
    \fancyhf{}
    \fancyfoot[C]{\small \thepage}
    \fancyhead[R]{\footnotesize \leftmark}
    \renewcommand{\headrulewidth}{0.1pt}
    \assignpagestyle{\chapter}{fancyplain}
}

% Type de thèse
\newcommand{\thesistype}[1]{\def\@thesistype{#1}}
\thesistype{{\scshape{\Large Master}}}

% Formatage des sections
\onehalfspacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{\baselineskip}%
\titleformat{\chapter}[block]{\normalfont\Large\bfseries}{\makebox[1cm][l]{\thechapter}}{0pt}{}{}
\titlespacing*{\chapter}{0pt}{-16pt plus 2pt minus 2pt}{8pt plus 2pt minus 2pt}
\titleformat{\section}[block]{\normalfont\bfseries}{\makebox[1cm][l]{\thesection}}{0pt}{}
\titlespacing*{\section}{0pt}{12pt plus 2pt minus 2pt}{6pt plus 2pt minus 2pt}
\titleformat{\subsection}[block]{\normalfont\bfseries}{\makebox[1cm][l]{\thesubsection}}{8pt}{}
\titlespacing{\subsection}{0pt}{12pt plus 2pt minus 2pt}{6pt plus 2pt minus 2pt}

% Numérotation des équations
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

% Commandes pour la page de titre
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\titleThesis}[1]{\def\@title{#1}}
\newcommand{\dateThesis}[1]{\def\@date{#1}}

% Page de titre simplifiée
\newcommand{\frenchTitle}{
  \newgeometry{left=2cm, top=3cm, bottom=3cm, right=2cm}
  \begin{titlepage}
    \centering
    \vspace{0.5cm}
    {\scshape\Large Université}\par
    {\scshape\large Département}\par
    \vspace{1cm}
    {\textcolor{gray}{\rule{0.9\textwidth}{0.5mm}}}
    \vspace*{0.5cm}
    \begin{center}
      \begin{minipage}{0.9\textwidth}
        \begin{center}
          {\LARGE\parindent0pt
          \begin{spacing}{1.13}
            \@title
          \end{spacing}}\par
        \end{center}
      \end{minipage}
    \end{center}
    \vspace*{-0.3cm}
    {\textcolor{gray}{\rule{0.9\textwidth}{0.5mm}}}\par
    \vspace{1.5cm}
    \begin{center}
        \begin{minipage}{0.75\textwidth}
            \begin{center}
                \@thesistype
            \end{center}
        \end{minipage}
    \end{center}
    \vspace{0.5cm}
    {Présenté par}\par
    \vspace{0.5cm}
    {\LARGE{\@author}}\par
    \vspace{-0.3cm}
  \end{titlepage}
  \restoregeometry{}
}

% Déclaration d’authenticité simplifiée
\newcommand{\frenchDeclaration}{
  \newpage
  \thispagestyle{empty}
  \Large{\textbf{Déclaration d’authenticité}}
  \vskip 1em
  \normalsize{
    Je déclare que ce mémoire intitulé \textit{\@title} est mon travail original et indépendant. Toutes les sources utilisées sont citées correctement.
    \vskip 1em
    \@date
    \vskip 3em
    \hrulefill \\
    \@author
  }
  \vspace*{\fill}
}

% Configuration hyperref
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  menucolor=black,
  urlcolor=black,
}

\newcommand{\id}[1]{\textbf{ID:} #1}
\newcommand{\field}[1]{\textbf{Field:} #1}
\newcommand{\city}[1]{\textbf{City:} #1}
\newcommand{\professor}[1]{\textbf{Professor:} #1}
\newcommand{\supervisor}[1]{\textbf{Supervisor:} #1}