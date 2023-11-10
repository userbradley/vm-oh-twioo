# DevOps Engineer Tech Test
This is a simple tech test asking you to write some code with a purpose to verify your learning capability and Terraform skills.There are plenty of tutorials and examples online, and you can Google as much as you like to complete the task. Do get prepared on explaining what you have done, especially when third party code or tutorial code have been used.

## Overall requirement
1. Once the solution is finished, please store it in a public Git repository on GitHub (this is free to create) and share the link with us
2. The solution should be working e2e, and ideally we would expect to clone the repo and run a single command to get the results
3. Please have `README.md` in your repo with instructions on how to execute your code. Please note that GCP provide a [free trial](https://console.cloud.google.com/freetrial?_ga=2.30864826.465062206.1621110953-1562635123.1620165775) with $300 credits, this should be more than sufficient to test out your solution.

Start a new Terraform working directory satisfying the following requirements across for the following tasks:
## Task 1
1. Deploy a hello world cloud run service with sufficient security considerations for an API with a global public load balancer.

## Task 2
1. Create a service account that has relevant permissions to invoke the new cloud run service. (For context, consider the service account to be used by another google service that has to call the API via service to service communication.)

## Task 3
1. With the existing terraform files you have created, please configure a dynamic deployment process using terraform that allows the service to be deployed to multiple GCP projects and allows environment-specific variables to be used. Please note, you're not required to configure any CI/CD related files for this, but you will have to explain why you have chosen to structure your directory as you have.
