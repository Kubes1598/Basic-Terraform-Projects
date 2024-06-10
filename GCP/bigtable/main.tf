resource "google_bigtable_instance" "biggy-tf" {
  name = "biggy-tf"
  cluster {
    cluster_id = "tf-instance1"
    num_nodes = 1
    storage_type = "HDD"
  }
  labels = {
    "env" = "production-tf"
  }
  deletion_protection = false
  
}

resource "google_bigtable_table" "table-tf" {
  name = "table-tf"
  instance_name = google_bigtable_instance.biggy-tf.name
}