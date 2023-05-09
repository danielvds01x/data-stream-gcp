#!/bin/bash

DOCKER_IMAGE='iac'

# Destroy the Terraform resources and auto-approve
docker run -i \
-v $HOME/.config/gcloud:/root/.config/gcloud \
-t $DOCKER_IMAGE destroy -auto-approve

# Remove any running Docker containers with the "pub-app-emulator" image
docker ps --filter "ancestor=iac" -q | xargs -r docker stop
docker ps --filter "ancestor=iac" -q | xargs -r docker rm

# Remove any running Docker containers with the "pub-app-emulator" image
docker ps --filter "ancestor=pub-app-emulator" -q | xargs -r docker stop
docker ps --filter "ancestor=pub-app-emulator" -q | xargs -r docker rm

# Remove any Docker images with the "pub-app-emulator" tag
docker images --filter "reference=pub-app-emulator" -q | xargs -r docker rmi

# Change the current directory to the Terraform directory
# cd iac

# Destroy the Terraform resources and auto-approve
# terraform destroy -auto-approve

# Change the current directory back to the root directory
# cd ..

# The script terminates after the Docker containers and images are removed,
# and the Terraform resources are destroyed successfully
