# Task 2

## What's the issue at hand

We need to create a service account that can be used in other places in the estate.

From this service account we have a few ways this can be used

* Service account keys
* Workload Identity
* Workload Identity Federation (Different from Workload Identity)

## How to use the service account _onwards_

### Service account keys

⚠️Personally, I dont recommend⚠️

We _can_ create service account keys in terraform, but then this means the terraform state has the keys in them. Not good

Despite GCS being encrypted at rest, and terraform [telling us to give them money](https://developer.hashicorp.com/terraform/language/state/sensitive-data) to have encrypted state,
it still allows users to download the object if IAM is wonky, and then _impersonate_ that service account.

If you _really_ have to export the keys, set up a means to rotate them, as well as a means to restrict the IP address they can be used from
which I _think_ you can do with [Service Perimeter](https://cloud.google.com/vpc-service-controls/docs/service-perimeters)

### Workload Identity

This is the mechanism in GKE (My fav product) which allows workloads to authenticate to GCP

To configure this, follow the documentation I wrote [Configure Workload Identity](https://documentation.breadnet.co.uk/kubernetes/gke/configure-gke-workload-identity/)

### Workload Identity Federation

Despite sounding the same as `Workload Identity`, it's actually different.

This allows other systems that use OIDC (Open ID Connect) to _exchange_ tokens with your local provider with GCP rokens.

So in theory, if you had a weekend to kill, you could configure your local kubernetes cluster to use [dex](https://dexidp.io) and
authenticate to GCP (This is something I am trying to work out)

A great example of this is we can authenticate from GitHub actions to GCP ([I wrote some documentation about that too](https://documentation.breadnet.co.uk/kb/githubactions/authenticate-github-actions-to-gcp-using-workload-identity-federation/#how))
