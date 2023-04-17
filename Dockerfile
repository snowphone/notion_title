FROM python:slim

ENV TZ=Asia/Seoul

WORKDIR /app


RUN apt-get update && \
	rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install poetry
RUN poetry config virtualenvs.create false && poetry config virtualenvs.in-project false

COPY pyproject.toml             ./
COPY poetry.lock                ./
COPY title.py                 ./

RUN poetry install --no-dev


ENTRYPOINT [ "python", "title.py" ]
