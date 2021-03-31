terraform {
  required_version = ">= 0.12.20"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.3"
    }
  }
}