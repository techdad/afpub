MMARK:=mmark -xml2 -page

text := $(patsubst %.md,%.txt,$(wildcard *.md))
html := $(patsubst %.md,%.html,$(wildcard *.md))
base := $(patsubst %.md,%,$(wildcard *.md))
mdown := $(wildcard *.md)

all: text html
.PHONY: all

text: $(text)
html: $(html)
.PHONY: text html

$(text): $(mdown)
	$(MMARK) $< > $<.xml
	xml2rfc -b $(base) --text $<.xml && rm -f $<.xml

$(html): $(mdown)
	$(MMARK) $< > $<.xml
	xml2rfc -b $(base) --html $<.xml && rm -f $<.xml

.PHONY: clean
clean:
	rm -fv *.txt *.html *.xml

