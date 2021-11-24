.PHONY: build
build: clean
	./build.sh

.PHONY: clean
clean:
	rm -f docs/*.html
