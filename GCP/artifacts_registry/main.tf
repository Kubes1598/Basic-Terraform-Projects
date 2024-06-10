resource "google_artifact_registry_repository" "tf-artifact" {
  location = "us-central1"
  repository_id = "repository-tf"
  format = "DOCKER"
  description = "Docker Tf Repository"
}