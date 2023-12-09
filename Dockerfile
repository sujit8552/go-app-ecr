FROM golang:latest AS builder

WORKDIR /app

COPY ./ .

RUN go env -w CGO_ENABLED=0 GO111MODULE=off && go build -o main .

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 5000

CMD ["/app/main"]

