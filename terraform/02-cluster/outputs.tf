output "eks_cluster_name" {
  value = aws_eks_cluster.this.id
}

output "oidc_provider_url" {
  value = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

output "eks_node_group_role_name" {
  value = aws_iam_role.eks_node_group.name
}

output "eks_node_group_role_arn" {
  value = aws_iam_role.eks_node_group.arn
}
