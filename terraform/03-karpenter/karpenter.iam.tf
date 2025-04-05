resource "aws_iam_role" "karpenter_controller" {
  name = var.karpenter.karpenter_controller_role_name
  assume_role_policy = jsonencode({
    Statement = [{
      Effect = "Allow"
      Principal = {
        "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.id}:oidc-provider/${local.eks_oidc_url}"
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "${local.eks_oidc_url}:aud" = "sts.amazonaws.com",
          "${local.eks_oidc_url}:sub" = "system:serviceaccount:kube-system:karpenter"
        }
      }
    }]
    Version = "2012-10-17"
  })
}
