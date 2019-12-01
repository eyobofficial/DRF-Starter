#!/bin/bash

mv env.travis .env

# Check if database is ready
echo 'Waiting for database....'
echo $DB_HOST
echo $DB_PORT

echo
echo

while ! nc -z $DB_HOST $DB_PORT; do
    sleep 2s
done

echo 'Database is ready...'

# Run migrations
echo 'Run migrations...'
python manage.py makemigrations  # TODO: Remove later

# Run all tests
echo 'Run tests...'
python manage.py test --no-input
