terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_namespace" "altana" {
  metadata {
    name = "altana"
  }
}
resource "kubernetes_deployment" "altana" {
  metadata {
    name      = "search-api"
    namespace = kubernetes_namespace.altana.metadata.0.name
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx:1.7.9"
          name  = "nginx-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "altana" {
  metadata {
    name      = "altana"
    namespace = kubernetes_namespace.altana.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.altana.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      protocol   = "TCL "
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_ingress" "altana" {
  
  metadata {
    name = "altana"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      hosts {
         host = search.altana.ai 
        
      http {
        path {
          path = "/altana"
          backend {
            service_name = kubernetes_service.altana.metadata.0.name
            service_port = 80
          }
          }
        }
      }
    }
  }
}