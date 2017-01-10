MMARK:=mmark -xml2 -page

objects := $(patsubst %.md,%.txt,$(wildcard *.md))

all: $(objects)

%.txt: %.md
	$(MMARK) $< > $<.xml
	xml2rfc --text $<.xml

.PHONY: clean
clean:
	rm -f *.txt *.xml

