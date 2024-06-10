terraform {
  required_providers {
    google = {
      source  = "hashicorp"
      version = "use latest version"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "terraform-gcp"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "keys.json"
}
