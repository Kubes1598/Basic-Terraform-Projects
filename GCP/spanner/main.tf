resource "google_spanner_instance" "ist-from-tf" {
  display_name = "instance-tf"
  config = "regional-asia-south1"
  name = "cloud-spanner-tf"
  num_nodes = 1
  labels = {
    "env" = "learningtf"
  }
}

resource "google_spanner_database" "dbs5" {
  instance = google_spanner_instance.ist-from-tf.name
  name = "dbs1"
  deletion_protection = false
}