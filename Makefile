all: build

.PHONY: build
build: clean
	./build.sh

.PHONY: clean
clean:
	rm -f docs/*.html

.PHONY: serve
serve:
	cd docs && python -m http.server
