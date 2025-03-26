NDC_HTTP_VERSION ?= v0.9.1
UID ?= $(shell id -u)
GID ?= $(shell id -g)

# go install github.com/hasura/ndc-http/ndc-http-schema@latest
.PHONY: build-schema
build-schema:
	ndc-http-schema convert \
		-c generator/config.yaml \
		-o config/schema.json
	ndc-http-schema update --dir ./config

.PHONY: update-deps
update-deps:
	VERSION=$(NDC_HTTP_VERSION) scripts/update-deps.sh