data "http" "node_class_crd" {
  url = "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v1.3.3/pkg/apis/crds/karpenter.k8s.aws_ec2nodeclasses.yaml"
}

resource "kubernetes_manifest" "node_class_crd" {
  manifest = yamldecode(data.http.node_class_crd.response_body)
}

resource "kubernetes_manifest" "node_class" {
  manifest = yamldecode(templatefile("./manifests/karpenter.node-class.yml", {
    node_group_role_name = local.node_group_role_name,
    cluster_name         = local.eks_cluster_name
  }))
}
