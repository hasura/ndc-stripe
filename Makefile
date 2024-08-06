NDC_REST_VERSION ?= v0.2.2
UID ?= $(shell id -u)
GID ?= $(shell id -g)

.PHONY: build-schema
build-schema:
	go install github.com/hasura/ndc-rest-schema@latest
	ndc-rest-schema convert \
		-c schema/config.yaml \
		-o config/schema.json

.PHONY: update-deps
update-deps:
	VERSION=$(NDC_REST_VERSION) scripts/update-deps.sh