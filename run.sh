#!/bin/sh
set -eu

docker build -t cc-reverse-proxy .
docker run  --rm -t cc-reverse-proxy