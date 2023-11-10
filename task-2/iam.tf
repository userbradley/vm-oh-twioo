resource "google_cloud_run_service_iam_member" "member" {
  location = "europe-west2"
  project  = var.project
  service  = "podinfo"
  role     = "roles/run.invoker"
  member   = "user:bstannard@petsathome.co.uk"
}
