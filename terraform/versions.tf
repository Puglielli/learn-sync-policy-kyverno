terraform {
  required_version = "~> 1.9.5"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.15.0"
    }
  }
}
