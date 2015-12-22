#
# Makefile for heartrate_cpp
# 18-551 group 2
# this makes test.cpp with ICA (JadeR), Mat utilities, filtering, and kissfft object files.
#

CC = g++
CFLAGS = -c -w 
# CFLAGS = -c -w -L~/usr/lib -lfftw3  -L/usr/lib -lm

all: extractHR

extractHR.o: extractHR.cpp 
	$(CC) $(CFLAGS) extractHR.cpp

#testfunc.o: testfunc.cpp 
#	$(CC) $(CFLAGS) testfunc.cpp

	
JnS.o: JnS-1.2/JnS.c JnS-1.2/JnS.h
	$(CC) $(CFLAGS) JnS-1.2/JnS.c

Matutil.o: JnS-1.2/Matutil.c JnS-1.2/Matutil.h
	$(CC) $(CFLAGS) JnS-1.2/Matutil.c

filtering.o: filtering.c
	gcc $(CFLAGS) filtering.c

kiss_fft.o: kiss_fft130/kiss_fft.c kiss_fft130/kiss_fft.h
	gcc $(CFLAGS) kiss_fft130/kiss_fft.c


extractHR: Matutil.o JnS.o kiss_fft.o filtering.o extractHR.o 

clean:
	rm -f *~ *.o 

