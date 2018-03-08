# project folders
SDIR=src
IDIR=include
LDIR=lib
ODIR=obj

# compiler settings
CC=gcc
CFLAGS=-I$(IDIR)
LIBS=-lm
_DEPS=hellomake.h
DEPS=$(patsubst %,$(IDIR)/%,$(_DEPS))
_OBJ=hellomake.o printHello.o
OBJ=$(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	$(CC) -o $@ $^  $(CFLAGS) $(LIBS)

# $@ refers to left side of ':', $^ refers to right
# $< refers to first item of dependencies list
