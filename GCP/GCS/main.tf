resource "google_storage_bucket" "GCS1" {
  
  name = "tf-course-bucket-from-terraform-1598"
  location = "US-CENTRAL1"
  storage_class = "NEARLINE"
  labels = {
    "env" = "tf-env"
    "dept" = "production"
  } 

  uniform_bucket_level_access = true 

  lifecycle_rule {
    condition {
      age = 5
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }

  retention_policy {
    is_locked = true
    retention_period = 432000
  }
}

resource "google_storage_bucket_object" "pic" {

    bucket = google_storage_bucket.GCS1.name
    name = "architecture_django"
    source = "architecture.png"
}