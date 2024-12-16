OUTPUT_DIR := ..
M4_SOURCES := $(shell find . -type f -name '*.m4'  -not -path "./macros.m4")
HTML_TARGETS := $(patsubst %.m4, $(OUTPUT_DIR)/%.html, $(M4_SOURCES))

all: $(HTML_TARGETS)

$(OUTPUT_DIR)/%.html: %.m4 macros.m4
	m4 $< > $@

.PHONY: clean

clean:
	rm -f $(HTML_TARGETS)
