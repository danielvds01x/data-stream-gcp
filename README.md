# Data-stream-gcp 

This is a study project that I am working on to understand how data deduplication works in Dataflow [Apache Beam]. I am currently working on this project.

## Requirements

-   Docker
-   Terraform

## Installation

1.  Clone the repository.
2.  Build the Docker image using the command `docker build -t pub-app-emulator pub-app-emulator`.
3.  Run the Docker container with the command `docker run -v $HOME/.config/gcloud:/root/.config/gcloud pub-app-emulator`.
4.  (Optional) Deploy the infrastructure using the script `deploy.sh`.

## Usage

1.  Start the Docker container using the command `docker run -v $HOME/.config/gcloud:/root/.config/gcloud pub-app-emulator`.
2.  The emulator will generate test messages indefinitely and publish them to the Pub/Sub topic.

## Terraform Configuration

The Terraform configuration file `iac/pubsub.tf` creates a Pub/Sub topic and subscription in Google Cloud Platform.

The Dockerfile `iac/Dockerfile` uses Terraform to initialize the project and expose port 8081.

## Emulator Configuration

The Golang file `pub-app-emulator/app.go` contains the main function for the emulator. It generates random test messages with a message ID, user ID, date, and amount. It publishes each message to the Pub/Sub topic using the `google_pubsub` library.

The Dockerfile `pub-app-emulator/Dockerfile` configures the emulator image and specifies environment variables for the project name and Pub/Sub topic.

## Deployment

The script `deploy.sh` automates the deployment process for the emulator and Terraform configuration. It builds the Docker image, runs Terraform to create the Pub/Sub infrastructure, and runs the emulator in a Docker container.

## Cleanup

The script `cleanup.sh` removes all Docker containers and images associated with the emulator.

## License

This project is licensed under the Apache License 2.0. See the LICENSE file for details.

## Contact

If you have any questions or comments about this project, please contact the project owner.