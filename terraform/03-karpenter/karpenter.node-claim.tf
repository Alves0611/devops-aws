data "http" "node_claim_crd" {
  url = "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v1.3.3/pkg/apis/crds/karpenter.sh_nodeclaims.yaml"
}

resource "kubernetes_manifest" "node_claim_crd" {
  manifest   = yamldecode(data.http.node_claim_crd.response_body)
}
