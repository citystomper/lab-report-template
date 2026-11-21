# Guide

Clone the repository and open it in Overleaf or your editor. The compiler must be **LuaLaTeX**.

## Project structure

```text
.
├── main.tex              title page settings, list of sections
├── lab-report.cls
├── references.bib
├── sections/
│   ├── abstract.tex
│   ├── einleitung.tex
│   ├── theorie.tex
│   ├── aufbau.tex
│   ├── teilversuch1.tex
│   ├── teilversuch2.tex
│   ├── zusammenfassung.tex
│   └── anhang.tex
├── figures/
├── code/
└── assets/
    ├── lmu-siegel.pdf
    ├── placeholder-protocol.pdf
    └── logos/
        └── placeholder-logo.pdf
```

You only ever edit `main.tex`, the files in `sections/` and `references.bib`, and add your own files to `figures/`, `code/` and `assets/`.

## Title page

All settings are at the top of `main.tex`. Anything left out (except `\title`) is not printed.

- `\documentclass[titlepage]{lab-report}`: the title gets its own page. Without `titlepage`, title, abstract and contents share page 1.
- `\logo[options]{file}`: small logo, top right. Options go to `\includegraphics`.
- `\emblem[width, color, right, bottom]{file}`: watermark in the bottom-right corner of the title page. `right` and `bottom` are the share of the emblem past the page edge. Defaults: `0.85\paperwidth`, `black!8`, `0.333`, `0.333`. Use single-colour black artwork.
- `\infoline{…}`: top left. Wraps at half the text width; `\\` breaks manually.
- `\date{…}`: below the info line.
- `\documenttype{…}`: letter-spaced label above the title, printed as typed.
- `\title[short title]{title}`: the short title goes in the running head.
- `\subtitle{…}`
- `\author[n]{…}`: up to three authors. `n` is the number of the author's affiliation.
- `\affiliation[n]{…}`: the numbers are only printed with two or more affiliations. The final period is added automatically.

## Appendix

- Code: `\codefile[shown name]{code/file.py}{note}` prints the file with line numbers, the name on the left and the note on the right.
- Protocol: replace `assets/placeholder-protocol.pdf` with your scan and change the file name in the `\includepdf` line in `sections/anhang.tex`.
