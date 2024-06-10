resource "google_pubsub_topic" "pub-tf" {
  name = "pub-tf"
}

resource "google_pubsub_subscription" "sub-tf" {
  name = "sub2"
  topic = google_pubsub_topic.pub-tf.name
}

resource "google_cloud_scheduler_job" "jobtf" {
  name = "jobtf"
  schedule = "* * * * *"

  pubsub_target {
    topic_name = google_pubsub_topic.pub-tf.id
    data = base64encode("This is Job from Terraform")
  }
}