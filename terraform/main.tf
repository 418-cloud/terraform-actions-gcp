terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.82.0"
    }
  }

  backend "gcs" {
    bucket = "gh-tf-state"
    prefix = "terraform/state"
  }
}

provider "google" {
  region = "europe-north1"
  zone   = "europe-north1-a"
}
