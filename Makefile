MODULE=gd2

UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
    MAKEFILE=Makefile.osx
else
    MAKEFILE=Makefile
endif

all:
	cd src && make -f$(MAKEFILE)
	cp src/*.so lib/

clean:
	rm -f src/*.o src/*.so
	rm -f lib/*.so

realclean:
	cd src && make -f$(MAKEFILE) realclean
	rm -f lib/*.so

install:
	mkdir -p /usr/local/silkjs/contrib/$(MODULE)
	cp -rp index.js lib /usr/local/silkjs/contrib/$(MODULE)

uninstall:
	cd src && make -f$(MAKEFILE) uninstall
