# Helm Artifact Hub: https://prometheus-community.github.io/helm-charts
resource "helm_release" "kube_state_metrics" {
  name = "kube-state-metrics"

  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-state-metrics"
  version          = "5.25.1"
  namespace        = "kube-system"
  create_namespace = false

  set {
    name  = "replicas"
    value = 1
  }
}
