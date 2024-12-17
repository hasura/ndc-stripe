#!/bin/bash

if [ -z "$VERSION" ]; then
  echo "VERSION env variable is required"
  exit 1
fi

sed -i -r "s/v[0-9.]+$/$VERSION/" Dockerfile
sed -i -r "s/NDC_HTTP_VERSION\s+\?\=\s+[a-z0-9.]+$/NDC_HTTP_VERSION ?= $VERSION/" Makefile