%% FP2-laborbericht.cls
%%
%% Lab report class whose layout reproduces the Cambridge University Press
%% "Data/Math" journal template (CUP-JNL-DTM.cls, LPPL 1.3c).
%% Values taken from that class are marked with  % CUP: <line numbers>.
%%
%% Requires LuaLaTeX (or XeLaTeX) and biber.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FP2-laborbericht}[2026/11/07 v2.0 FP2 lab report in CUP layout]

% ============================================================================
%  1. Base class and options
% ============================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt,oneside]{article}

% ============================================================================
%  2. Fonts and sizes
% ============================================================================
% CUP: 129-180 -- font size table
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

% The CUP PDF uses TeX Gyre Termes (via newtx); this is its OpenType version.
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

% Named fonts of the front matter and page heads  % CUP: 374-382, 1141-1142
\newcommand\Artcatfont{\normalfont\fontsize{8.5}{10.5}\bfseries\selectfont}
\newcommand\Titlefont{\normalfont\fontsize{16}{18}\bfseries\selectfont}
\newcommand\Authorfont{\fontsize{10}{12}\selectfont}
\newcommand\addressfont{\fontsize{8}{10}\selectfont\raggedright}
\newcommand\keywordfont{\fontsize{8}{10}\selectfont}
\newcommand\abstractheadfont{\normalfont\fontsize{9}{11}\bfseries\selectfont}
\newcommand\abstractsubheadfont{\normalfont\fontsize{9}{11}\bfseries\selectfont}
\newcommand\abstractfont{\fontsize{9}{11}\selectfont}
\newcommand\opheaderfont{\fontsize{7}{9}\selectfont}
\newcommand\headerfont{\fontsize{10}{12}\selectfont}
% Small print shared by the bibliography and code listings  % CUP: 1134
\newcommand\smallprintfont{\fontsize{8}{10}\selectfont}

% ============================================================================
%  3. Page layout
% ============================================================================
% A4 with 1/9 margins; head distance taken from CUP (headsep 19.5pt).
% The page number sits in the middle of the bottom margin (1/18).
\RequirePackage[
  a4paper,
  hmargin    = 0.1111\paperwidth,  % 1/9
  vmargin    = 0.1111\paperheight, % 1/9
  headheight = 12pt,
  headsep    = 19.5pt,             % CUP: 199
  footskip   = 0.0556\paperheight, % 1/18
  heightrounded,
]{geometry}

% ============================================================================
%  4. Typesetting parameters
% ============================================================================
\setlength\parindent{12pt}                         % CUP: 217
\setlength\parskip{0pt}                            % CUP: 225
\setlength\lineskip{1\p@}                          % CUP: 222-223
\setlength\normallineskip{1\p@}

\@lowpenalty   51                                  % CUP: 228-299
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

\sloppy                                            % CUP: 1868-1873
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
\newcommand\keywordname{Schlüsselwörter}
\newcommand\authorandname{und}
% CUP: 257-258 -- no word fragments shorter than three letters
\renewcommand*\ngermanhyphenmins{33}

% ============================================================================
%  6. Front matter
% ============================================================================
\RequirePackage{graphicx}
\RequirePackage{soul}

% ---- Interface -------------------------------------------------------------
% Article type label (letterspaced)  % CUP: 348-350
\sodef\letterspacetwty{}{.1em}{.4em plus1em}{.5em plus 1em minus1em}
\newcommand\articletype[1]{\gdef\ArtType{\letterspacetwty{#1}}}
\articletype{LABORBERICHT}

% Items of the small info line at the top left of the title page
\newcommand*\course[1]{\gdef\fp@course{#1}}
\newcommand*\experiment[1]{\gdef\fp@experiment{#1}}
\newcommand*\logo[1]{\gdef\fp@logo{#1}}
\course{Fortgeschrittenenpraktikum}
\experiment{}
\logo{assets/logos/CUP_Logo}

% \title[short title for the running head]{full title}  % CUP: 387-389
\renewcommand\title[2][]{%
  \gdef\@title{#2}%
  \if\relax\detokenize{#1}\relax\gdef\@shorttitle{#2}\else\gdef\@shorttitle{#1}\fi}
\title{Titel}

% \author[affiliation mark]{name}, one to three times
\newcounter{fp@authors}
\gdef\@author{}
\renewcommand\author[2][]{%
  \stepcounter{fp@authors}%
  \ifnum\value{fp@authors}>3
    \ClassError{FP2-laborbericht}{Too many authors}%
      {This template supports at most three authors.}%
  \fi
  \expandafter\gdef\csname fp@author@\the\value{fp@authors}\endcsname
    {#2\fp@affmark{#1}}%
  \ifx\@author\@empty\gdef\@author{#2}\else\g@addto@macro\@author{, #2}\fi}

% \affiliation[mark]{text}  % CUP: 466-471 (\address)
\newcounter{fp@affiliations}
\gdef\fp@affiliations{}
\newcommand\affiliation[2][]{%
  \stepcounter{fp@affiliations}%
  \g@addto@macro\fp@affiliations{{\fp@affmark{#1}#2.}\par}}

% Marks are only printed when there is more than one affiliation.
\newcommand\fp@affmark[1]{%
  \ifnum\value{fp@affiliations}>1
    \if\relax\detokenize{#1}\relax\else\textsuperscript{#1}\fi
  \fi}

% \keywords[label]{text}, may be used several times  % CUP: 510-514
\gdef\@keywords{}
\gdef\fp@pdfkeywords{}
\newcommand\keywords[2][\keywordname]{%
  \g@addto@macro\@keywords{\par\addvspace{5pt}{\keywordfont\textbf{#1:} #2\par}}%
  \ifx\fp@pdfkeywords\@empty\gdef\fp@pdfkeywords{#2}\fi}

% ---- Printing --------------------------------------------------------------
\newcommand\fp@author[1]{\csname fp@author@#1\endcsname}
\newcommand\fp@printauthors{%
  \ifcase\value{fp@authors}%
  \or \fp@author{1}%
  \or \fp@author{1} \authorandname~\fp@author{2}%
  \else \fp@author{1}, \fp@author{2} \authorandname~\fp@author{3}%
  \fi}

% Top-left info line: \textit{course}, Versuch X, date
\newcommand\fp@infoline{%
  \textit{\fp@course}%
  \ifx\fp@experiment\@empty\else, Versuch~\fp@experiment\fi
  \ifx\@date\@empty\else, \@date\fi}

% Title block  % CUP: 523-548 (history and abstract moved out)
\renewcommand\@maketitle{%
  \noindent\vbox{%
    \hsize\textwidth\parindent\z@
    \vskip7pt
    \hbox to\textwidth{\Artcatfont\ArtType\hfill}%
    \ifx\@title\@empty\else
      \vskip15.5pt
      {\Titlefont\@title\par}%
    \fi
    \ifnum\value{fp@authors}>\z@
      \vskip10pt
      {\Authorfont\fp@printauthors\par}%
      {\vskip7pt\addressfont\fp@affiliations\par}%
    \fi
    {\ifx\@keywords\@empty\else\@keywords\fi\par}%
  }\par
  % CUP has 22pt before the abstract head (and 23pt after the whole block,
  % added by the abstract environment); without an abstract this 22pt remains.
  \addvspace{22pt}}

% CUP: 551-587
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

% Abstract: used directly after \maketitle  % CUP: 494-502
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
% Title page: logo top right, info line top left  % CUP: 1170-1181
\def\ps@titlepage{%
  \def\@oddhead{\hbox to\textwidth{%
    \vbox to\z@{\vskip-5pt\rlap{\hbox to\textwidth{\hfill
      \ifx\fp@logo\@empty\else\includegraphics[scale=.75]{\fp@logo}\fi
      \hspace*{-1pt}}}\vss}%
    \vbox to\z@{\vskip-7pt\rlap{\parbox{\textwidth}{\opheaderfont
      % (CUP's one-column spec leaves \fill nothing to stretch; the empty
      % second column avoids an underfull box without moving anything)
      \begin{tabular*}{\textwidth}[b]{@{}l@{\extracolsep{\fill}}r@{}}%
        \fp@infoline &
      \end{tabular*}}}}%
    \hss}}%
  \def\@oddfoot{\headerfont\hfil\thepage\hfil}%
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot}

% Regular pages: section left, short title right, page number centred
% (fonts as in CUP's \ps@headings, 1147-1153)
\def\ps@report{%
  \def\@oddhead{\headerfont\textit{\leftmark}\hfill\textit{\@shorttitle}}%
  \def\@oddfoot{\headerfont\hfil\thepage\hfil}%
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
  \let\@mkboth\@gobbletwo
  \def\sectionmark##1{\markboth{##1}{##1}}%
  \let\subsectionmark\@gobble}

% ============================================================================
%  8. Sections
% ============================================================================
\setcounter{secnumdepth}{3}                         % CUP: 1186-1188

% CUP: 1265-1292
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

% Kernel definition plus CUP's small skip for consecutive headings  % CUP: 1294-1309
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
% CUP: 1662-1706
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
% CUP list geometry (1314-1466): labels hang in the margin-aligned label
% box, .5em label separation, 6pt around lists, no extra item spacing.
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

% "Abbildung 1." bold italic, .5em, italic text with a final period,
% centred when it fits on one line  % CUP: 1493-1582
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

\setlength\arraycolsep{2\p@}                        % CUP: 1496-1500
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}

% Hairline booktabs rules with CUP's spacing  % CUP: 1553, 1616-1632
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
% CUP: 214-215, 1835-1844. CUP's rule (kern 2pt, rule, kern 4.5pt) adds 6.65pt
% that LaTeX's page builder does not know about, so pages with footnotes can
% overflow. Here the rule has zero net height and the 6.65pt moved into
% \skip\footins: same picture (10pt text-to-rule, 4.5pt rule-to-note).
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
\RequirePackage{listings}
% No syntax highlighting: monospaced, framed, line-numbered code,
% set in the same size as the references.
\lstset{
  basicstyle=\ttfamily\smallprintfont,
  numberstyle=\tiny,
  numbersep=5pt,
  breaklines=true,
  showstringspaces=false,
  frame=single
}

\RequirePackage{xcolor}
\RequirePackage[most]{tcolorbox}
\newtcolorbox{codeblockbox}{
  enhanced, breakable,
  colback=black!4, colframe=black!4,
  boxrule=0pt, arc=2pt,
  left=8pt, right=8pt, top=6pt, bottom=6pt,
}

% ============================================================================
% 15. Bibliography
% ============================================================================
\RequirePackage[backend=biber, style=numeric]{biblatex}
\renewcommand*\bibfont{\smallprintfont}
\RequirePackage{xurl} % lets long URLs break anywhere

% ============================================================================
% 16. Links and cross-references
% ============================================================================
\definecolor{linkblue}{RGB}{0,99,166}
\RequirePackage[colorlinks, allcolors=linkblue]{hyperref}
% (not pdfusetitle: it would take the optional arguments of \title/\author)
\AtBeginDocument{%
  \hypersetup{
    pdftitle    = {\@title},
    pdfauthor   = {\@author},
    pdfsubject  = {\fp@course\ifx\fp@experiment\@empty\else, Versuch \fp@experiment\fi},
    pdfkeywords = {\fp@pdfkeywords},
  }}
\RequirePackage[ngerman, nameinlink, noabbrev, capitalise]{cleveref}
\crefformat{equation}{#2(#1)#3}

% ============================================================================
\pagestyle{report}
\pagenumbering{arabic}

\endinput
