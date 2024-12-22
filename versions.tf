terraform {
  required_version = ">=1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.14.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.14.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~>0.101.0"
    }
  }
}

// Credentials can be set explicitly or via the environment variables HCP_CLIENT_ID and HCP_CLIENT_SECRET
provider "hcp" {
}

provider "google" {
  project = var.project_id
}