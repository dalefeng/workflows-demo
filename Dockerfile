FROM golang AS builder

WORKDIR /build

COPY . .

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOPROXY=https://goproxy.cn,direct \
    CGO_ENABLED=1 \
    GOOS=linux

RUN go build -o server .

FROM ubuntu:22.04

WORKDIR /app

LABEL MAINTAINER="dalefengs@gmail.com"

RUN apt update

COPY --from=builder /build/wf /app
ENTRYPOINT ["/app/wf"]
