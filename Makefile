# Makefile
# Clayton Brown
# COSC 3750 Spring Semester
# Homework 3
# Date Last Modified: 2/13/2023
#
# This program compiles a program that calculates the
# approximation of e by truncated series


# Declare the variables I'm going to use
CC=gcc
CFLAGS=-Wall -g -I.
# This variable contains targets for the make file
OBJS= prompt.o compute.o display.o approxe

# Declare my targets and phony files
targets: $(OBJS)
.PHONY: clean tidy

# Create the compute object
compute.o: compute.c compute.h
	$(CC) $(CFLAGS) compute.c compute.h -c

# Create the display object
display.o: display.c display.h
	$(CC) $(CFLAGS) display.c display.h -c

# Create the prompt object
prompt.o: prompt.c prompt.h
	$(CC) $(CFLAGS) prompt.c prompt.h -c

# Combine all previous objects to make the approxe executable
approxe: approxe.c prompt.o compute.o display.o
	$(CC) $(CFLAGS) approxe.c prompt.o compute.o display.o -o approxe

# This clean target gets rid of the exectuable file and uses tidy
clean: tidy
	/bin/rm -f "approxe"

# This gets rid of all the extra files created by make (not approxe)
tidy:
	/bin/rm -f "prompt.o"
	/bin/rm -f "compute.o"
	/bin/rm -f "display.o"
	/bin/rm -f "compute.h.gch"
	/bin/rm -f "display.h.gch"
	/bin/rm -f "prompt.h.gch"
