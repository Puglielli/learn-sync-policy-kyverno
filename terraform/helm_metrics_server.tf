# Helm Artifact Hub: https://artifacthub.io/packages/helm/metrics-server/metrics-server
resource "helm_release" "metrics_server" {
  name = "metrics-server"

  repository       = "https://kubernetes-sigs.github.io/metrics-server/"
  chart            = "metrics-server"
  version          = "3.12.1"
  namespace        = "kube-system"
  create_namespace = false

  set {
    name  = "replicas"
    value = 1
  }

  set {
    name  = "apiService.insecureSkipTLSVerify"
    value = true
  }

  set {
    name  = "metrics.enabled"
    value = true
  }

  set_list {
    name  = "args"
    value = ["--kubelet-insecure-tls"]
  }
}