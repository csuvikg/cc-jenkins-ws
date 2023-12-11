FROM python:3.10

WORKDIR /app

COPY app.py .

ENTRYPOINT [ "python3", "app.py" ]
