terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "use latest version"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "terraform-gcp-1598"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "keys.json"
}
