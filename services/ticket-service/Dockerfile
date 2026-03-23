# --- Stage 1: The Builder ---
FROM python:3.12-slim as builder

WORKDIR /app

# Prevent Python from writing .pyc files & buffering output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install minimal system dependencies for building
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies to a local folder
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# --- Stage 2: The Final Runtime ---
FROM python:3.12-slim

WORKDIR /app

# Copy ONLY the installed packages from the builder
COPY --from=builder /root/.local /root/.local
COPY . .

# Ensure the app can find the installed packages
ENV PATH=/root/.local/bin:$PATH
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

# We use 0.0.0.0 so the container can accept outside traffic
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]