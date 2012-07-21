# Makefile to help automate tasks
WD := $(shell pwd)
PY := bin/python
PIP := bin/pip
NOSE := bin/nosetests


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

# ###########
# Dependencies
# ###########
$(NOSE): deps

.PHONY: deps
deps:
	echo "Hit"
	$(PIP) install -r requirements.txt

# ###########
# Tests
# ###########
.PHONY: test
test: $(NOSE)
	nosetests --with-id -v src/pyohio/tests
