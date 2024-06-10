resource "google_pubsub_topic" "topicfrmtf" {
  name = "topictf"
  labels = {
    "env" = "dev"
  }
}

resource "google_pubsub_subscription" "tf-sub" {
  name = "sub-tf"
  topic = google_pubsub_topic.topicfrmtf.id
}

