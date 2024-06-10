resource "google_sql_database_instance" "sqltf" {
  name = "stltf1"
  database_version = "MYSQL_5_7"
  region = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "user1" {
  name = "usertf"
  instance = google_sql_database_instance.sqltf.name
  password = "oscar@1598"
}