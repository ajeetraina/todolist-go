FROM golang:1.16-alpine

RUN apk update && apk add go sqlite gcc

RUN mkdir /app

COPY . /app

WORKDIR /app



RUN go get github.com/thewhitetulip/Tasks
RUN cat schema.sql | sqlite3 tasks.db

RUN go build

EXPOSE 8081
CMD  ["/bin/sh", "./Tasks" ]
