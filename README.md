# Stripe Connector

Stripe connector provides instant queries and mutations to request Stripe API resources.

This connector is built using the [NDC Rest](https://github.com/hasura/ndc-rest) with [Stripe's OpenAPI Specification](https://github.com/stripe/openapi).

## Environment Variables

| Name                     | Description                                   | Default Value          |
| ------------------------ | --------------------------------------------- | ---------------------- |
| STRIPE_SERVER_URL        | The base server URL of Stripe API             | https://api.stripe.com |
| STRIPE_BASIC_AUTH_TOKEN  | Basic authentication token                    |                        |
| STRIPE_BEARER_AUTH_TOKEN | Bearer authentication token                   |                        |
| STRIPE_TIMEOUT           | Default request timeout in seconds            | 30                     |
| STRIPE_RETRY_TIMES       | Number of retry times                         | 0                      |
| STRIPE_RETRY_DELAY       | Delay time between each retry in milliseconds | 1000                   |
| STRIPE_RETRY_HTTP_STATUS | Retry on HTTP status                          | 429, 500, 502, 503     |

## Development

### Local Development

Copy `.env.example` to `.env` and start Docker Compose:

```sh
docker-compose up -d --build
```

The connector serves the HTTP service at `http://localhost:8080` and connect to the internal `stripe-mock` service.

### Update dependencies

```sh
NDC_REST_VERSION=<version> make update-deps
```

### Update schema

Update `VERSION` in [Makefile](./Makefile) and run:

```sh
make build-schema
```
