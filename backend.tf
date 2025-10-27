terraform {
  backend "gcs" {
    bucket = "bucket = "terraform-state-bucket-nikhil"
    prefix = "terraform/state"
  }
}
