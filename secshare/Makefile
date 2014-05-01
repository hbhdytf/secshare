CC	= gcc
CFLAGS	= -g -Wall -Wconversion-null -Wimplicit-function-declaration
#CFLAGS	= -O2
LDFLAGS	= -lgmp

all: endianess.h secshare

secshare: secshare.o encrypt.o decrypt.o rijndael.o sha1.o share.o common.o
	$(CC) $(LDFLAGS) -o $@ $^ -lgmp

endianess.h: endianess
	./endianess

endianess: endianess.o
	$(CC) -o $@ $^

.PHONY: clean

clean:
	rm -rf *.o secshare endianess *~ *.bak endianess.h
