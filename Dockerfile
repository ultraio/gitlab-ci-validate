FROM golang:1.13.0 as build
WORKDIR /go/src/app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags '-w' .

FROM debian:buster-slim
WORKDIR /
CMD ["./gitlab-ci-validate"]
