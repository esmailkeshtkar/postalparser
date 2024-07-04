#!/usr/bin/make -f
# Description:
#
#	Builds a quick Bison Program.  Since Bison/Flex natively generate
#	C files, we will use the C compiler instead of the C++ compilar
#	Assigns the executable names of scanner and parser so that they can be called
#
# Flags for the C++ implicit rules

GXX = g++
CCFLAGS = -Wall
CPPFLAGS =

LDFLAGS = -L/home/013/e/em/emk140330/include

LDLIBS = -ltclap -lrudeconfig

#
# PROJECTNAME is a descriptive name used for the backup target
# This should not contain spaces or special characters
PROJECTNAME = Project5

EXECFILE = program

SRCS = $(wildcard *.cc)
HEADERS = $(wildcard *.h)
OBJS := $(patsubst %.cc,%.o,$(SRCS)) 

# These targets don't create files that Make should inspect
.PHONY: all clean backup

all: $(EXECFILE)

clean:
	rm -f $(OBJS) $(EXECFILE) 

$(EXECFILE):	$(OBJS)
	$(GXX) -o $(EXEC) $(LDFLAGS) $(OBJS)
	

backup:
	@make clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename "`pwd`"))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME) 2> /dev/null
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!
