resource "google_service_account" "invoker" {
  account_id   = "invoker" # I was not in a creative mood
  display_name = "CloudRun invoker"
  description  = "Service Account used to Invoke cloudrun somewhere else in the estate"
  project      = var.project
}
