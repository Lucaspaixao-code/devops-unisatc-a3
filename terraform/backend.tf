terraform {
  backend "gcs" {
    bucket = "top-opus-479304-m3-terraform-state"
    prefix = "terraform/state"
  }
}