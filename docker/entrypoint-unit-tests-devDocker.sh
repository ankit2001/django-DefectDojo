#!/bin/sh
# Run available unittests with a simple setup

cd /app
# Unset the database URL so that we can force the DD_TEST_DATABASE_NAME (see django "DATABASES" configuration in settings.dist.py)
unset DD_DATABASE_URL

python manage.py makemigrations dojo
python manage.py migrate

python manage.py test dojo.unittests --keepdb

echo "End of tests. Leaving the container up"
tail -f /dev/null
