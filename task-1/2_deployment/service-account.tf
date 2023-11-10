resource "google_service_account" "podinfo" {
  account_id   = "cloudrun-podinfo"
  description  = "Service account used by the PodInfo cloudrun deployment"
  display_name = "CloudRun PodInfo"
}
