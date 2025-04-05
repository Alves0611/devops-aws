resource "aws_ec2_tag" "private_subnets_karpenter_discovery" {
  for_each = toset(data.terraform_remote_state.network.outputs.private_subnet_ids)

  resource_id = each.value
  key         = "karpenter.sh/discovery"
  value       = local.eks_cluster_name
}
