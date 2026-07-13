data "terraform_remote_state" "iam" {
  backend = "gcs"
  config = {
    bucket = "niv-devops-practice-tfstate"
    prefix = "day2/iam"
  }
}