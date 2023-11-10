locals {
  pre_conditions = [
    "sqli-v33-stable",
    "xss-v33-stable",
    "lfi-v33-stable",
    "rfi-v33-stable",
    "rce-v33-stable",
    "methodenforcement-v33-stable",
    "scannerdetection-v33-stable",
    "protocolattack-v33-stable",
    "php-v33-stable", #lmao PHP, who even uses that???
    "sessionfixation-v33-stable",
    "java-v33-stable", # now I'm protecting against java, what's next? Cobol???
    "nodejs-v33-stable"
  ]
}

resource "google_compute_security_policy" "waf" {

  name    = "podinfo"
  project = var.project

  dynamic "rule" {
    for_each = local.pre_conditions
    content {
      action      = "deny(404)"
      description = "Block ${rule.value}"
      match {
        expr {
          expression = "evaluatePreconfiguredExpr('${rule.value}')"
        }
      }
      priority = rule.key
    }
  }

  rule {
    action      = "allow"
    description = "Allow everything that made it past the pre-built checks"
    match {
      config {
        src_ip_ranges = ["*"]
      }
      versioned_expr = "SRC_IPS_V1"
    }
    preview  = "false"
    priority = "2147483646"
  }

  rule {
    action      = "deny(403)"
    description = "Default rule, higher priority overrides it"
    match {
      config {
        src_ip_ranges = ["*"]
      }
      versioned_expr = "SRC_IPS_V1"
    }
    preview  = "false"
    priority = "2147483647"
  }
  type = "CLOUD_ARMOR"
}
