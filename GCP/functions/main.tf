resource "google_storage_bucket" "bucket-terra1598" {
  name = "bucket-tf1598"
  location = "us-central1"
}

resource "google_storage_bucket_object" "index-tf" {
  name = "index.zip"
  bucket = google_storage_bucket.bucket-terra1598.name
  source = "index.zip"
}

resource "google_cloudfunctions_function" "fun-terra1598" {
  name = "fun-terra1158"
  runtime = "nodejs20"
  description = "This is my first function from Terraform"

  available_memory_mb = 256
  source_archive_bucket = google_storage_bucket.bucket-terra1598.name
  source_archive_object = google_storage_bucket_object.index-tf.name
  trigger_http = true
  max_instances = 10
  min_instances = 0
  timeout = 360
  entry_point = "helloHttptf"
}

data "google_iam_policy" "admin-tf" {
  binding {
    role = "roles/cloudfunctions.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloudfunctions_function_iam_policy" "policy" {
  cloud_function = google_cloudfunctions_function.fun-terra1598.name
  policy_data = data.google_iam_policy.admin-tf.policy_data
}