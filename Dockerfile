# ==================================
# Use an official Python runtime as a parent image
FROM python:3.10-slim
RUN apt-get update 


# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /usr/src/APPNAME


# Install Python dependencies
# COPY requirements.txt and pyproject.toml if you're using poetry for dependency management
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --no-cache-dir APPNAME

# Copy the rest of the application
COPY . .
