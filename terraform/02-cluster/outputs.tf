output "eks_cluster_name" {
  value = aws_eks_cluster.this.id
}

output "eks_cluster_security_group_id" {
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
  description = "Security group ID associated with the EKS cluster"
}

output "eks_cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "EKS cluster API endpoint"
}

output "eks_cluster_ca_data" {
  value       = aws_eks_cluster.this.certificate_authority[0].data
  description = "EKS cluster certificate authority data"
}

output "eks_node_group_name" {
  value       = aws_eks_node_group.this.node_group_name
}

output "eks_node_group_role_name" {
  value = aws_iam_role.eks_node_group.name
}

output "eks_node_group_role_arn" {
  value = aws_iam_role.eks_node_group.arn
}

output "oidc_provider_url" {
  value = aws_eks_cluster.this.identity[0].oidc[0].issuer
}