.PHONY: all clean present

all: org-change.pdf

present:
	LIBGL_ALWAYS_SOFTWARE=1 pinpoint org-change.pin

clean:
	rm -f org-change.pdf org-change.nonotes.pin

org-change.nonotes.pin: org-change.pin
	grep -v '^#' $< > $@

org-change.pdf: org-change.nonotes.pin
	pinpoint --output=$@ $<
