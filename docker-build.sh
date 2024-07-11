#!/bin/sh

DOCKER_PASSWORD=$1
DOCKER_USERNAME=$2
DOCKER_ACCOUNT=$3

echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin


# Construir y empujar las imágenes Docker con las etiquetas correctas
docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-apache:otel2" apache
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-apache:otel2"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-catalog:otel2" microservice-kubernetes-demo-catalog
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-catalog:otel2"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-customer:otel2" microservice-kubernetes-demo-customer
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-customer:otel2"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-order:otel2" microservice-kubernetes-demo-order
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-order:otel2"
