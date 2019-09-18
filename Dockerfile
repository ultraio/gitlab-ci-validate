FROM golang:1.13.0 as build
WORKDIR /go/src/app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags '-w' .

FROM debian:buster-slim
WORKDIR /
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /go/src/app/gitlab-ci-validate /usr/local/bin/gitlab-ci-validate
CMD ["./gitlab-ci-validate"]
