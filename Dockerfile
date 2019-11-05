FROM python:3.7-alpine3.10

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN apk add --no-cache postgresql-dev postgresql-client bash && \
    apk add --no-cache --virtual .build-deps \
        gcc freetype-dev musl-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del .build-deps

COPY . .

EXPOSE 8081

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8081" ]

