# Create repo connection to host
resource "google_cloudbuildv2_repository" "github_repo" {
  project           = var.project_id
  location          = var.trigger_location
  name              = var.repo_name
  parent_connection = var.connection_name
  remote_uri        = var.repo_uri
}

# google_cloudbuild_trigger.push
resource "google_cloudbuild_trigger" "push_tag_event" {
  provider        = google-beta
  count           = var.push_tag_event ? 1 : 0
  disabled        = false
  filename        = var.trigger_filename
  ignored_files   = []
  included_files  = []
  location        = var.trigger_location
  name            = var.trigger_name
  project         = var.project_id
  service_account = "projects/${var.project_id}/serviceAccounts/${var.service_account}"
  substitutions   = var.substitutions

  approval_config {
    approval_required = var.approval_required
  }

  repository_event_config {
    repository = google_cloudbuildv2_repository.github_repo.id

    push {
      invert_regex = false
      tag          = ".*"
    }
  }
}

# google_cloudbuild_trigger.push
resource "google_cloudbuild_trigger" "push_event" {
  provider        = google-beta
  count           = var.push_event ? 1 : 0
  disabled        = false
  filename        = var.trigger_filename
  ignored_files   = []
  included_files  = []
  location        = var.trigger_location
  name            = var.trigger_name
  project         = var.project_id
  service_account = "projects/${var.project_id}/serviceAccounts/${var.service_account}"
  substitutions   = var.substitutions

  approval_config {
    approval_required = var.approval_required
  }

  repository_event_config {
    repository = google_cloudbuildv2_repository.github_repo.id

    push {
      branch       = "^main$"
      invert_regex = false
    }
  }
}

# google_cloudbuild_trigger.pull_request
resource "google_cloudbuild_trigger" "pull_request" {
  provider        = google-beta
  count           = var.pull_request ? 1 : 0
  disabled        = false
  filename        = var.trigger_filename
  ignored_files   = []
  included_files  = []
  location        = var.trigger_location
  name            = var.trigger_name
  project         = var.project_id
  service_account = "projects/${var.project_id}/serviceAccounts/${var.service_account}"
  substitutions   = var.substitutions

  approval_config {
    approval_required = var.approval_required
  }

  repository_event_config {
    repository = google_cloudbuildv2_repository.github_repo.id

    pull_request {
      branch          = ".*"
      comment_control = var.comment_control
      invert_regex    = false
    }
  }
}