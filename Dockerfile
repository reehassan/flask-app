FROM python:3.13-alpine

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Fix: Add app root to Python path
ENV PYTHONPATH=/app

# Production run command
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
