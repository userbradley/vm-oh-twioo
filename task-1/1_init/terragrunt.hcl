terraform {
  source = "git@github.com:userbradley/terraform-module-google-api.git?ref=v1.0.0"
}

inputs = {
  api = [
    "compute.googleapis.com", # Needed for the Load balancing
    "run.googleapis.com",     # Cloud run API
    "iam.googleapis.com"      # IAM API. I don't actually think we have to enable this one, but I've always done it and had no issues
  ]
}

### Some notes ###

# As this is just a coding interview, and not a production deployment, we wont bother storing the state in GCS.

# If you want to see how to do this, refer to the documentation I wrote

# https://documentation.breadnet.co.uk/automation/iac/terragrunt/generate-backend-file-for-gcs-with-terragrunt/
