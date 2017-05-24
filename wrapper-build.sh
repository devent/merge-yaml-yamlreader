#!/bin/bash
set -x

virtualenv venv
source venv/bin/activate
pip install pybuilder
pyb install_dependencies
pyb verify
