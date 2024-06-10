resource "google_compute_network" "auto-vpc-terra" {
  name = "auto-vpc-terra"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom-vpc-terra" {
  name = "custom-vpc-terra"
  auto_create_subnetworks = false 
}

resource "google_compute_subnetwork" "sub-us" {
  name = "sub-us"
  region = "us-central1"
  ip_cidr_range = "10.1.0.0/24"
  network = google_compute_network.custom-vpc-terra.id 
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.custom-vpc-terra.id
  allow {
    protocol = "icmp"
  }
  source_ranges = [ "102.88.81.182/32" ]
}

resource "google_compute_firewall" "allow-ssh" {
  name = "allow-ssh"
  network = google_compute_network.custom-vpc-terra.id
  allow {
    protocol = "all"
  }
  source_ranges = [ "0.0.0.0/0" ]
}


output "auto" {
  value = google_compute_network.auto-vpc-terra.id
}

output "custom" {
  value = google_compute_network.custom-vpc-terra.id
}