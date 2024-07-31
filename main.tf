
terraform {
  required_providers {
    sigsci = {
      source = "signalsciences/sigsci" 
      version = "1.0.0" # Use the appropriate version you have set
    }
  }
}


provider "sigsci" {
    corp       = var.sigsci_corp
    email      = var.sigsci_email
    auth_token = var.sigsci_auth_token
  //  password = ""   // May also provide via env variable SIGSCI_PASSWORD
  //  fastly_api_key = "" // May also provide via env variable FASTLY_API_KEY. Required for Edge Deployments functionality.
}



