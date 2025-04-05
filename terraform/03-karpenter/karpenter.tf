resource "helm_release" "karpenter" {
  name       = "karpenter"
  repository = "oci://public.ecr.aws/karpenter"
  chart      = "karpenter"
  version    = "1.3.3"
  namespace  = "kube-system"

  values = [
    "${templatefile("./manifests/karpenter.values.yml", {
      node_group_name = local.eks_node_group_name,
    })}"
  ]

  set {
    name  = "settings.clusterName"
    value = local.eks_cluster_name
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.karpenter_controller.arn
  }

  set {
    name  = "controller.resources.requests.cpu"
    value = 1
  }

  set {
    name  = "controller.resources.limits.cpu"
    value = 1
  }

  set {
    name  = "controller.resources.requests.memory"
    value = "1Gi"
  }

  set {
    name  = "controller.resources.limits.memory"
    value = "1Gi"
  }

  depends_on = [
    kubernetes_manifest.node_pool_crd,
    kubernetes_manifest.node_claim_crd,
    kubernetes_manifest.node_class_crd
  ]
}
