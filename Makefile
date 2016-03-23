all:
	bundle exec jekyll server --watch

.PHONY: build
build:
	bundle exec jekyll build
