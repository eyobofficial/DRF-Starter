#!/bin/bash

# Start celery worker
celery worker -A config -l info  # TODO: Daemonize this in production
