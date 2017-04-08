MMARK:=mmark -xml2 -page

text := $(patsubst %.md,%.txt,$(wildcard afpub*.md))
html := $(patsubst %.md,%.html,$(wildcard afpub*.md))
base := $(patsubst %.md,%,$(wildcard afpub*.md))
mdown := $(wildcard *.md)

all: text html
.PHONY: all

text: $(text)
html: $(html)
.PHONY: text html

$(text): $(mdown)
	$(MMARK) $< > $(base).xml
	xml2rfc --text $(base).xml && rm -f $(base).xml

$(html): $(mdown)
	$(MMARK) $< > $(base).xml
	xml2rfc --html $(base).xml && rm -f $(base).xml

.PHONY: clean
clean:
	rm -fv *.txt *.html *.xml

