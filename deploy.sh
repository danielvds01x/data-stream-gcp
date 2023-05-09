#!/bin/bash

# Change the current directory to the Terraform directory
cd iac

docker build -t iac .

docker run -i -t iac plan

docker run -i \
-v $HOME/.config/gcloud:/root/.config/gcloud \
-t iac apply -auto-approve

## Validate the Terraform configuration
#terraform fmt -check=true
#terraform validate
#
## Plan the Terraform changes
#terraform plan
#
## Ask for confirmation before applying the Terraform changes
#read -p "Do you want to apply the Terraform changes? [y/n] " answer
#if [[ $answer =~ [yY] ]]; then
#  # Apply the Terraform changes and auto-approve
#  terraform apply -auto-approve
#else
#  # If Terraform apply is cancelled, exit the script with error code 1
#  echo "Terraform apply cancelled."
#  exit 1
#fi
#
## Change the current directory back to the root directory
cd ..

# Docker block starts here

# Build the Docker image and tag it as "pub-app-emulator"
docker build -t pub-app-emulator pub-app-emulator

# Run the Docker container with the "pub-app-emulator" image
# Mount the gcloud config credentials directory into the container
docker run -v $HOME/.config/gcloud:/root/.config/gcloud pub-app-emulator

# Docker block ends here

# The script terminates after the Docker container exits successfully
