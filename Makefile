all:
	jekyll server --watch

.PHONY: build
build:
	jekyll build
