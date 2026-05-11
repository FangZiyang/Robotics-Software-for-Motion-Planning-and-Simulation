# MEng Project Report

Robotics Software for Motion Planning and Simulation

This repository contains a thesis/report LaTeX template with sample chapters,
front matter, appendices, figures, bibliography files, and reference PDFs.

## Files to edit

- `main.tex`: the main LaTeX entry point.
- `definitions.tex`: title, author, department, degree, supervisor, and date metadata.
- `introduction.tex`, `sample_chapter.tex`, `conclusion.tex`: thesis body examples.
- `appendixA.tex`, `appendixB.tex`: appendix examples.
- `references.bib`, `references_another.bib`: bibliography examples.

## Build

Compile `main.tex` with a LaTeX distribution such as TeX Live or MiKTeX:

```powershell
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

To switch between double-spaced and single-spaced output, edit the package
selection near the top of `main.tex`.
