autodoc.rpm:
	fpm -s dir -t rpm --name autodoc --version 0.3 \
	--architecture all --depends bash \
	--description "Automatic generation of system documentation" \
	--url "https://github.com/gonozal8/autodoc" --maintainer "gonozal8@github.com" \
        autodoc=/usr/bin/autodoc README.md=/usr/share/doc/autodoc/README.md
