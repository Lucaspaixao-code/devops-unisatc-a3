resource "kubernetes_deployment" "app" {
  metadata {
    name      = "app-deployment"
    namespace = "default"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "app"
      }
    }

    template {
      metadata {
        labels = {
          app = "app"
        }
      }

      spec {
        container {
          image = var.docker_image
          name  = "app-container"

          port {
            container_port = 1337
          }
        }
      }
    }
  }
}