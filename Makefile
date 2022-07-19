# This makefile has been created to help developers perform common actions.
# Most actions assume it is operating in a virtual environment where the
# python command links to the appropriate virtual environment Python.

MAKEFLAGS += --no-print-directory

# Do not remove this block. It is used by the 'help' rule when
# constructing the help output.
# help:
# help: django-odm2 Makefile help
# help:

# help: help                           - display this makefile's help information
.PHONY: help
help:
	@grep "^# help\:" Makefile | grep -v grep | sed 's/\# help\: //' | sed 's/\# help\://'

# help: venv                           - create a virtual environment for development
.PHONY: venv
venv:
	@rm -Rf venv
	@python3 -m venv venv --prompt django-odm2
	@/bin/bash -c "source venv/bin/activate && pip install pip --upgrade && pip install -r requirements.dev.txt && pip install -e ."
	@echo "Enter virtual environment using:\n\n\t$ source venv/bin/activate\n"


# help: clean                          - clean all files using .gitignore rules
.PHONY: clean
clean:
	@git clean -X -f -d


# help: scrub                          - clean all files, even untracked files
.PHONY: scrub
scrub:
	git clean -x -f -d


# help: format                         - perform code style format
.PHONY: format
format:
	@blue src/django_odm2


# help: check-format                   - check code format compliance
.PHONY: check-format
check-format:
	@blue --check src/django_odm2


# help: sort-imports                   - apply import sort ordering
.PHONY: sort-imports
sort-imports:
	@isort . --profile django


# help: check-sort-imports             - check imports are sorted
.PHONY: check-sort-imports
check-sort-imports:
	@isort . --check-only --profile django


# help: style                          - perform code style format
.PHONY: style
style: sort-imports format


# help: check-style                    - check code style compliance
.PHONY: check-style
check-style: check-sort-imports check-format


# help: check-types                    - check type hint annotations
.PHONY: check-types
check-types:
	@cd src; mypy -p django_odm2 --ignore-missing-imports


# help: check-lint                     - run static analysis checks
.PHONY: check-lint
check-lint:
	@pylint --load-plugins pylint_django --rcfile=.pylintrc django_odm2 setup.py


# help: check-static-analysis          - check code style compliance
.PHONY: check-static-analysis
check-static-analysis: check-lint check-types


# help: docs                           - generate project documentation
.PHONY: docs
docs:
	@cd docs; rm -rf source/api/django-odm2*.rst source/api/modules.rst build/*
	@cd docs; make html


# help: check-docs                     - quick check docs consistency
.PHONY: check-docs
check-docs:
	@cd docs; make dummy


# help: serve-docs                     - serve project html documentation
.PHONY: serve-docs
serve-docs:
	@cd docs/build; python -m http.server --bind 127.0.0.1


# help: dist                           - create a wheel distribution package
.PHONY: dist
dist:
	@python setup.py bdist_wheel


# help: dist-upload                    - upload a wheel distribution package
.PHONY: dist-upload
dist-upload:
	@twine upload dist/django-odm2-*-py3-none-any.whl


# Keep these lines at the end of the file to retain nice help
# output formatting.
# help:
