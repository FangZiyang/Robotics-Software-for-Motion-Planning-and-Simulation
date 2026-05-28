# Building the Thesis PDF

This project builds through Docker, so a local TeX installation is not required.

## Standard build

From the project root in PowerShell:

```powershell
.\build-pdf.ps1
```

This runs:

```text
pdflatex -> bibtex -> pdflatex -> pdflatex
```

The generated PDF is `main.pdf`.

## Faster build while editing

Use this when citations and bibliography have not changed:

```powershell
.\build-pdf.ps1 -Fast
```

This runs `pdflatex` twice and skips BibTeX.

## Direct Docker Compose commands

The Docker Compose service is named `latex`.

```powershell
docker compose run --rm latex pdflatex -interaction=nonstopmode -halt-on-error main.tex
docker compose run --rm latex bibtex main
docker compose run --rm latex pdflatex -interaction=nonstopmode -halt-on-error main.tex
docker compose run --rm latex pdflatex -interaction=nonstopmode -halt-on-error main.tex
```

If Docker commands hang before LaTeX output appears, restart Docker Desktop and run the script again.
