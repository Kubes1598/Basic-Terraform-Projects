resource "google_compute_instance" "terra-engine" {
  name = "terra-engine"
  machine_type = "n1-standard-1"
  zone = "us-central1-a"

  allow_stopping_for_update = true

  labels = {
    "env" = "tflearning"
  }

network_interface {
  network = "custom-vpc-terra"
  subnetwork = "sub-us"
}

boot_disk {
  initialize_params {
    image = "debian-10-buster-v20240417"
    size = 20
  }
   auto_delete = false
}

 scheduling {
    preemptible = true
    automatic_restart = false
  }

  service_account {
    email = "yourserviceaccount@google"
    scopes = [ "cloud-platform" ]
  }

  lifecycle {
    ignore_changes = [ "attached_disk" ]
  }

}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 15
  zone = "us-central1-a"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "vm-disk-2" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.terra-engine.id
}