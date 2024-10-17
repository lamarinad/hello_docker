FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o hello_world

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/hello_world .

EXPOSE 8080

CMD ["./hello_world"]
