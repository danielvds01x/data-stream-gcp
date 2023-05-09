#!/bin/bash

DOCKER_IMAGE='iac'

# Destroy the Terraform resources and auto-approve
# docker run -i \
# -v $HOME/.config/gcloud:/root/.config/gcloud \
# -t $DOCKER_IMAGE destroy -auto-approve

# docker run -i \
# -v $HOME/.config/gcloud:/root/.config/gcloud \
# -t $DOCKER_IMAGE plan

# # docker exec -it $(docker ps -q --filter "ancestor=iac") terraform plan
# docker exec -it $(docker ps -q --filter "ancestor=iac") terraform apply -auto-approve
# docker exec -it $(docker ps -q --filter "ancestor=iac") terraform detsroy -auto-approve


# Remove any running Docker containers with the "pub-app-emulator" image
docker ps --filter "ancestor=iac" -q | xargs -r docker stop -f

# Delete all stopped containers
docker container prune -f

# Remove any Docker images with the "pub-app-emulator" tag
docker images --filter "reference=iac" -q | xargs -r docker rmi

# Remove any running Docker containers with the "pub-app-emulator" image
docker ps --filter "ancestor=pub-app-emulator" -q | xargs -r docker stop

# Delete all stopped containers
docker container prune -f

# Remove any Docker images with the "pub-app-emulator" tag
docker images --filter "reference=pub-app-emulator" -q | xargs -r docker rmi