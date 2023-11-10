resource "google_compute_region_network_endpoint_group" "cloudrun_neg" {
  name                  = "cloudrun-neg"
  network_endpoint_type = "SERVERLESS"
  region                = "europe-west2"
  cloud_run {
    service = google_cloud_run_v2_service.podinfo.name
  }
}

module "lb-http" {
  source  = "GoogleCloudPlatform/lb-http/google//modules/serverless_negs"
  version = "~> 9.0"

  project = var.project
  name    = "podinfo"

  ssl                             = true
  managed_ssl_certificate_domains = ["podinfo.breadinfra.net"]
  https_redirect                  = true
  backends = {
    default = {
      description             = null
      protocol                = "HTTP"
      enable_cdn              = false
      custom_request_headers  = null
      custom_response_headers = null
      security_policy         = google_compute_security_policy.waf.name
      compression_mode        = null

      log_config = {
        enable      = true
        sample_rate = 1.0
      }

      groups = [
        {
          group = google_compute_region_network_endpoint_group.cloudrun_neg.id
        }
      ]

      iap_config = {
        enable               = false
        oauth2_client_id     = null
        oauth2_client_secret = null
      }
    }
  }
}
