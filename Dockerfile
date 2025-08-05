FROM python:3.8-slim-bookworm

WORKDIR /app

# Copy the entire application first
COPY . .

# Install system dependencies
RUN apt update -y && apt install -y --no-install-recommends awscli && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install -r requirements.txt
RUN pip install -e .
# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]



