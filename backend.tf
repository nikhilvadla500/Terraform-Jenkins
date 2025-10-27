terraform {
  backend "gcs" {
    bucket = "bucket-nikhil-0123" # GCS bucket name
    prefix = "terraform/state" # Path within the bucket (e.g., a folder structure)
  }
}
