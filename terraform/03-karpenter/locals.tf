locals {
  eks_oidc_url = replace(data.terraform_remote_state.eks.outputs.oidc_provider_url, "https://", "")
}
