CONTAINER_NAME := quay.io/ultraio/gitlab-ci-validate
CONTAINER_TAG  := 1.4.0

all: check build publish

.PHONY: check
check:
	gofmt -d .
	go vet .

.PHONY: build
build:
	docker build . -t ${CONTAINER_NAME}:${CONTAINER_TAG}

.PHONY: publish
publish:
	docker push ${CONTAINER_NAME}:${CONTAINER_TAG}
