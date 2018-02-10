#!/bin/bash
ARTIFACTORY_VERSION=$1

export DEBIAN_FRONTEND=noninteractive

# Stop Artifactory
service nginx stop
service artifactory stop

# Upgrade Artifactory
apt-get update
apt-get -y install jfrog-artifactory-pro=${ARTIFACTORY_VERSION} >> /tmp/upgrade-artifactory-${ARTIFACTORY_VERSION}.log 2>&1

# Start Artifactory
sleep $((RANDOM % 120))
service artifactory start
service nginx start
nginx -s reload
