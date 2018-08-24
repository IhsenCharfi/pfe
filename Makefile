SOURCE := main
REPORT := rapport
EXT_DIR := extensions
OUT_DIR := build

open: pdf
	gio open $(REPORT).pdf

pdf: export TEXINPUTS := ./$(EXT_DIR)//:
pdf: dir
	mkdir -p build
	latexmk -output-directory=$(OUT_DIR) --aux-directory=$(OUT_DIR)
	cp $(OUT_DIR)/$(SOURCE).pdf $(REPORT).pdf

dir:
	find . -maxdepth 1 -type d -not -path "*/build" -not -path "*/\.*" -exec mkdir -p -- $(OUT_DIR)/{} \;

clean:
	- rm -rf $(OUT_DIR)/*
	- rm -f $(REPORT).pdf

.PHONY: clean open
