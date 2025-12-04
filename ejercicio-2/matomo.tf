resource "kubernetes_deployment" "matomo" {
    metadata {
    name = "matomo"
    labels = {
      app = "matomo"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "matomo"
      }
    }
    template {
      metadata {
        labels = {
          app = "matomo"
        }
      }
      spec {
        container {
          name  = "matomo"
          image = "${var.dockerhub_user}/matomo-custom:latest"
          port {
            container_port = 80
          }
          volume_mount {
            name       = "matomo-storage"
            mount_path = "/var/www/html"
          }
          env {
            name  = "ALLOW_EMPTY_PASSWORD"
            value = "yes"
          }
          env {
            name  = "MATOMO_DATABASE_USER"
            value = var.matomo_user
          }
          env {
            name  = "MATOMO_DATABASE_NAME"
            value = var.matomo_database
          }
          env {
            name  = "MATOMO_DATABASE_PASSWORD"
            value = var.matomo_password
          }
          env {
            name  = "MATOMO_DATABASE_HOST"
            value = "service-mariadb"
          }
        }
        volume {
          name = "matomo-storage"
          persistent_volume_claim {
            claim_name = "matomo-pvc"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "service_matomo" {
  metadata {
    name = "service-matomo"
    labels = {
      app = "matomo"
    }
  }
  spec {
    selector = {
      app = "matomo"
    }
    type = "NodePort"
    port {
      port        = 80
      target_port = 80
      node_port   = 30081
    }
  }
}
