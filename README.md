# Virgin media O2 DevOps coding interview test

## What's the problem at hand

Showcase Terraform and Google cloud knowledge, in _ideally_ an end-to-end solution.

You can read the rules of the game in [the supporting document](test.md)

## Tools you need installed

How you install them is up to you

* [Terragrunt](https://github.com/warrensbox/tgswitch)
* [Terraform](https://tfswitch.warrensbox.com/Install/)
* [Gcloud CLI](https://cloud.google.com/sdk/docs/install) - Needed for authenticating to GCP


## Rule bending

### Rule bend number 1

> clone the repo and run a single command to get the results

There is no hard guidelines on what `a single command` is, so I am going to wrap things up using `Task files` which if you've never used, you should.

Task files are _basically_ `Make` files, but in YAML and 100% more readable.

### Rule bend number 2

> Start a new Terraform working directory

I'm going to be really annoying here sadly, and do the opposite of DRY; WET (**W**rite **E**very**T**hing)

Each _task_ will have it's own directory which you can treat as a repo, everything is self contained.

### Rule bend number 3

> Please have README.md in your repo with instructions on how to execute your code

I personally prefer to have a single README per directory detailing what needs to be done, especially considering that I'm
treating each dir as its own _repo_... Maybe I should coin the term _mono-repo_ for this layout?

## Tasks

### Task 1

This task is to create a cloudrun service, with a GLB (Global Load Balancer) and some security for API calls.

#### Security considerations

Virgin and O2 are both international countries, so we cant just stick a `origin.region_code == 'GB'` and call it a day.

This then leaves us with actually having to think about what security to put on it.

I am going with the below:


| Action       | Match                                                       | Type                               |
|--------------|-------------------------------------------------------------|------------------------------------|
| `Deny (404)` | `evaluatePreconfiguredExpr('sqli-v33-stable')`              | Block sqli-v33-stable              |
| `Deny (404)` | `evaluatePreconfiguredExpr('xss-v33-stable')`               | Block xss-v33-stable               |
| `Deny (404)` | `evaluatePreconfiguredExpr('lfi-v33-stable')`               | Block lfi-v33-stable               |
| `Deny (404)` | `evaluatePreconfiguredExpr('rfi-v33-stable')`               | Block rfi-v33-stable               |
| `Deny (404)` | `evaluatePreconfiguredExpr('rce-v33-stable')`               | Block rce-v33-stable               |
| `Deny (404)` | `evaluatePreconfiguredExpr('methodenforcement-v33-stable')` | Block methodenforcement-v33-stable |
| `Deny (404)` | `evaluatePreconfiguredExpr('scannerdetection-v33-stable')`  | Block scannerdetection-v33-stable  |
| `Deny (404)` | `evaluatePreconfiguredExpr('protocolattack-v33-stable')`    | Block protocolattack-v33-stable    |
| `Deny (404)` | `evaluatePreconfiguredExpr('php-v33-stable')`               | Block php-v33-stable               |
| `Deny (404)` | `evaluatePreconfiguredExpr('sessionfixation-v33-stable')`   | Block sessionfixation-v33-stable   |
| `Deny (404)` | `evaluatePreconfiguredExpr('java-v33-stable')`              | Block java-v33-stable              |
| `Deny (404)` | `evaluatePreconfiguredExpr('nodejs-v33-stable')`            | Block nodejs-v33-stable            |

This should cover most attacks, I've built my own WAF module a while ago, that I've titled the `megawaf`, and it blocks all the
UK hosting providers, as well as anything that isn't from the UK. <!-- If you want access to that one, hire me -->

## SBOM

I guess this section will list the _external_ resources we used, and why

| External resource                                                       | Why                                                                                                                                                                                                                                                                                                                                                                |
|-------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `git@github.com:userbradley/terraform-module-google-api.git?ref=v1.0.0` | I find enabling the API's can become quite gross as you either repeat the entire block, or you do a `for_each` but then it's in the terraform and just looks gross. I am open to critique here!                                                                                                                                                                    |
| `GoogleCloudPlatform/lb-http/google//modules/serverless_negs`           | I wrote most of this terraform whilst on the plane home from holiday, and this was the easiest way to get a production ready Load balancer using GCP's best design pricipals. Also if we are being completly honest here, I've not spent much time working with Load balancer in terraform, most of the time I use Load balancer it's using Kubernetes ingress etc |
