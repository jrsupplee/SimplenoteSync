# install configuration
PREFIX = /usr/local
BINDIR = ${PREFIX}/bin
MANDIR = ${PREFIX}/man/man1

PROGRAM = SimplenoteSync

.PHONY: all man install uninstall clean

all: man

man: ${PROGRAM}.1

${PROGRAM}.1: ${PROGRAM}
	pod2man --center='Simplenote Synchronization' --section=1 ${PROGRAM} > ${PROGRAM}.1

install: all
	install -d ${BINDIR}
	install -d ${MANDIR}
	install --mode 755 ${PROGRAM} ${BINDIR}/${PROGRAM}
	install --mode 644 ${PROGRAM}.1 ${MANDIR}

uninstall:
	-rm ${BINDIR}/${PROGRAM}
	-rmdir ${MANDIR}/${PROGRAM}.1

clean:
	rm -f ${PROGRAM}.1

