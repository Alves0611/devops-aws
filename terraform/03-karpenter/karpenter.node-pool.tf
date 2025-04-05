data "http" "node_pool_crd" {
  url = "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v1.3.3/pkg/apis/crds/karpenter.sh_nodepools.yaml"
}

resource "kubernetes_manifest" "node_pool_crd" {
  manifest   = yamldecode(data.http.node_pool_crd.response_body)
  depends_on = [local.eks_node_group_name]
}


