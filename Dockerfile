FROM golang:1.13-alpine

ADD main.go /app/main.go
RUN go build -o /usr/local/bin/docker-explorer /app/main.go

CMD ["/usr/local/bin/docker-explorer"]
