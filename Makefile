PACKAGE_NAME := autodoc
VERSION ?= 0.4
RELEASE_NUM ?= 1
RELEASE_COMMIT := $(shell git rev-parse --short HEAD)
RELEASE ?= $(RELEASE_NUM).$(RELEASE_COMMIT)

BUILDDIR := $(HOME)/rpmbuild/BUILD/$(PACKAGE_NAME)-$(VERSION)

default:

shellcheck:
	shellcheck -S info autodoc

fpm:
	@echo error: Using fpm to build a package is not recommended and no longer maintained. Please use \"make rpm\" instead.
	@exit 1
	#fpm -s dir -t rpm --name autodoc --version $(VERSION) \
    --architecture all --depends bash \
    --description "Automatic generation of system documentation" \
    --url "https://github.com/gonozal8/autodoc" --maintainer "gonozal8@github.com" \
        autodoc=/usr/bin/autodoc README.md=/usr/share/doc/autodoc/README.md

builddir:
	install -d "$(BUILDDIR)"
	install -m 0755 -D autodoc $(BUILDDIR)/usr/bin/autodoc
	install -m 0644 -D README.md $(BUILDDIR)/usr/share/doc/autodoc/README.md
	install -m 0644 -D autodoc.tpl $(BUILDDIR)/usr/share/doc/autodoc/autodoc.tpl

rpm: builddir
	rpmbuild -v -ba --buildroot="$(BUILDDIR)" -D "VERSION $(VERSION)" -D "RELEASE $(RELEASE)" ./autodoc.spec

clean:
	@echo Automatic cleanup is not supported. Please run the following command manually:
	@echo find "$(BUILDDIR)" -delete
	@exit 1
