locals {
  eks_oidc_url         = replace(data.terraform_remote_state.eks.outputs.oidc_provider_url, "https://", "")
  node_group_role_name = data.terraform_remote_state.eks.outputs.eks_node_group_role_name
  eks_cluster_name     = data.terraform_remote_state.eks.outputs.eks_cluster_name
  eks_cluster_sg_id    = data.terraform_remote_state.eks.outputs.eks_cluster_security_group_id
}
