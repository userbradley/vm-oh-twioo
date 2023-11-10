resource "google_cloud_run_service_iam_member" "member" {
  location = "europe-west2"
  project  = var.project
  service  = "podinfo" # normally this would use terraform resource objects `resource.name.name` etc, but as it's in a separate dir and we're not using remote state, this is the way we do it
  role     = "roles/run.invoker"
  member   = google_service_account.invoker.member
}
