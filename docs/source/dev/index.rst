Developers Guide
################

.. include:: ../../../CONTRIBUTING.rst

.. _style-compliance-label:

Code Style
==========

Adopting a consistent code style assists with maintenance. This project uses
Blue to format code and isort to sort imports. Use the Makefile convenience rule
to apply code style fixes.

.. code-block:: console

    (django-odm2) $ make style

.. _format-label:

Code Formatting
---------------

A Makefile convenience rule exists to perform just code format fixes.

.. code-block:: console

    (django-odm2) $ make format

.. _import-sort-label:

Import Sorting
--------------

A Makefile convenience rule exists to perform just module import sorting fixes.

.. code-block:: console

    (django-odm2) $ make sort-imports


.. _static-analysis-label:

Static Analysis
===============

A Makefile convenience rule exists to simplify performing static analysis
checks. This will perform linting and type annotations checks.

.. code-block:: console

    (django-odm2) $ make check-static-analysis


.. _code-linting-label:

Code Linting
------------

A Makefile convenience rule exists to perform code linting checks.

.. code-block:: console

    (django-odm2) $ make check-lint


.. _annotations-label:

Type Annotations
----------------

The code base contains type annotations to provide helpful type information
that can improve code maintenance. A Makefile convenience rule exists to check
no type annotations issues are reported.

.. code-block:: console

    (django-odm2) $ make check-types


.. _documentation-label:

Documentation
=============

To rebuild this project's documentation, developers should use the Makefile
in the top level directory. It performs a number of steps to create a new
set of `sphinx <http://sphinx-doc.org/>`_ html content.

.. code-block:: console

    (django-odm2) $ make docs

To quickly check consistency of ReStructuredText files use the dummy run which
does not actually generate HTML content.

.. code-block:: console

    (django-odm2) $ make check-docs

To quickly view the HTML rendered docs, start a simple web server and open a
browser to http://127.0.0.1:8000/.

.. code-block:: console

    (django-odm2) $ make serve-docs


.. _release-label:

Release Process
===============

The following steps are used to make a new software release.

The steps assume they are executed from within a development virtual
environment.

- Check that the package version label in ``__init__.py`` is correct.

- Create and push a repo tag to Github. As a convention use the package
  version number (e.g. YY.MM.MICRO) as the tag.

  .. code-block:: console

      $ git checkout master
      $ git tag YY.MM.MICRO -m "A meaningful release tag comment"
      $ git tag  # check release tag is in list
      $ git push --tags origin master

  - This will trigger Github to create a release at:

    ::

        https://github.com/{username}/django-odm2/releases/{tag}

- Create the release distribution. This project produces an artefact called a
  pure Python wheel. The wheel file will be created in the ``dist`` directory.

  .. code-block:: console

      (django-odm2) $ make dist

- Upload the release to PyPI using

  .. code-block:: console

      (django-odm2) $ make dist-upload

  The package should now be available at https://pypi.org/project/django_odm2/
