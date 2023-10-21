# Use an official Python runtime as a parent image
FROM python:3.8-slim

#### Set environment variables ####
# This prevents Python from writing out pyc files
ENV PYTHONDONTWRITEBYTECODE 1
#Force the stdout and stderr streams to be unbuffered
ENV PYTHONUNBUFFERED 1 

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project
COPY . /app/

# Run the application
CMD ["python", "app.py"]