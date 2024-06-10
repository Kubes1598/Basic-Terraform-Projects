resource "google_bigquery_dataset" "ds-tf" {
    dataset_id = "dataset_frm_tf"   
}

resource "google_bigquery_table" "table-frm-tf" {
  table_id = "tbl_tf"
  dataset_id = google_bigquery_dataset.ds-tf.dataset_id
}
