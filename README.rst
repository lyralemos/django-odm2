django-odm2
###########

Django-odm2 maps the ODM2 model to django ORM


About ODM2
==========

ODM2 is an information model for spatially discrete, feature-based earth observations 
that is integrative and extensible and aimed at data interoperability.

For more information `see <https://github.com/ODM2/ODM2/wiki>`_.


Attention
=========

This app is designed only for storage of data modeled by the ODM2 specification.
The code is based on `ODM2DataSharingPortal <https://github.com/ODM2/ODM2DataSharingPortal>`_
and does not provide any views or admin integration. It is up to you to create your 
own implementations.


Quickstart
==========

django-odm2 is available on PyPI and can be installed with `pip <https://pip.pypa.io>`_.

.. code-block:: console

    $ pip install django-odm2

After installing django-odm2 add it to your INSTALLED_APPS list:

.. code-block:: python

    INSTALLED_APPS = [
        ...
        'django_odm2'
    ]

Then run migrate command to create the database tables:

.. code-block:: console

    $ python manage.py migrate

The `API Reference <http://django-odm2.readthedocs.io>`_ provides API-level documentation.