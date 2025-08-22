FROM python:3.12-slim

WORKDIR /tests

COPY tests /tests

RUN pip install --no-cache-dir -r requirements.txt

CMD ["pytest", "-v", "."]

