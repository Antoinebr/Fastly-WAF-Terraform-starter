variable "sigsci_corp" {
  description = "The Signal Sciences corporation name"
  type        = string
}

variable "sigsci_email" {
  description = "The email address for Signal Sciences"
  type        = string
}

variable "sigsci_site" {
  description = "The site we are working with in Signal Sciences"
  type        = string
}


variable "sigsci_auth_token" {
  description = "The auth token for Signal Sciences"
  type        = string
  sensitive   = true
}

variable "sigsci_password" {
  description = "The password for Signal Sciences (optional)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "fastly_api_key" {
  description = "The Fastly API key for Edge Deployments (optional)"
  type        = string
  sensitive   = true
  default     = ""
}
