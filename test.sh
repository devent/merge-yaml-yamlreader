#!/bin/bash
set -e

function run_yamlreader() {
  docker run -it --rm \
    -v `realpath $WORK_DIR`:/work \
    $REPOSITORY/$NAME:$VERSION \
    yamlreader "$@"
}

REPOSITORY=erwinnttdata
NAME=merge-yaml
VERSION=latest
WORK_DIR=test

run_yamlreader defaults.yaml env-0.yaml

