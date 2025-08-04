#!/bin/sh
echo "⏳ Waiting for MySQL at $MYSQL_HOST:$MYSQL_PORT..."
while ! nc -z $MYSQL_HOST $MYSQL_PORT; do
  sleep 2
done
echo "✅ MySQL is up - starting application"
exec "$@"
