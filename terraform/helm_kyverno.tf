# Helm Artifact Hub: https://artifacthub.io/packages/helm/kyverno/kyverno
resource "helm_release" "kyverno" {
  name = "kyverno"

  repository       = "https://kyverno.github.io/kyverno/"
  chart            = "kyverno"
  version          = "3.2.6"
  namespace        = "kyverno"
  create_namespace = true

  set {
    name  = "admissionController.replicas"
    value = 3
  }

  set {
    name  = "backgroundController.replicas"
    value = 2
  }

  set {
    name  = "cleanupController.replicas"
    value = 2
  }

  set {
    name  = "reportsController.replicas"
    value = 2
  }
}
