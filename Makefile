include Make.options

PREFIX:=/usr/local
BINPREFIX:=$(PREFIX)/bin
LIBEXEC_PREFIX := $(PREFIX)/lib-exec
CP:=cp
EXE_NAME:=grmc
MKDIR:=mkdir
ifeq ($(OS),Windows NT)
    EXE_NAME:=$(EXE_NAME).bat
endif

.PHONY: default
default:
	cd lib-exec && "$(MAKE)" -f grmc.makefile default

.PHONY: clean
clean:
	cd lib-exec && "$(MAKE)" -f grmc.makefile clean
	cd tests && "$(MAKE)" clean

.PHONY: tests
tests:
	cd tests && "$(MAKE)" tests

.PHONY: install
install: default
	$(MKDIR) -p $(BINPREFIX)
	$(MKDIR) -p $(LIBEXEC_PREFIX)
	$(CP) -u -t $(BINPREFIX) bin/$(EXE_NAME)
	$(CP) -u -t $(LIBEXEC_PREFIX) lib-exec/grmc.makefile
	$(CP) -u -r -t $(LIBEXEC_PREFIX) lib-exec/GOLD-Builder-*-Cmd


