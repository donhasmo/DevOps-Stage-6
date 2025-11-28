# log-message-processor/Dockerfile
FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

# Copy only requirements first to take advantage of layer caching
COPY requirements.txt /app/requirements.txt

# Upgrade pip tools then install python deps
RUN python -m pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r /app/requirements.txt

# Copy the app source after installing deps
COPY . /app

# If your app listens on a port, expose it (optional)
# EXPOSE 8080

CMD ["python", "main.py"]