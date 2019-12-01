#!/bin/bash

# Check if database is ready
echo 'Waiting for database....'
while ! nc -z $DB_HOST $DB_PORT; do
    sleep 1s
done

echo 'Database is ready...'

# Run migrations
echo 'Run migrations...'
python manage.py makemigrations  # TODO: Remove later

# Run all tests
echo 'Run tests...'
python manage.py test --no-input

exit
