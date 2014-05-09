PROGRAM = program
GUIDE = guide
PDFLATEX = pdflatex
LILYPOND = lilypond-book
SOURCE = src
TARGET = target

all: music program guide

music: | $(TARGET)
	$(LILYPOND) --output=$(TARGET) $(SOURCE)/$(PROGRAM).lytex

program: music | $(TARGET)
	cd $(TARGET) && $(PDFLATEX) --output-format pdf $(PROGRAM).tex

guide: | $(TARGET)
	$(PDFLATEX) --output-format pdf -output-directory $(TARGET) $(SOURCE)/$(GUIDE).tex

$(TARGET):
	mkdir $(TARGET)

clean:
	rm -rf $(TARGET)
