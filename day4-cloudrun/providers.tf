terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project                     = var.project_id
  region                      = var.region
  impersonate_service_account = "terraform-runner@${var.project_id}.iam.gserviceaccount.com"
}