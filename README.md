# Release 1.0.0

This module uses the conneciton from the established GITHUB connection to create cloud build trigger

# Release 1.0.1
Rectified the module

# Usage of this module
```
module "cloud-build-trigger" {
    source  = "Pruthvi2340/cloud-build-trigger/google"
    version = "1.0.1"
    project_id             = "burner-prus"
    name                   = "retail-demo-app"
    location               = "us-central1"
    repo_name              = "retail-demo-app"
    repo_uri               = "https://github.com/pruthvi2340org/retail-demo-app.git"
    service_account        = "demo-366@burner-prus.iam.gserviceaccount.com"
    trigger_filename       = "cloud-build/adservice.yaml"
    trigger_name           = "ci-trigger"
    trigger_location       = "us-central1"
    pull_request           = false
    push_event             = true
    push_tag_event         = false
}
```