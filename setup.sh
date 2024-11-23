#!/bin/bash

# Run migrations
echo "Running migrations..."
python manage.py makemigrations --noinput
python manage.py migrate --noinput

# Create superuser if not exists
echo "Creating superuser..."
python manage.py shell <<EOF
from django.contrib.auth.models import User
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123')
EOF

# Run the server
echo "Starting server..."
exec "$@"
