# Pranshu Bheda — CV

LaTeX source and build pipeline for my CV. The repo produces three artifacts from two parallel sources:

| Output | Source | Use for |
|---|---|---|
| `pranshu_bheda_cv.pdf` | `pranshu_bheda_cv.tex` | Primary — most applications, email, referrals |
| `pranshu_bheda_cv.docx` | `pranshu_bheda_cv.md` | Fallback for ATS portals that reject/mangle PDFs |
| `pranshu_bheda_cv.md` | (hand-maintained) | Source for DOCX; also pastes cleanly into plain-text fields |

## Build

```bash
make        # build both PDF and DOCX
make pdf    # build PDF only
make docx   # build DOCX only
make clean  # remove build artifacts
```

The pre-commit hook at `.git/hooks/pre-commit` auto-rebuilds outputs when their source is staged and warns if `.tex` and `.md` drift apart.

## Dependencies

```bash
brew install --cask basictex   # provides pdflatex
brew install pandoc            # markdown → docx
brew install poppler           # pdftotext, for ATS parser sanity checks
```

After installing BasicTeX you may need to refresh the shell path:

```bash
eval "$(/usr/libexec/path_helper)"
```

## Editing

The two sources are maintained in parallel — when you change one, update the other. The pre-commit hook warns when only one is staged so you don't ship divergent versions.

- **`.tex`** drives visual polish (fonts, margins, spacing, typography). Edit here for the PDF.
- **`.md`** drives DOCX output. Keep it a plain structural mirror of the content.

To check your PDF the way an ATS sees it:

```bash
pdftotext pranshu_bheda_cv.pdf - | less
```

## Overleaf

The `.tex` also builds cleanly on Overleaf — push to GitHub, then import the repo in Overleaf.
