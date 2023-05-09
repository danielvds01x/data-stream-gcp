provider "google" {
  project = "my-project-1544131915126"
  region  = "us-central1"
}

resource "google_pubsub_topic" "my-topic" {
  name = "qt-emulated-topic"
}

resource "google_pubsub_subscription" "my-subscription" {
  name                 = "dataflow-sub"
  topic                = google_pubsub_topic.my-topic.id
  ack_deadline_seconds = 10
}
