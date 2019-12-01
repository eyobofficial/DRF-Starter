#!/bin/bash

# Run tests
docker-compose run web python manage.py test --no-input
