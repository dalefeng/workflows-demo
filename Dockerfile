FROM golang AS builder

WORKDIR /build

COPY . .

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct \
    CGO_ENABLED=1 \
    GOOS=linux

RUN go build -ldflags "-s -w -X 'dalefengs/wf.Version=$(cat VERSION)' -extldflags '-static'" -o wf

FROM alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache ca-certificates tzdata \
    && update-ca-certificates 2>/dev/null || true

COPY --from=builder /build/wf /
ENTRYPOINT ["/wf"]
