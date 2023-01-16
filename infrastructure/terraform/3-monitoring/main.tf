resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus" {
  chart      = "prometheus"
  name       = "prometheus"
  namespace  = kubernetes_namespace.namespace.id
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "15.5.3"

  set {
    name  = "podSecurityPolicy.enabled"
    value = false
  }

  set {
    name  = "server.persistentVolume.enabled"
    value = false
  }

  # You can provide a map of value using yamlencode. Don't forget to escape the last element after point in the name
  set {
    name = "server\\.resources"
    value = yamlencode({
      limits = {
        cpu    = "200m"
        memory = "50Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "30Mi"
      }
    })
  }
}

/* resource "kubernetes_secret" "grafana" {
  metadata {
    name      = "grafana"
    namespace = kubernetes_namespace.namespace.id
  }

  data = {
    admin-user     = "admin"
    admin-password = "admin"
  }
}


resource "helm_release" "grafana" {
  chart      = "grafana"
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  namespace  = kubernetes_namespace.namespace.id
  version    = "6.24.1"

  values = [
    templatefile("${path.module}/values/grafana-values.yaml", {
      admin_existing_secret = kubernetes_secret.grafana.metadata[0].name
      admin_user_key        = "admin"
      admin_password_key    = "admin"
      prometheus_svc        = "${helm_release.prometheus.name}-server"
      replicas              = 1
    })
  ]
} */