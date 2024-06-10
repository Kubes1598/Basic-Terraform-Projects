resource "google_redis_instance" "redis-tf" {
  name = "redis-tf1"
  memory_size_gb = 1
  tier = "BASIC"
  location_id = "us-central1-a"
  authorized_network = "default"
  redis_version = "REDIS_7_0"
  display_name = "Redis Instance from Terraform"
}