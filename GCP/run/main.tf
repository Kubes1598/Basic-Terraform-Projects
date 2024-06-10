resource "google_cloud_run_service" "run-app-tf" {
    name = "run-app-tf"
    location = "us-central1"  

    template {
      spec {
        containers {
            ports {
              container_port = 8080
            }
            name = "run-app-terra"
          image = "us-docker.pkg.dev/cloudrun/container/hello:sample-public-image-9480360f1610a1455954492899cf9e06b7221b5d7fffb849f6b2e8266b20528a"
        }
      }
    }
}

resource "google_cloud_run_service_iam_policy" "pub-acess" {
  service = google_cloud_run_service.run-app-tf.name
  location = google_cloud_run_service.run-app-tf.location
  policy_data = data.google_iam_policy.rune-tf.policy_data
}

data "google_iam_policy" "rune-tf" {
  binding {
    role = "roles/run.invoker"
    members = [ "allUsers" ]
  }
}

 