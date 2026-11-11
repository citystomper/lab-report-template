%% lab-report.cls -- lab report class for LuaLaTeX/XeLaTeX with biber.
%% Derived from the Cambridge University Press "Data/Math" journal template
%% (CUP-JNL-DTM.cls, LPPL 1.3c, available from CUP's author templates):
%% reduced to its layout and adapted for lab reports.
%%
%% Copyright (C) 2026 citystomper
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, version 1.3c or later (see LICENSE).
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lab-report}[2026/11/08 v2.1 Lab report in CUP layout]

% ============================================================================
%  1. Base class and options
% ============================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt,oneside]{article}

% ============================================================================
%  2. Fonts and sizes
% ============================================================================
\renewcommand\normalsize{%
  \@setfontsize\normalsize{10pt}{12pt}%
  \abovedisplayskip 9.5\p@ \@plus2\p@ \@minus0\p@
  \abovedisplayshortskip 3\p@ \@plus3\p@
  \belowdisplayshortskip 9.5\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
\renewcommand\small{%
  \@setfontsize\small\@ixpt{11}%
  \abovedisplayskip 5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 3\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 4\p@ \@plus2\p@ \@minus2\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
\renewcommand\footnotesize{%
  \@setfontsize\footnotesize{7}{8}%
  \abovedisplayskip 5\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@ixpt\@ixpt}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large{12}{14}}
\renewcommand\Large{\@setfontsize\Large{16}{18}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\DeclareMathSizes{\@ixpt}{\@ixpt}{7}{5}
\DeclareMathSizes{\@xpt}{\@xpt}{7}{5}
\DeclareMathSizes{\@xipt}{\@xipt}{7}{5}

\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\setmainfont{texgyretermes}[
  Extension      = .otf,
  UprightFont    = *-regular,
  BoldFont       = *-bold,
  ItalicFont     = *-italic,
  BoldItalicFont = *-bolditalic]
\setmathfont{texgyretermes-math.otf}
\setmonofont{JetBrains Mono}[Scale=MatchLowercase]

\newcommand\Artcatfont{\normalfont\fontsize{8.5}{10.5}\bfseries\selectfont}
\newcommand\Titlefont{\normalfont\fontsize{16}{18}\bfseries\selectfont}
\newcommand\Subtitlefont{\normalfont\fontsize{12}{14}\itshape\selectfont}
\newcommand\Authorfont{\fontsize{10}{12}\selectfont}
\newcommand\addressfont{\fontsize{8}{10}\selectfont\raggedright}
\newcommand\abstractheadfont{\normalfont\fontsize{9}{11}\bfseries\selectfont}
\newcommand\abstractsubheadfont{\normalfont\fontsize{9}{11}\bfseries\selectfont}
\newcommand\abstractfont{\fontsize{9}{11}\selectfont}
\newcommand\opheaderfont{\fontsize{7}{9}\selectfont}
\newcommand\headerfont{\fontsize{10}{12}\selectfont}
\newcommand\smallprintfont{\fontsize{8}{10}\selectfont}

% ============================================================================
%  3. Page layout
% ============================================================================
\RequirePackage[
  a4paper,
  hmargin    = 0.1111\paperwidth,  % 1/9
  vmargin    = 0.1111\paperheight, % 1/9
  headheight = 12pt,
  headsep    = 19.5pt,
  footskip   = 0.0556\paperheight, % 1/18: middle of the bottom margin
  heightrounded,
]{geometry}

% ============================================================================
%  4. Typesetting parameters
% ============================================================================
\setlength\parindent{12pt}
\setlength\parskip{0pt}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\clubpenalty 10000
\widowpenalty 10000
\displaywidowpenalty 100
\predisplaypenalty   10000
\postdisplaypenalty  0
\doublehyphendemerits 1000000
\finalhyphendemerits  1000000
\interlinepenalty 0
\brokenpenalty 10000

\setcounter{totalnumber}{10}
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
\renewcommand\topfraction{.921}
\renewcommand\bottomfraction{.921}
\renewcommand\textfraction{.13}
\renewcommand\floatpagefraction{.887}
\setlength\floatsep    {18\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{19\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {18\p@ \@plus 2\p@ \@minus 2\p@}

\sloppy
\vbadness=9999
\tolerance=9999
\frenchspacing
\flushbottom
\linepenalty=100

\RequirePackage{microtype}

% ============================================================================
%  5. Language
% ============================================================================
\RequirePackage[ngerman, shorthands=off]{babel}
\RequirePackage{csquotes}
\addto\captionsngerman{%
  \renewcommand\contentsname{Inhalt}%
  \renewcommand\abstractname{Abstract}%
}
\newcommand\authorandname{und}
\renewcommand*\ngermanhyphenmins{33}
% babel redefines \today on every language switch.
\addto\datengerman{%
  \renewcommand\today{\two@digits{\day}.\two@digits{\month}.\the\year}}

% ============================================================================
%  6. Front matter
% ============================================================================
\RequirePackage{graphicx}
\RequirePackage{soul}

% ---- Interface -------------------------------------------------------------
% No content defaults except \title; unset items are omitted.

\sodef\letterspacetwty{}{.1em}{.4em plus1em}{.5em plus 1em minus1em}
\newcommand\articletype[1]{\gdef\lr@arttype{#1}}
\articletype{}

\newcommand*\course[1]{\gdef\lr@course{#1}}
\newcommand*\experiment[1]{\gdef\lr@experiment{#1}}
\newcommand*\group[1]{\gdef\lr@group{#1}}
\course{}
\experiment{}
\group{}

% \logo[includegraphics options]{file}
% Default height 18.82pt: rendered height of the original CUP logo.
\newcommand\logo[2][]{\gdef\lr@logo{#2}\gdef\lr@logoopts{#1}}
\logo{}
% \edef: keyval only sees the user's options once they are expanded.
\newcommand\lr@includelogo{%
  \begingroup
    \edef\x{\endgroup\noexpand\includegraphics[height=18.82pt,
      width=0.4\noexpand\textwidth, keepaspectratio,
      \unexpanded\expandafter{\lr@logoopts}]{\unexpanded\expandafter{\lr@logo}}}%
  \x}

% \title[short title for the running head]{full title}
\renewcommand\title[2][]{%
  \gdef\@title{#2}%
  \if\relax\detokenize{#1}\relax\gdef\@shorttitle{#2}\else\gdef\@shorttitle{#1}\fi}
\title{Titel}

\newcommand\subtitle[1]{\gdef\lr@subtitle{#1}}
\subtitle{}

\newcounter{lr@authors}
\gdef\@author{}
\renewcommand\author[2][]{%
  \stepcounter{lr@authors}%
  \ifnum\value{lr@authors}>3
    \ClassError{lab-report}{Too many authors}%
      {This template supports at most three authors.}%
  \fi
  \expandafter\gdef\csname lr@author@\the\value{lr@authors}\endcsname
    {#2\lr@affmark{#1}}%
  \ifx\@author\@empty\gdef\@author{#2}\else\g@addto@macro\@author{, #2}\fi}

\newcounter{lr@affiliations}
\gdef\lr@affiliations{}
\newcommand\affiliation[2][]{%
  \stepcounter{lr@affiliations}%
  \g@addto@macro\lr@affiliations{{\lr@affmark{#1}#2.}\par}}

\newcommand\lr@affmark[1]{%
  \ifnum\value{lr@affiliations}>1
    \if\relax\detokenize{#1}\relax\else\textsuperscript{#1}\fi
  \fi}

% ---- Printing --------------------------------------------------------------
\newcommand\lr@author[1]{\csname lr@author@#1\endcsname}
\newcommand\lr@printauthors{%
  \ifcase\value{lr@authors}%
  \or \lr@author{1}%
  \or \lr@author{1} \authorandname~\lr@author{2}%
  \else \lr@author{1}, \lr@author{2} \authorandname~\lr@author{3}%
  \fi}

% Title-page head (two-column table):
%   \textit{course}, Versuch X, Gruppe Y          [logo]
%   date
% Without a first line the date moves up.
\newif\iflr@lineone
\newcommand\lr@item[1]{\lr@sep#1\def\lr@sep{, }\lr@lineonetrue}
% Top edge at the row's cap height; \smash keeps the row height unchanged.
\newcommand\lr@logocell{%
  \ifx\lr@logo\@empty\else
    \smash{\raisebox{\dimexpr\fontcharht\font`H-\height\relax}{\lr@includelogo}}%
  \fi}
\newcommand\lr@infoline{%
  \let\lr@sep\@empty\lr@lineonefalse
  \ifx\lr@course\@empty\else\lr@item{\textit{\lr@course}}\fi
  \ifx\lr@experiment\@empty\else\lr@item{Versuch~\lr@experiment}\fi
  \ifx\lr@group\@empty\else\lr@item{Gruppe~\lr@group}\fi
  % & and \\ must not occur inside an open conditional; branches are
  % resolved via \@firstoftwo/\@secondoftwo before the alignment sees them.
  \iflr@lineone\expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi
    {&\lr@logocell
     \ifx\@date\@empty\expandafter\@gobble\else\expandafter\@firstofone\fi
       {\\\@date&}}%
    {\@date&\lr@logocell}}

\renewcommand\@maketitle{%
  \noindent\vbox{%
    \hsize\textwidth\parindent\z@
    \vskip7pt
    \ifx\lr@arttype\@empty\else
      % soul needs the literal text, not a macro.
      \hbox to\textwidth{\Artcatfont
        \expandafter\letterspacetwty\expandafter{\lr@arttype}\hfill}%
      \vskip15.5pt
    \fi
    {\Titlefont\@title\par}%
    \ifx\lr@subtitle\@empty\else
      \vskip3pt
      {\Subtitlefont\lr@subtitle\par}%
    \fi
    \ifnum\value{lr@authors}>\z@
      \vskip10pt
      {\Authorfont\lr@printauthors\par}%
    \fi
    \ifnum\value{lr@affiliations}>\z@
      \vskip\ifnum\value{lr@authors}>\z@ 7pt\else 10pt\fi
      {\addressfont\lr@affiliations\par}%
    \fi
  }\par
  % Equal to the abstract head's beforeskip; \addvspace keeps the larger.
  \addvspace{22pt}}

\renewcommand\maketitle{\par
  \@afterindentfalse
  \begingroup
    \newpage
    \global\@topnum\z@ % no floats at the top of the first page
    \@maketitle
    \thispagestyle{titlepage}%
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \@afterheading}

\newcommand\abstracthead{\@startsection{section}{1}{\z@}%
  {-22pt \@plus2ex \@minus0ex}{0.0001pt}{\abstractheadfont}}
\newcommand\subabstracthead{\@startsection{subsection}{2}{\z@}%
  {3pt \@plus0ex \@minus0ex}{-.5em}{\abstractsubheadfont}}
\renewenvironment{abstract}{%
  \par
  \let\paragraph\subabstracthead
  \abstractfont
  \parindent\z@
  \abstracthead*{\abstractname}}%
 {\par\addvspace{23pt}}

% ============================================================================
%  7. Page styles
% ============================================================================
\def\ps@titlepage{%
  \def\@oddhead{\hbox to\textwidth{%
    \vbox to\z@{\vskip-7pt\rlap{\parbox{\textwidth}{\opheaderfont
      \begin{tabular*}{\textwidth}[b]{@{}l@{\extracolsep{\fill}}r@{}}%
        \lr@infoline
      \end{tabular*}}}\vss}%
    \hss}}%
  \def\@oddfoot{\headerfont\hfil\thepage\hfil}%
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot}

\def\ps@report{%
  \def\@oddhead{\headerfont\textit{\leftmark}\hfill\textit{\@shorttitle}}%
  \def\@oddfoot{\headerfont\hfil\thepage\hfil}%
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
  \let\@mkboth\@gobbletwo % ToC/bibliography must not set running-head marks
  \def\sectionmark##1{\markboth{##1}{##1}}%
  \let\subsectionmark\@gobble}

% ============================================================================
%  8. Sections
% ============================================================================
\newcommand\sectionfont{\normalfont\fontsize{10}{12}\bfseries\selectfont\raggedright}
\newcommand\subsectionfont{\normalfont\fontsize{10}{12}\bfseries\itshape\selectfont\raggedright}
\newcommand\subsubsectionfont{\normalfont\fontsize{9.5}{11.5}\bfseries\selectfont\raggedright}
\newcommand\paragraphfont{\normalfont\fontsize{9.5}{11.5}\itshape\selectfont\raggedright\boldmath}
\newcommand\subparagraphfont{\normalfont\fontsize{10}{12}\bfseries\itshape\selectfont\raggedright}

\def\@seccntformat#1{{\csname the#1\endcsname.}\hskip.5em}

\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-18pt \@plus -2ex \@minus 0ex}{6pt}{\sectionfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-18pt \@plus 0ex \@minus 0ex}{6pt}{\subsectionfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-12.5pt \@plus 0ex \@minus 0ex}{0.001pt}{\subsubsectionfont}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {12.5pt \@plus1ex \@minus.2ex}{0.0001pt}{\paragraphfont}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
  {-6pt \@plus1ex \@minus .2ex}{-1em}{\subparagraphfont}}

% Kernel \@startsection plus fixed skips between consecutive headings.
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}\ifnum#2=2\vskip0pt\else\ifnum#2=3\vskip1pt\else\ifnum#2=4\vskip1pt\fi\fi\fi
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

% ============================================================================
%  9. Table of contents
% ============================================================================
\renewcommand\@pnumwidth{1.55em}
\renewcommand\@tocrmarg{2.55em}
\renewcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \section*{\contentsname}%
  \@starttoc{toc}}
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{0em}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\renewcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}

% ============================================================================
% 10. Lists
% ============================================================================
\RequirePackage{enumitem}
\setlist{topsep=6pt, partopsep=0pt, itemsep=0pt, parsep=0pt,
  labelsep=.5em, listparindent=\parindent, before=\raggedright}
\setlist[enumerate,1]{label=\arabic*., leftmargin=*}
\setlist[enumerate,2]{label=(\alph*), leftmargin=*}
\setlist[enumerate,3]{label=(\roman*), leftmargin=*}
\setlist[itemize,1]{label=\textbullet, leftmargin=*, labelindent=-1.5pt}
\setlist[itemize,2]{label=\textendash, leftmargin=*}
\setlist[description]{font=\bfseries}

% ============================================================================
% 11. Floats, captions and tables
% ============================================================================
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}

\DeclareCaptionLabelSeparator{cup}{.\hskip.5em}
\captionsetup{
  font            = normalsize,
  labelfont       = {bf,it},
  textfont        = it,
  labelsep        = cup,
  textformat      = period,
  justification   = justified,
  singlelinecheck = true,
}
\captionsetup[figure]{position=below, skip=2.25pt}
\captionsetup[table]{position=above, skip=3pt}
\captionsetup[sub]{labelsep=space, textformat=simple}

\setlength\arraycolsep{2\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}

\RequirePackage{booktabs}
\setlength\heavyrulewidth{.15pt}
\setlength\lightrulewidth{.15pt}
\setlength\cmidrulewidth{.15pt}
\setlength\abovetopsep{0pt}
\setlength\aboverulesep{3pt}
\setlength\belowrulesep{5pt}
\setlength\belowbottomsep{0pt}
\let\botrule\bottomrule
\RequirePackage{multirow}

\RequirePackage{pdfpages}

% ============================================================================
% 12. Footnotes
% ============================================================================
% Zero-net-height rule; its 6.65pt live in \skip\footins so the page
% builder accounts for them.
\setlength\footnotesep{5.75\p@}
\setlength{\skip\footins}{14.65\p@ \@plus 4\p@ \@minus 0\p@}
\renewcommand\footnoterule{%
  \kern-4.65\p@
  \hrule \@height.15pt \@width5pc
  \kern4.5\p@}
\def\@makefnmark{{\textsuperscript{\@thefnmark}}}
\renewcommand\@makefntext[1]{\hskip8pt{\smash{\@makefnmark}}#1}

% ============================================================================
% 13. Maths and units
% ============================================================================
\RequirePackage{amsmath}
\numberwithin{equation}{section}
\RequirePackage[range-units=repeat, multi-part-units=brackets,
  range-phrase={ bis }, separate-uncertainty, locale=DE,
  per-mode=symbol-or-fraction]{siunitx}

% ============================================================================
% 14. Code
% ============================================================================
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{needspace}
\renewcommand\lstlistingname{Quellcode}
\lstset{
  basicstyle       = \ttfamily\smallprintfont,
  numbers          = left,
  numberstyle      = \fontsize{6}{10}\selectfont\ttfamily\color{black!45},
  numbersep        = 8pt,
  frame            = tb,
  framerule        = .15pt,
  framesep         = 4pt,
  aboveskip        = 2pt,
  belowskip        = 10pt,
  columns          = fullflexible,
  keepspaces       = true,
  breaklines       = true,
  showstringspaces = false,
}

% \codefile[shown name]{path}{note}
\newcommand\lr@basename[1]{%
  \filename@parse{#1}\filename@base
  \ifx\filename@ext\relax\else.\filename@ext\fi}
\newcommand\codefile[3][]{%
  \par\addvspace{10pt}%
  \needspace{5\baselineskip}%
  \noindent
  {\smallprintfont\ttfamily
    \if\relax\detokenize{#1}\relax\lr@basename{#2}\else#1\fi}%
  \hfill{\smallprintfont\itshape #3}\par
  \nobreak
  \lstinputlisting{#2}}

% ============================================================================
% 15. Bibliography
% ============================================================================
\RequirePackage[backend=biber, style=numeric]{biblatex}
\renewcommand*\bibfont{\smallprintfont}
\RequirePackage{xurl}

% ============================================================================
% 16. Links and cross-references
% ============================================================================
\definecolor{linkblue}{RGB}{0,99,166}
\RequirePackage[colorlinks, allcolors=linkblue]{hyperref}
% Not pdfusetitle: it takes the optional arguments of \title/\author.
\AtBeginDocument{%
  \hypersetup{
    pdftitle    = {\@title},
    pdfauthor   = {\@author},
    pdfsubject  = {\lr@course
      \ifx\lr@course\@empty\else\ifx\lr@experiment\@empty\else, \fi\fi
      \ifx\lr@experiment\@empty\else Versuch \lr@experiment\fi},
  }}
\RequirePackage[ngerman, nameinlink, noabbrev, capitalise]{cleveref}
% \Crefformat must be set too; the derived one breaks on #2(#1)#3.
\crefformat{equation}{#2(#1)#3}
\Crefformat{equation}{Gleichung~#2(#1)#3}
% cleveref's type is "listing", not "lstlisting".
\crefname{listing}{Quellcode}{Quellcodes}
\Crefname{listing}{Quellcode}{Quellcodes}

% ============================================================================
\pagestyle{report}

\endinput
