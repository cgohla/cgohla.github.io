

build:
	cabal run site -- build

clean:
	cabal run site -- clean

watch:
	cabal run site -- watch

deploy: build
	## TODO check that the branch is clean
	## TODO check we're on the main branch
	cp -rv _site/* docs
	find docs -exec git add \{\} \;
	git commit -m "add generated files"
	git push origin main
