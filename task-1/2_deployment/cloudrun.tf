
resource "google_cloud_run_v2_service" "podinfo" {
  name     = "podinfo"
  location = "europe-west2"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    service_account       = google_service_account.podinfo.email
    execution_environment = "EXECUTION_ENVIRONMENT_GEN2" # Use the new fancy version
    containers {

      ports {
        container_port = 9898 #
      }
      image = "stefanprodan/podinfo:latest" # Dockerhub image
    }
  }
}
