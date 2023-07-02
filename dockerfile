# Use the official Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the poetry.lock and pyproject.toml files
COPY /src/poetry.lock /src/pyproject.toml /app/

# Install Poetry
RUN pip install poetry

# Install project dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Copy the application code
COPY . /app

# Expose the port on which the application will run (if applicable)
EXPOSE 8000

# Run the application
CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]