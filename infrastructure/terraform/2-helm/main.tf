resource "helm_release" "mongodb" {
  name       = "mongodb"
  chart      = "../../helm_charts/MongoDB"
  version = "1.0.0"
}

resource "helm_release" "postgres" {
  name       = "postgres"
  chart      = "../../helm_charts/Postgres"
  version = "1.0.0"
}

resource "helm_release" "rabbitmq" {
  name       = "rabbitmq"
  chart      = "../../helm_charts/RabbitMQ"
  force_update = true
  version = "1.0.1"
}