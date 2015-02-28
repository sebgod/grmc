include Make.options

.PHONY: default
default:
#	cd bin && "$(MAKE)" default
	cd lib-exec && "$(MAKE)" -f grmc.makefile default

.PHONY: clean
clean:
#	cd bin && "$(MAKE)" clean
	cd lib-exec && "$(MAKE)" -f grmc.makefile clean
	cd tests && "$(MAKE)" clean

.PHONY: tests
tests:
	cd tests && "$(MAKE)" tests
