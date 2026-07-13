resource "google_cloud_run_v2_service" "practice_service" {
  name     = "practice-service-tf"
  location = var.region

  template {
    service_account = data.terraform_remote_state.iam.outputs.cloud_run_runtime_email
    containers {
      image = "us-central1-docker.pkg.dev/${var.project_id}/practice-repo/app:${var.image_tag}"
      ports {
        container_port = 8080
      }
    }
    scaling {
      min_instance_count = 0
      max_instance_count = 3
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service_iam_member" "public_access" {
  location = google_cloud_run_v2_service.practice_service.location
  name     = google_cloud_run_v2_service.practice_service.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}