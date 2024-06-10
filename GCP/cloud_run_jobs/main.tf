resource "google_cloud_run_v2_job" "Run-job-tf" {
  name = "job-from-tf"
  location = "us-central1"
  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job:latest"
      }
    }
  } 
}