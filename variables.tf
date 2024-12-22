variable "project_id" {
  type        = string
  description = "The project ID where resources will be deployed."
}

############## Cloud Build Tigger Variables##################

variable "repo_name" {
  type        = string
  description = "Name of the repository in Cloud Build."
}

variable "connection_name" {
  type        = string
  description = "github connection name"
}

variable "trigger_location" {
  type        = string
  default     = ""
  description = "Location of the Cloud Build trigger."
}

variable "repo_uri" {
  type        = string
  description = "The URI of the GitHub repository."
}

variable "service_account" {
  type        = string
  description = "Service account used for Cloud Build triggers."
}

variable "trigger_filename" {
  type        = string
  description = "The filename of the Cloud Build config file."
}

variable "ignored_files" {
  type        = list(string)
  default     = []
  description = "Files to ignore in the Cloud Build trigger."
}

variable "included_files" {
  type        = list(string)
  default     = []
  description = "Files to include in the Cloud Build trigger."
}

variable "substitutions" {
  type    = map(any)
  default = {}
}

variable "trigger_name" {
  type        = string
  description = "Name of the Cloud Build trigger."
}

variable "disable_trigger" {
  type        = bool
  default     = false
  description = "Whether to disable the Cloud Build trigger."
}

variable "approval_required" {
  type        = bool
  default     = false
  description = "Whether approval is required for the Cloud Build trigger."
}

variable "pull_request" {
  type        = bool
  default     = false
  description = "Enable trigger on pull request event."
}

variable "push_event" {
  type        = bool
  description = "Enable trigger on push event."
  default     = true
}

variable "push_tag_event" {
  type        = bool
  default     = false
  description = "Enable trigger on tag push event."
}

variable "comment_control" {
  type        = string
  description = "Comment control setting for the Cloud Build trigger, specifying who can trigger builds with comments."
  default     = "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY"
  validation {
    condition     = contains(["COMMENTS_ENABLED", "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY", "COMMENTS_DISABLED"], var.comment_control)
    error_message = "Valid values for comment_control are COMMENTS_ENABLED, COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY, and COMMENTS_DISABLED."
  }
}

variable "branch_regex_pattern" {
  type        = string
  default     = "^main$"
  description = "Regex pattern for branch to trigger builds on."
}