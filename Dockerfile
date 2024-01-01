FROM golang:alpine as builder

WORKDIR /go/src/workflows-demo
COPY . .

RUN go env -w GO111MODULE=on \
    && go env -w GOPROXY=https://goproxy.cn,direct \
    && go env -w CGO_ENABLED=0 \
    && go env \
    && go mod tidy \
    && go build -o workflows-demo .

FROM alpine:latest

LABEL MAINTAINER="dalefengs@gmail.com"

WORKDIR /go/src/chat-api-reverse

COPY --from=0 /go/src/workflows-demo ./

ENTRYPOINT ./workflows-demo
