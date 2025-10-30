terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket-nikhil"
    prefix = "terraform/state"
  }
}

