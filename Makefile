PWD=$(shell pwd)
DESTDIR?=/
PREFIX?=/usr
BINDIR=$(DESTDIR)/$(PREFIX)/bin

all:
	$(MAKE) clean
	r2 -qA -B 0x400000 -i diaphora_r2.py /bin/ls
	#r2 -i diaphora_r2.py /bin/ls
	echo 'select edges from functions;' | sqlite3 output.sqlite | grep -v 0

clean:
	rm -f output.sqlite*

install:
	ln -fs $(PWD)/diaphora.py $(BINDIR)/diaphora
	ln -fs $(PWD)/diaphora_r2.py $(BINDIR)/diaphora-r2

uninstall:
	rm -f $(BINDIR)/diaphora $(BINDIR)/diaphora-r2
