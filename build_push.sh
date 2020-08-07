#!/bin/sh
set -e

PROJECT=containers-tests
REPO_BASE=b4science
SERVICE=$1

if [ "$SERVICE" = "test" ]; then
    # TAG="v0.0.1"
    TAG="v0.0.3"
else
    echo "Unknown service: $SERVICE"
    exit 1
fi

docker-compose build --pull ${SERVICE}
REPO_IMAGE="${SERVICE}:${TAG}"
docker tag ${PROJECT}_${SERVICE} $REPO_BASE/$REPO_IMAGE
echo "Pushing: $REPO_BASE/$REPO_IMAGE"
docker push $REPO_BASE/$REPO_IMAGE
