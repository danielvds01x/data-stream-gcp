FROM golang:1.17-alpine

WORKDIR /app

COPY go.mod ./
RUN go mod download
RUN go get cloud.google.com/go/pubsub

COPY *.go ./

RUN go build -o /app

EXPOSE 8080

CMD ["./app"]
