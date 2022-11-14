resource "google_service_account" "project-service-account" {
  account_id = "project-service-account"
  project = "abde-367812"
}

resource "google_project_iam_binding" "project-service-account-iam" {
  project = "abde-367812"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.project-service-account.email}"
  ]
}