FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -o hello-world .

FROM alpine:latest 

WORKDIR /app

COPY --from=builder /app/hello-world .

EXPOSE 8080

CMD ["./hello-world"]