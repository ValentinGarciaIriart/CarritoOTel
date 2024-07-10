#!/bin/sh

DOCKER_ACCOUNT=valentingarciairiart
DOCKER_USERNAME=valentingarciairiart
DOCKER_PASSWORD=Vale0811!

echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

docker build --tag=microservice-kubernetes-demo-apache apache
docker tag microservice-kubernetes-demo-apache $DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:otel
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:otel

docker build --tag=microservice-kubernetes-demo-catalog microservice-kubernetes-demo-catalog
docker tag microservice-kubernetes-demo-catalog $DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:otel
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:otel

docker build --tag=microservice-kubernetes-demo-customer microservice-kubernetes-demo-customer
docker tag microservice-kubernetes-demo-customer $DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:otel
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:otel

docker build --tag=microservice-kubernetes-demo-order microservice-kubernetes-demo-order
docker tag microservice-kubernetes-demo-order $DOCKER_ACCOUNT/microservice-kubernetes-demo-order:otel
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-order:otel