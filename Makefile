# Makefile to help automate tasks
WD := $(shell pwd)
PY := bin/python
PIP := bin/pip

# #######
# INSTALL
# #######
.PHONY: all
all: venv develop

venv: bin/python
bin/python:
	virtualenv .

.PHONY: clean_venv
clean_venv:
	rm -rf bin include lib local man share

# ###########
# Development
# ###########
.PHONY: develop
develop: lib/python*/site-packages/pyohio.egg-link
lib/python*/site-packages/pyohio.egg-link:
	$(PY) setup.py develop

.PHONY: clean_all
clean_all: clean_venv
	- rm -r dist
