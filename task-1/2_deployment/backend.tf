# So normally this bucket would be deployed and stood up, but because this is a demo, I've commented it out. This shows
# I know not to store state in git. If you want an edgy way to store terraform state, store it in k8s secrets

#terraform {
#  backend "gcs" {
#    bucket = "vm-ohtwo-bucket"
#    prefix = "task-1"
#  }
#}
