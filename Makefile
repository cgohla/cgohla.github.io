build: diagrams
	cabal run site -- build

clean:
	$(MAKE) -C diagrams clean
	cabal run site -- clean || true
	rm *~ || true

watch: diagrams
	cabal run site -- watch

deploy: build
	## TODO check that the branch is clean
	## TODO check we're on the main branch
	cp -rv _site/* docs
	find docs -exec git add \{\} \;
	git commit -m "add generated files"
	git push origin main
diagrams:
	$(MAKE) -C diagrams all
