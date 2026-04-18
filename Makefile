TEX := pranshu_bheda_cv.tex
MD  := pranshu_bheda_cv.md
PDF := pranshu_bheda_cv.pdf
DOCX:= pranshu_bheda_cv.docx

.PHONY: all pdf docx clean check-sync

all: pdf docx

pdf: $(PDF)

docx: $(DOCX)

$(PDF): $(TEX)
	@eval "$$(/usr/libexec/path_helper)" && pdflatex -interaction=nonstopmode $(TEX) > /dev/null
	@echo "✓ Built $(PDF)"

$(DOCX): $(MD)
	@pandoc $(MD) -o $(DOCX)
	@echo "✓ Built $(DOCX)"

check-sync:
	@if [ "$(TEX)" -nt "$(MD)" ]; then \
		echo "⚠  $(TEX) is newer than $(MD) — update $(MD) to match."; \
		exit 1; \
	fi
	@if [ "$(MD)" -nt "$(TEX)" ]; then \
		echo "⚠  $(MD) is newer than $(TEX) — update $(TEX) to match."; \
		exit 1; \
	fi
	@echo "✓ Sources are in sync"

clean:
	@rm -f $(PDF) $(DOCX) *.aux *.log *.out
	@echo "✓ Cleaned build artifacts"
