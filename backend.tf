terraform {
  backend "gcs" {
    bucket = "terraform-backend-nikhil"
    prefix = "terraform/state"
  }
}
