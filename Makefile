REPOSITORY := erwinnttdata
NAME := merge-yaml
VERSION ?= 1.0-012
BUILD_PATH=/usr/local/bin

build: _build ##@targets Builds the docker image.
.PHONY: build

rebuild: _rebuild ##@targets Builds the docker image anew.
.PHONY: rebuild

clean: _clean ##@targets Removes the docker image.
.PHONY: clean

deploy: _deploy ##@targets Deploys the docker image to the repository.
.PHONY: deploy

include Makefile.help
include Makefile.functions
include Makefile.image
