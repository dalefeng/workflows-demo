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

LABEL MAINTAINER="dalefengs@gmail.com"

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y tzdata \
    ca-certificates && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


WORKDIR /app
COPY --from=builder /build/server /app

ENTRYPOINT ["/app/server"]
