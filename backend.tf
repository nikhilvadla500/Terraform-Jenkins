terraform {
  backend "gcs" {
    bucket = "your-tf-bucket-name"
    prefix = "terraform/state"
  }
}
