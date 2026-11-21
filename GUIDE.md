# How to use the report template

This guide walks you through setting up a report with this template, step by step. At the end there's a [complete example](#11-full-example-a-lab-report-fp2) that rebuilds a real lab report from the *Fortgeschrittenenpraktikum 2*.

The template typesets in **German** (hyphenation, "Inhalt", "Abbildung", "Gleichung", decimal commas). See [Language](#language) if you need English output.

**Contents**

1. [Get the template](#1-get-the-template)
2. [Set the compiler to LuaLaTeX](#2-set-the-compiler-to-lualatex)
3. [Project structure](#3-project-structure)
4. [Title page](#4-title-page)
5. [Writing a good title](#5-writing-a-good-title)
6. [Writing the report](#6-writing-the-report)
7. [References](#7-references)
8. [Code in the appendix](#8-code-in-the-appendix)
9. [Scanned lab protocol](#9-scanned-lab-protocol)
10. [Removing the example content](#10-removing-the-example-content)
11. [Full example: a lab report (FP2)](#11-full-example-a-lab-report-fp2)
12. [Troubleshooting](#12-troubleshooting)

---

## 1. Get the template

### Overleaf (recommended)

1. On the GitHub page of this repository, click **Code → Download ZIP**. The ZIP contains only the files the report needs. The README, this guide and the preview images are left out.
2. In Overleaf, click **New Project → Upload Project** and select the ZIP. You don't need to unpack it first.

### GitHub

Click **Use this template → Create a new repository** to get your own copy, including the docs. You can link it to Overleaf via **Menu → Sync → GitHub**, which needs an Overleaf premium plan. Otherwise download *your* repo as a ZIP and upload it as above.

### Locally

You need a TeX distribution with LuaLaTeX and biber (TeX Live or MacTeX 2023 or newer). Then build with:

```bash
latexmk -lualatex main.tex
```

## 2. Set the compiler to LuaLaTeX

The template uses system fonts (`fontspec`, `unicode-math`), so it **does not compile with pdfLaTeX**, which is Overleaf's default.

- **Overleaf:** open **Menu** (top left), set **Compiler** to **LuaLaTeX**, and make sure **Main document** is `main.tex`.
- **Locally:** the first line of `main.tex`, `% !TeX program = lualatex`, selects LuaLaTeX in TeXShop, TeXstudio and VS Code (LaTeX Workshop). `latexmk -lualatex` works everywhere.

The bibliography is processed by **biber**. Overleaf runs it automatically.

## 3. Project structure

```text
main.tex               Settings (title page, authors, …) and the list of sections
generalreport.cls      The layout. You don't need to touch it
references.bib         Your literature (BibTeX/BibLaTeX)
sections/
  abstract.tex         Abstract
  einleitung.tex       1  Einleitung
  theorie.tex          2  Theoretische Grundlagen
  aufbau.tex           3  Versuchsaufbau und Durchführung
  teilversuch1.tex     4  Teilversuch 1
  teilversuch2.tex     5  Teilversuch 2
  zusammenfassung.tex  6  Zusammenfassung
  anhang.tex           7  Anhang (code, lab protocol)
figures/               Your figures (PDF, PNG, JPG)
code/                  Code files shown in the appendix
assets/
  logos/               Logo and title-page emblem
  placeholder-protocol.pdf   Replace with your scanned lab protocol
```

You only ever edit `main.tex`, the files in `sections/`, and `references.bib`, and you add your own files to `figures/`, `code/` and `assets/`.

## 4. Title page

Everything about the title page is set at the top of `main.tex`, before `\begin{document}`. **Any command you delete is simply not printed**. The only exception is `\title`.

### Separate title page or not

```latex
\documentclass[titlepage]{generalreport}
```

| Option | Result |
|---|---|
| `titlepage` | The title gets its own page without a page number. The abstract and table of contents start on page 1. |
| *(none)*: `\documentclass{generalreport}` | Title, abstract and table of contents share the first page, which is page 1. |

Without `titlepage` you may also want to delete the `\clearpage` after `\tableofcontents` in `main.tex`, so the text starts right below the table of contents.

### Head of the title page

```latex
\logo{assets/logos/placeholder-logo}
\emblem{assets/logos/placeholder-emblem}
\infoline{\textit{Kurs oder Veranstaltung}, weitere Angaben}
\date{\today}
```

- **`\logo[options]{file}`**: a small logo, top right. It's 18.8 pt high by default and at most 0.4 × text width wide. Options are passed on to `\includegraphics`, e.g. `\logo[height=1cm]{assets/logos/my-logo}`. Delete the line for no logo.
- **`\emblem[options]{file}`**: a large, faint watermark (e.g. your university's seal) in the bottom-right corner of the title page, cut off by the page edges. It only appears on the title page.

  | Option | Meaning | Default |
  |---|---|---|
  | `width` | Width of the emblem | `0.85\paperwidth` |
  | `color` | Colour of the emblem, any `xcolor` colour. `black!4` = 4 % black (very faint), `black!15` = darker | `black!8` |
  | `right` | Share of the emblem that sticks out past the **right** page edge. `0` = flush with the edge, negative = moves onto the page | `0.333` |
  | `bottom` | Share of the emblem that sticks out past the **bottom** page edge. Same scale as `right` | `0.333` |

  Example: `\emblem[color=black!4, right=0.23, bottom=0.1]{assets/logos/emblem}`

  The emblem file must be **single-colour black artwork on white or transparent**. It gets recoloured: black becomes `color` and white stays white. A vector PDF looks best. To convert an SVG, open it in Inkscape and use *Save As → PDF*. A high-resolution PNG also works. Coloured artwork gives odd results.
- **`\infoline{text}`**: the first line, top left. It's free text, typically course, experiment and group. It wraps automatically at half the text width, or you can break it yourself with `\\`. It's also used as the PDF's *subject*.
- **`\date{…}`**: the line below. `\today` prints today's date as `21.11.2026`. You can also write any text, e.g. `\date{10.10.2026}`, or delete the line for no date. Without an info line, the date moves up into the first line.

### Title block

```latex
\documenttype{BERICHT}
\title[Kurztitel]{Titel des Berichts}
\subtitle{Untertitel des Berichts}
\author[1]{Vorname Nachname}
\author[1]{Vorname Nachname}
\affiliation[1]{Institut, Universität, Stadt}
```

- **`\documenttype{…}`**: a small, letter-spaced label above the title, printed exactly as typed. Write it in capitals yourself, e.g. `LABORBERICHT`, `PROTOKOLL`, `BERICHT`.
- **`\title[short title]{full title}`**: the full title appears on the title page and in the PDF properties. The **short title** in square brackets appears in the running head at the top right of every page. If you leave out the brackets, the full title is used there too. See [section 5](#5-writing-a-good-title).
- **`\subtitle{…}`**: an optional italic line below the title.
- **`\author[n]{First Last}`**: one line per author, **at most three**. They're printed comma-separated in the order you write them.
- **`\affiliation[n]{…}`**: the institution. The **number `n` links authors to affiliations**: `\author[1]` belongs to `\affiliation[1]`.
  - With **one** affiliation, no numbers are printed at all. You still write `[1]` everywhere, which keeps things consistent if you add a second one.
  - With **two or more** affiliations, every author and affiliation gets its number as a superscript. Example:

    ```latex
    \author[1]{Erika Mustermann}
    \author[2]{Max Mustermann}
    \affiliation[1]{Fakultät für Physik, Ludwig-Maximilians-Universität München}
    \affiliation[2]{Physik-Department, Technische Universität München}
    ```

  - A **period is added automatically** at the end, so don't type one.

## 5. Writing a good title

A good lab-report title tells the reader *what* you studied. The subtitle tells *how*.

| | What it should say | Example |
|---|---|---|
| **Title** | The physics: the phenomenon, system or quantity you studied. Be specific (which atom, which line, which effect). | *Hyperfeinstruktur der Rubidium-D2-Linie* |
| **Subtitle** | The method: the measurement techniques or setup you used to study it. | *Absorptions- und dopplerfreie Sättigungsspektroskopie* |
| **Short title** | The experiment as it appears in the course list (code and name). It's in the running head next to the section title, so keep it short (about 30 characters). | *H2 Laserspektroskopie* |

Rules of thumb:

- **Not the experiment's name as the title.** *Laserspektroskopie* or *Versuch H2* says nothing about what you found out. Put that in the short title or the info line.
- **Physics in the title, technique in the subtitle.** If the title already names the method, the subtitle has nothing left to say.
- **No filler.** Leave out *Bestimmung von…*, *Untersuchung der…*, *Versuch zur…* when the title works without them.
- **Avoid abbreviations** in the title, apart from standard ones (D2-Linie, NMR, …).

| ✗ Weak | ✓ Better |
|---|---|
| *Laserspektroskopie* | *Hyperfeinstruktur der Rubidium-D2-Linie* |
| *Versuch zum Zeeman-Effekt* | *Zeeman-Aufspaltung der roten Cadmiumlinie*, subtitle *Messung mit einem Fabry-Pérot-Interferometer* |

## 6. Writing the report

### Sections

Each section has its own file in `sections/`. `main.tex` lists them:

```latex
\input{sections/einleitung}
\input{sections/theorie}
…
```

- **Order** of sections = order of the `\input` lines.
- **Add a section:** create e.g. `sections/teilversuch3.tex` starting with `\section{…}`, and add `\input{sections/teilversuch3}` to `main.tex`.
- **Remove a section:** delete its `\input` line (and the file).
- **Rename a section:** change the `\section{…}` line at the top of the file. Replace `Teilversuch 1` / `Teilversuch 2` with what the parts of your experiment are about, e.g. `\section{Absorptionsspektroskopie}`. The file name doesn't matter.
- Use `\subsection{…}` and `\subsubsection{…}` inside a section.
- The **abstract** is in `sections/abstract.tex`, between `\begin{abstract}` and `\end{abstract}`.

The example sections show how everything works. Have a look at the source before deleting it.

### Figures

Put the file in `figures/` and include it like this:

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.7\textwidth]{figures/spektrum}
  \caption{Absorptionsspektrum der D2-Linie}
  \label{fig:spektrum}
\end{figure}
```

Write captions without a final period; it's added automatically. For side-by-side figures, see the `subfigure` example in `sections/teilversuch1.tex`.

### Tables

The example in `sections/teilversuch1.tex` uses `booktabs` rules (`\toprule`, `\midrule`, `\bottomrule`) and `siunitx` `S` columns, which align numbers at the decimal point. Table captions go **above** the table.

### Equations and units

```latex
\begin{equation}
  E = h\nu
  \label{eq:photon}
\end{equation}
```

Equations are numbered per section (2.1, 2.2, …). Write quantities with units as `\qty{42.0(5)}{\milli\metre}`, which prints a decimal comma and the uncertainty correctly, and units alone as `\unit{\kelvin}`.

### Cross-references

Give everything you want to refer to a `\label{…}`, then refer to it with `\cref{…}`. The word is added for you: `\cref{fig:spektrum}` → "Abbildung 1", `\cref{eq:photon}` → "(2.1)". At the start of a sentence, use `\Cref{…}` ("Gleichung (2.1)"). Labels: `fig:` figures, `tab:` tables, `eq:` equations, `sec:` sections.

## 7. References

1. Add the entries to `references.bib`. The easiest way: in Zotero, right-click → *Export Item… → BibLaTeX*, or use the Better BibTeX plugin. The included Optik book is just an example; replace it.
2. Cite in the text with `\cite{key}`, e.g. `\cite{zinth_optik_2018}`.
3. Compile. The bibliography is printed at the end as a numbered section **Literatur**. Only cited entries appear.

If a citation shows up as **[key]** in bold, compile again. Overleaf usually does that by itself.

## 8. Code in the appendix

`sections/anhang.tex` shows one subsection per code file:

```latex
\subsection{Auswertungsnotebook}\label{sec:notebook}
One or two sentences on what the file does.
\codefile[auswertung.ipynb]{code/auswertung.py}{Jupyter-Notebook, exportiert}
```

`\codefile[shown name]{path}{note}` prints the file with line numbers. The **shown name** (optional) appears on the left above the listing, and the **note** on the right. Without a shown name, the file name is used.

**Jupyter notebooks** can't be included directly. Export them to a Python script first:

```bash
jupyter nbconvert --to script auswertung.ipynb
```

Add `--no-prompt` to drop the `# In[n]:` lines and `--TemplateExporter.exclude_markdown=True` to drop the markdown cells. Put the resulting `.py` file in `code/`.

## 9. Scanned lab protocol

1. Scan your handwritten protocol into **one PDF** (A4, all pages).
2. Upload it to `assets/`, e.g. as `assets/protokoll.pdf`, and delete `assets/placeholder-protocol.pdf`.
3. In `sections/anhang.tex`, change the file name in the last line:

   ```latex
   \includepdf[pages=-, width=\textwidth, pagecommand={}]{assets/protokoll}
   ```

   - `pages=-` includes all pages; `pages=1-3` would include only those.
   - `width=\textwidth` scales each page to the text width.
   - `pagecommand={}` keeps the running head and page number on these pages.

## 10. Removing the example content

When you start writing:

- Replace the example text in each file in `sections/`. Everything below the `\section{…}` line is example content.
- Delete the files in `code/` and the corresponding subsections in `sections/anhang.tex`.
- Once no section uses `\blindtext` any more, delete `\usepackage{blindtext}` and its comment from `main.tex`.
- Replace the example entry in `references.bib`.

## 11. Full example: a lab report (FP2)

This is the exact setup of a real lab report from the *Fortgeschrittenenpraktikum 2* at LMU Munich. It has a separate title page, no logo, the university seal as a very faint watermark, two authors and one affiliation.

**Step 1: the emblem.** Get your university's seal as a black, single-colour PDF (see [Head of the title page](#head-of-the-title-page)). Upload it as `assets/logos/emblem.pdf`. Until you have one, keep using `assets/logos/placeholder-emblem`.

**Step 2: the settings.** Replace everything in `main.tex` from `\documentclass` to `\addbibresource` with:

```latex
\documentclass[titlepage]{generalreport} % separate title page

% ---- Title page head --------------------------------------------------------
% (no \logo)
\emblem[width=0.85\paperwidth, color=black!4, right=0.23, bottom=0.1]{assets/logos/emblem}
\infoline{\textit{Fortgeschrittenenpraktikum 2}, Versuch: H2 Laserspektroskopie, Gruppe 01}
\date{\today}

% ---- Title block -----------------------------------------------------------
\documenttype{LABORBERICHT}
\title[H2 Laserspektroskopie]{Hyperfeinstruktur der Rubidium-D2-Linie}
\subtitle{Absorptions- und dopplerfreie Sättigungsspektroskopie}
\author[1]{Erika Mustermann}
\author[1]{Max Mustermann}
\affiliation[1]{Fakultät für Physik, Ludwig-Maximilians-Universität München}

\addbibresource{references.bib}
```

What changed compared with the template:

| Setting | Value | Why |
|---|---|---|
| `\logo` | deleted | No logo. The seal is already on the title page. |
| `\emblem` | `color=black!4, right=0.23, bottom=0.1` | Half as dark as the default, and moved further onto the page, so more of the seal is visible. |
| `\infoline` | course (italic), experiment, group | Fill in your experiment and group number. |
| `\documenttype` | `LABORBERICHT` | |
| `\title` / `\subtitle` | physics / method | See [section 5](#5-writing-a-good-title). |
| short title | `H2 Laserspektroskopie` | Experiment code and name in the running head. |
| `\author` | your names | Two authors, both `[1]`. |
| `\affiliation[1]` | your faculty and university | No final period. |

**Step 3: the sections.** Keep the section files as they are and rename the two parts of the experiment, e.g. `\section{Absorptionsspektroskopie}` in `teilversuch1.tex` and `\section{Sättigungsspektroskopie}` in `teilversuch2.tex`. Then fill in the text, add your figures to `figures/`, your evaluation code to `code/` ([section 8](#8-code-in-the-appendix)) and your protocol scan to `assets/` ([section 9](#9-scanned-lab-protocol)).

**Step 4:** set the compiler to LuaLaTeX ([section 2](#2-set-the-compiler-to-lualatex)) and compile.

## 12. Troubleshooting

| Problem | Fix |
|---|---|
| `Fatal Package fontspec Error: The fontspec package requires either XeTeX or LuaTeX` | The compiler is still pdfLaTeX. Switch to LuaLaTeX ([section 2](#2-set-the-compiler-to-lualatex)). |
| `??` instead of numbers, or **[key]** instead of citations | Compile again. If it persists, check the label or key spelling. On Overleaf: *Logs and output files → Clear cached files*, then recompile. |
| `Class generalreport Error: Too many authors` | At most three `\author` lines are supported. |
| `File '…' not found` for a figure, emblem or PDF | Check the path and file name (case-sensitive). You can leave out the extension. |
| After uploading the ZIP, all files are inside a folder | Move them to the top level of the project, or set *Main document* to that folder's `main.tex`. |
| Emblem looks blotchy or coloured | Use single-colour black artwork ([section 4](#head-of-the-title-page)). |
| Compiling locally, a font is not found | Update your TeX distribution. TeX Gyre Termes and JetBrains Mono ship with TeX Live 2023 and newer. |

### Language

The template is German throughout. For English output, edit `generalreport.cls`:

- section 5: `ngerman` → `english` in `babel`, `\captionsngerman` → `\captionsenglish` and `Inhalt` → `Contents`. Delete the `\ngermanhyphenmins` line and the `\addto\datengerman{…}` block.
- section 13: `locale=DE` → `locale=UK` and `range-phrase={ bis }` → `range-phrase={ to }` in `siunitx`
- section 16: `ngerman` → `english` in `cleveref`, and `Gleichung` → `Equation`
- section 14: `Quellcode` → `Listing`
