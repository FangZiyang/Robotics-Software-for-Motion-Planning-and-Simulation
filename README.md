# MEng Project Report

Robotics Software for Motion Planning and Simulation

This repository contains a thesis/report LaTeX template with separate chapter
files, front matter, appendices, figures, bibliography files, and reference PDFs.

## Files to edit

- `main.tex`: the main LaTeX entry point.
- `definitions.tex`: title, author, department, degree, supervisor, and date metadata.
- `introduction.tex`, `background.tex`, `methodology.tex`,
  `selected_software_commonality.tex`, `measurement_results.tex`,
  `developer_interviews.tex`, `discussion.tex`, `recommendations.tex`,
  `conclusion.tex`: thesis body chapters.
- `appendixA.tex` through `appendixE.tex`: thesis appendices.
- `references.bib`, `references_another.bib`: bibliography examples.

## Manual build

Compile `main.tex` through the Docker LaTeX image used for this project. Run
this command from the repository root, the folder that contains `main.tex`:

```powershell
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest pdflatex -interaction=nonstopmode -halt-on-error main.tex
```

This command starts a temporary Docker container, mounts the current project
folder into the container at `/work`, runs LaTeX there, and writes the generated
files back into the same folder. The important pieces are:

- `--rm`: delete the temporary container after the command finishes.
- `-v "${PWD}:/work"`: make the current project folder visible inside Docker.
- `-w /work`: run commands from that mounted project folder.
- `sb2nov/latex:latest`: use the LaTeX Docker image.
- `pdflatex ... main.tex`: compile the thesis entry point.

If the table of contents or cross-references look stale, run the same command
twice.

After citations have been added, use the standard LaTeX/BibTeX sequence inside
the same Docker image: `pdflatex`, `bibtex`, `pdflatex`, `pdflatex`. If the
current skeleton has no citations yet, `bibtex main` reports that it found no
citations; in that case, running `pdflatex` twice is enough to update the table
of contents and cross-references.

## GitHub Actions build

The repository includes a GitHub Actions workflow at
`.github/workflows/build-thesis.yml`. On every push, pull request, or manual
workflow run, GitHub Actions checks out the repository, runs a public TeX Live
Docker image, compiles `main.pdf`, and uploads `main.pdf` plus `main.log` as a
workflow artifact named `thesis-pdf`. The local command above uses the Docker
image already available on this machine; the CI workflow uses
`texlive/texlive:latest` because GitHub runners must pull a public image.

After pushing to GitHub, open the repository on GitHub, go to the Actions tab,
select the "Build thesis PDF" run, and download the `thesis-pdf` artifact from
the completed run.

To switch between double-spaced and single-spaced output, edit the package
selection near the top of `main.tex`.
