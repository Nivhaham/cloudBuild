terraform {
  backend "gcs" {
    bucket = "niv-devops-practice-tfstate"
    prefix = "day4/cloudrun"
  }
}