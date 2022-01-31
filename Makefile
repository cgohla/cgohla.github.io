build: diagrams
	cabal run site -- build

clean:
	$(MAKE) -C diagrams clean
	cabal run site -- clean || true
	rm *~ || true

watch: diagrams
	cabal run site -- watch

diagrams:
	$(MAKE) -C diagrams all
