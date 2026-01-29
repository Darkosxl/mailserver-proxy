FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY go.mod main.go ./
RUN go build -o proxy .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/proxy .
EXPOSE 3000
CMD ["./proxy"]
