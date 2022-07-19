django-odm2
###########

Django-odm2 maps the ODM2 model to django ORM

.. toctree::
   :maxdepth: 2
   :numbered:
   :hidden:

   user/index
   api/index
   dev/index


Quick Start
===========

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
