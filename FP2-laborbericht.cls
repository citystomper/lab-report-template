\NeedsTeXFormat{LaTeX2e} % Require LaTeX2e format

\RequirePackage{silence}
\WarningFilter{latex}{You have requested document class}
\WarningFilter{latex}{Command \showhyphens has changed.}

\ProvidesClass{FP2-laborbericht} % Provide the class "FP1A-laborbericht"

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass all options to the base class
\ProcessOptions\relax % Process class options

\LoadClass{article} % Load the base "article" class

\usepackage{etoolbox}

% Default variables for header information (can be overridden in the main document)
\newcommand{\partnerone}{Partner 1}
\newcommand{\partnertwo}{Partner 2}
\newcommand{\groupnumber}{XX}
\newcommand{\experimentdate}{Experiment date}
\newcommand{\supervisor}{Supervisor}
\newcommand{\experimenttitle}{Experiment name}
\newcommand{\experimentsubtitle}{}
\newcommand{\experimentcode}{XXX}
\newcommand{\labcourse}{Lab course}

\newcommand{\maybesubtitle}{%
  \ifdefempty{\experimentsubtitle}{}{\texorpdfstring{\\}{ }\experimentsubtitle}%
}

% Define the title and date for the report
\title{\textbf{\experimentcode:\ \experimenttitle}\maybesubtitle\texorpdfstring{\\}{ }Laborbericht \labcourse}

% Command to output additional header information on the title page
\newcommand{\headerInformation}{%
  \begin{center}
    \begin{tabular}{l r}
      \textbf{Versuchstermin:} & \experimentdate \\
      \textbf{Gruppennummer:}      & \groupnumber \\
      \textbf{Autoren:}            & \partnerone, \\
                                   & \partnertwo \\
      \textbf{Betreuung:}         & \supervisor
    \end{tabular}
    \vskip 1.5em
  \end{center}
}

% Titelseite: Titel, Datum, Institution, Team-Tabelle, alles an einer Stelle
\renewcommand{\@maketitle}{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 1em%
    {\large \@date \par}%
    \vskip 0.5em%
    Fakultät für Physik \\%
    Ludwig-Maximilians-Universität München%
  \end{center}
  \vskip 1.5em
  \headerInformation
  \par
  \vskip 1em}

% Save the original \maketitle command from the base class
\let\stdmaketitle\maketitle

% Redefine \maketitle: Bewertungsbögen einbinden, Seitenzähler zurücksetzen,
% dann den (jetzt vollständigen) Titelblock über \stdmaketitle -> \@maketitle ausgeben
\renewcommand{\maketitle}{
  %\includepdf{assets/grade-sheets/FP1A-grade-sheet-1.pdf} % Change file name
  %\includepdf{assets/grade-sheets/FP1A-grade-sheet-2.pdf} % Change file name
  \setcounter{page}{1}
  \stdmaketitle
}


\usepackage[ngerman, shorthands=off]{babel}
\usepackage{microtype}
\usepackage{titlesec}
% Überschriften im Flattersatz
\titleformat{\section}
  {\raggedright\normalfont\Large\bfseries}
  {\thesection}{1em}{}

\titleformat{\subsection}
  {\raggedright\normalfont\large\bfseries}
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\raggedright\normalfont\normalsize\bfseries}
  {\thesubsubsection}{1em}{}

\usepackage{amsfonts}
\usepackage{amsmath}
\usepackage{amssymb}


% Fonts (requires LuaLaTeX or XeLaTeX)
\usepackage{fontspec}
\usepackage{unicode-math}
\setmainfont{STIX Two Text}
\setmathfont{STIX Two Math}
\setmonofont{JetBrains Mono}[Scale=MatchLowercase]

\usepackage{booktabs}
\usepackage{multirow}
\usepackage{subcaption}


\usepackage{enumitem}
\setlist{partopsep=0pt, topsep=0pt}
\renewcommand{\labelenumi}{\arabic{enumi}.}

\setlength{\parindent}{0pt} % Disable paragraph indentation

\usepackage{graphicx}
\usepackage{float}
\usepackage{pdfpages}
\usepackage{lastpage} % Reference the last page number


\usepackage[range-units=repeat, multi-part-units=brackets, range-phrase={ bis },
separate-uncertainty, locale=DE, per-mode=symbol-or-fraction]{siunitx}


\usepackage{listings}

% No syntax highlighting, just a monospaced, framed, line-numbered code block. Leaving "language" unset means listings won't try to detect keywords/comments/strings, so everything renders in basicstyle uniformly.
\lstset{
    basicstyle=\ttfamily\small,
    numberstyle=\tiny,
    numbersep=5pt,
    breaklines=true,
    showstringspaces=false,
    frame=single
}

\usepackage[most]{tcolorbox}
\newtcolorbox{codeblockbox}{
  enhanced, breakable,
  colback=black!4, colframe=black!4,
  boxrule=0pt, arc=2pt,
  left=8pt, right=8pt, top=6pt, bottom=6pt,
}

\usepackage{xcolor}
\definecolor{linkblue}{RGB}{0,99,166}

\usepackage[
    hidelinks,
    pdfauthor={\partnerone,\ \partnertwo},
    pdfsubject={\experimenttitle \experimentsubtitle},
    pdftitle={\experimentcode \experimenttitle Laborbericht \labcourse},
    pdfkeywords={\experimenttitle \experimentcode}
]{hyperref}
\usepackage[nameinlink, noabbrev, capitalise]{cleveref}
\hypersetup{colorlinks=true, allcolors=linkblue}
\crefname{figure}{Abbildung}{Abbildungen}
\crefformat{equation}{#2(#1)#3}


\usepackage[a4paper,
  hmargin=0.1111\paperwidth, % 1/9
  vmargin=0.1111\paperheight, % 1/9
]{geometry}


% Header and Footer
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{20pt}
\renewcommand{\headrulewidth}{0.5pt}
\fancyhead[L]{\nouppercase{\leftmark}}

\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\fancyhead[C]{}
\fancyhead[R]{\experimentcode: \experimenttitle}
\fancyfoot[C]{\thepage}


\usepackage{csquotes}
\usepackage[backend=biber, style=numeric]{biblatex}
\usepackage{xurl} % xurl: laesst lange URLs an mehr Stellen umbrechen, sonst ragen sie ueber den Rand hinaus.
\addbibresource{references.bib}

\usepackage{parskip}


% Custom environments
\newenvironment{question}{\par\noindent\textbf{Frage:}}{\par\medskip}
\newenvironment{answer}{\par\noindent\textbf{Antwort:}}{\par\medskip}

\newenvironment{exercise}{\par\noindent\textbf{Aufgabe:}}{\par\medskip}
\newenvironment{solution}{\par\noindent\textbf{Lösung:}}{\par\medskip}