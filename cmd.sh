#!/bin/bash
set -e
if [ "$ENV" = 'DEV' ]; then
  echo "Running Development Server" # Start server for development
  exec python "/identidock.py"
elif [ "$ENV" = 'UNIT' ]; then
  echo "Running Unit Tests"
  exec python "/test.py"
else
  echo "Running Production Server" # Start server for production
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /identidock.py \
             --callable app --stats 0.0.0.0:9191
fi
