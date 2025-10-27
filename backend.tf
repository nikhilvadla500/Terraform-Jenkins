terraform {
  backend "gcs" {
    bucket = "nikhil-terraform" # GCS bucket name
    prefix = "terraform/state" # Path within the bucket (e.g., a folder structure)
  }
}
