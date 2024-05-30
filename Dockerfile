
#Stage-1
FROM python:3.9 AS baseimg

WORKDIR /app

COPY requirements.txt

RUN pip install -r requirements.txt

COPY . .

# Stage-2
FROM python:3.9-slim

WORKDIR /app

COPY --from=baseimg /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
COPY --from=baseimg /app /app
