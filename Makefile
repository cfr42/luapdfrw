# Prepare the CTAN submission.

PACKAGE = luapdfrw
VERSION = 1.0.0
YEAR = 2026
MONTH = 10
DAY = 12

FORMAT = generic

COMMON = 
PLAIN = 
GENERIC = pdfrw.lua
LATEX = 
SOURCE =
SCRIPTS :=
MAN :=
CTAN = $(GENERIC)

EXAMPLES := pdfextractfromseveral pdfextract pdfextractseveral pdfinsert pdfremove
EXAMPLES := $(EXAMPLES:%=examples/%.lua)

README = README.md
INSTALL = INSTALL.md
CHANGELOG = CHANGELOG.md
MAKEFILE = 
LICENCE = LICENCE

# For Lua tests
LUA_VERSION := 5.3
LUA_PREFIXES := /usr $(HOME)/.luarocks
LUA_EXTRA_DIRS = \
	$(LUA_PREFIXES:%=%/share/lua/$(LUA_VERSION)/?.lua) \
	$(LUA_PREFIXES:%=%/share/lua/$(LUA_VERSION)/?/init.lua) \
	$(LUA_PREFIXES:%=%/lib/lua/$(LUA_VERSION)/?.lua) \
	$(LUA_PREFIXES:%=%/lib/lua/$(LUA_VERSION)/?/init.lua)
LUA_EXTRA_CDIRS = \
	$(LUA_PREFIXES:%=%/lib/lua/$(LUA_VERSION)/?.so) \
	$(LUA_PREFIXES:%=%/lib/lua/$(LUA_VERSION)/loadall.so)
noop =
space = $(noop) $(noop)
LUA_PATH = ;;$(subst $(space),;,$(LUA_EXTRA_DIRS))
LUA_CPATH = ;;$(subst $(space),;,$(LUA_EXTRA_CDIRS))

ctan/$(PACKAGE).zip:
	$(TDS-BEGIN)
	$(TDS-END)
	$(CTAN-BEGIN)
	$(CTAN-END)
	@echo "Don't forget to run the tests!"

test:
	@echo todo

include Makefile.package
