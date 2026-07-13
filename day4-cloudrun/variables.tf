variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "image_tag" {
  type        = string
  description = "Container image tag to deploy"
  default     = "latest"
}