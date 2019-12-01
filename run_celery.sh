#!/bin/bash

# Start celery worker
celery worker -A config -l info
