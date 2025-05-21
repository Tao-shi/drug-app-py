FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


WORKDIR /app

RUN useradd -m -u 1001 pyuser && \
  chown -R pyuser:pyuser /app

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

USER pyuser

EXPOSE 5000

CMD ["python", "application.py"]
