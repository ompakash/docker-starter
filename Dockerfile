# Use the official Python image
FROM python:3.12

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Copy the setup script
COPY setup.sh /app/setup.sh
RUN chmod +x /app/setup.sh

# Set setup
ENTRYPOINT  ["/app/setup.sh"]

# Default command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
