# Task 1

Creat a cloud run with waf and glb

## How to deploy

The deployment is split into 2 directories, `1_init` and `2_deployment` - These are designed to be applied in chronological order.

In each directory **you** will need to create a `terraform.tfvars` file.

If you have the command line tool `terraform-docs` (Highly recommend) you can run `terraform-docs tfvars hcl .` to generate the file


### Init

The `1_init` directory contains what I class as _initialization_ phase of the deployment. This is stuff the deployment depends
on. Specifically here this is API's

Run the below commands:

```shell
terragrunt init
terragrunt apply
```

### Deployment

The `2_deployment` directory contains the terraform to setup the following

* Service Account
* Cloud run (gen 2) Service
* IP Address
* Load balancer
* DNS (Using Google cloud DNS, but commented out)

## Design Considerations

### Specific service account for the CloudRun service

Follows googles best practices on using specific service accounts that aren't over provisioned with permissions

Also means that if this API service needs to call _onwards_ to other services in GCP, we can then use that service account
