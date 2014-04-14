BASENAME = program
PDFLATEX = pdflatex
LILYPOND = lilypond-book
SOURCE = src
TARGET = target

all: music pdf

.PHONY: music
music: | $(TARGET)
	$(LILYPOND) --output=$(TARGET) $(SOURCE)/$(BASENAME).lytex

.PHONY: pdf
pdf: music | $(TARGET)
	cd $(TARGET) && $(PDFLATEX) --output-format pdf $(BASENAME).tex

$(TARGET):
	mkdir $(TARGET)

clean:
	rm -rf $(TARGET)
