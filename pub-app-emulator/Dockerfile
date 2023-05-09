FROM golang:1.17-alpine

ENV PROJECT='my-project-1544131915126' \
    PUBSUB_TOPIC='qt-emulated-topic'

WORKDIR /app

COPY go.mod ./
RUN go mod download
RUN go get cloud.google.com/go/pubsub

COPY *.go ./

RUN go build -o /app

EXPOSE 8080

CMD ["./app"]
