# Stripe Connector

Stripe connector provides instant queries and mutations to request Stripe API resources.

This connector is built using the [HTTP Connector](https://github.com/hasura/ndc-http) with [Stripe's OpenAPI Specification](https://github.com/stripe/openapi).

## Environment Variables

| Name                       | Description                                                                    | Default Value          |
| -------------------------- | ------------------------------------------------------------------------------ | ---------------------- |
| STRIPE_SERVER_URL          | The base server URL of Stripe API                                              | https://api.stripe.com |
| STRIPE_BEARER_AUTH_TOKEN   | Bearer authentication token                                                    |                        |
| STRIPE_BASIC_AUTH_USERNAME | Basic authentication username. Required if `STRIPE_BASIC_AUTH_PASSWORD` is set |                        |
| STRIPE_BASIC_AUTH_PASSWORD | Basic authentication password. Required if `STRIPE_BASIC_AUTH_USERNAME` is set |                        |
| STRIPE_TIMEOUT             | Default request timeout in seconds                                             | 30                     |
| STRIPE_RETRY_TIMES         | Number of retry times                                                          | 0                      |
| STRIPE_RETRY_DELAY         | Delay time between each retry in milliseconds                                  | 1000                   |

## Development

### Local Development

Copy `.env.example` to `.env` and start Docker Compose:

```sh
docker-compose up -d --build
```

The connector serves the HTTP service at `http://localhost:8080` and connect to the internal `stripe-mock` service.

### Update dependencies

```sh
NDC_HTTP_VERSION=<version> make update-deps
```

### Update schema

Update `VERSION` in [Makefile](./Makefile) and run:

```sh
make build-schema
```
