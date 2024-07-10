#!/bin/sh

DOCKER_PASSWORD=$1
DOCKER_USERNAME=$2
DOCKER_ACCOUNT=$3

echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin


# Construir y empujar las imágenes Docker con las etiquetas correctas
docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-apache:otel" apache
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-apache:otel"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-catalog:otel" microservice-kubernetes-demo-catalog
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-catalog:otel"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-customer:otel" microservice-kubernetes-demo-customer
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-customer:otel"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-order:otel" microservice-kubernetes-demo-order
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-order:otel"
