#!/bin/bash

while ! docker-compose run web nc -z $DB_HOST $DB_PORT; do
    sleep 2s
done

docker-compose run web python manage.py test --no-input
