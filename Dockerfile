# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=count.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
FROM openjdk:11
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD ["java", "Main"]
FROM jenkins:2.60.3-alpine
USER root
RUN apk update && apk add -X build-essential
USER jenkins
