FROM --platform=linux/amd64 python:3.10.10

RUN mkdir /fastapi_app

WORKDIR /fastapi_app

RUN apt-get update && apt-get install -y git libpq-dev postgresql-client netcat

COPY ./src/pyproject.toml /fastapi_app/
COPY ./src/poetry.lock /fastapi_app/

RUN pip install poetry && poetry config virtualenvs.create false && poetry install

COPY . .

RUN chmod a+x bash/*.sh