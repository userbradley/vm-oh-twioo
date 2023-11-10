terraform {
  required_version = "1.6.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.5.0"
    }
  }
}


provider "google" {
  project = var.project
  region  = "europe-west2"
}
