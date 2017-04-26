# Makefile
PROG	= xroach
VERSION	= 4.0
MAN1	= xroach.1
CFLAGS	= -I/usr/X11R6/include
LDFLAGS	= -L/usr/X11R6/lib
LIBS	= -lm -lX11
SRCS	= xroach.c
OBJS	= xroach.o
SHELL	= /bin/sh
CC	= cc

all:	${PROG}

${PROG}: ${OBJS} patchlevel.h
	${CC} -o $@ ${CFLAGS} ${OBJS} ${LDFLAGS} ${LIBS}
	strip ${PROG}

clean:
	rm -f xroach ${OBJS} core

install: ${PROG}
	-mkdir -p /usr/X11R6/bin /usr/X11R6/man/man1
	chown bin:bin /usr/X11R6/bin /usr/X11R6/man \
		/usr/X11R6/man/man1
	install -o bin -g bin -m 0755 ${PROG} \
		/usr/X11R6/bin/${PROG}
	install -o bin -g bin -m 0644 ${MAN1} \
		/usr/X11R6/man/man1/${MAN1}x

