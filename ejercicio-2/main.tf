terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30" # Opcional
    }
  }
}
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-matomo-cluster"
}

resource "kubernetes_namespace" "matomo_namespace" {
  metadata {
    name = "matomo"
    labels = { app = "matomo" }
  }
}
