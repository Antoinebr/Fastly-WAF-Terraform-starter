resource "sigsci_site_templated_rule" "test_template_rule" {
  site_short_name = var.sigsci_site
  name            = "LOGINATTEMPT"
  detections {
    enabled = "true"
    fields {
      name  = "path"
      value = "/login"
    }
  }

  alerts {
    long_name              = "alert 2"
    interval               = 60 // in minutes
    threshold              = 20 // number of reqyests
    skip_notifications     = true
    enabled                = true
    //action                 = "info" // "info" = Flag IP and log 
    action                 = "template" // "template" = Flag IP and block all subsequent requests from that IP tagged with ( see : https://github.com/signalsciences/terraform-provider-sigsci/blob/6fca94616df2b1cfe2bd6daaad87f67cc9cbde6e/provider/resource_site_templated_rule.go#L108C124-L108C150)
    block_duration_seconds = 120
  }

 
}