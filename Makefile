STRIPE_VERSION ?= v956
NDC_REST_VERSION ?= v0.1.1
UID ?= $(shell id -u)
GID ?= $(shell id -g)

.PHONY: build-schema
build-schema:
	docker run -v ./config:/home/config -u $(UID):$(GID) --rm ghcr.io/hasura/ndc-rest:$(NDC_REST_VERSION) convert \
		-f https://raw.githubusercontent.com/stripe/openapi/$(STRIPE_VERSION)/openapi/spec3.json \
		--trim-prefix /v1 --spec openapi3 \
		--env-prefix STRIPE \
		-o /home/config/schema.json 
