# I dont manage my personal DNS in GCP, but just pretend I do, this is what the config would look like.
#resource "google_dns_record_set" "frontend" {
#  name = "podinfo.breadinfra.net."
#  type = "A"
#  ttl  = 300
#  managed_zone = "breadinfra"
#  rrdatas = [module.lb-http.external_ip]
#}
