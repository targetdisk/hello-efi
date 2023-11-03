ARCH ?= x86_64

CFLAGS ?= -pedantic -Wall -Wextra -Werror --ansi
export CFLAGS ARCH

UNAME = $(shell uname)
OPEN ?= xdg-open

.PHONY: Makefile README.md

%: Makefile
	USE_GCC=1 $(MAKE) -C$@ -j$(shell nproc)

pub.css:
	wget https://github.com/manuelp/pandoc-stylesheet/raw/acac36b976966f76544176161ba826d519b6f40c/pub.css

README.html: README.md pub.css # Requires Pandoc to be installed
	pandoc $< -s -c pub.css -o $@
	$(OPEN) $@
