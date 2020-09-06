module "kubernetes_cluster" {
  source                  = "./modules/custom-cluster"
  kubeconfig_dir          = "~/.kube"
  kubeconfig_file         = "kubeconfig"
  cluster_name            = "44-labs.com"
  allowed_ssh_cidr_blocks = var.allowed_cidr_blocks
  allowed_k8s_cidr_blocks = var.allowed_cidr_blocks
  api_dns_name            = "place_holder"
  subnet_id               = aws_subnet.subnet_dmz.id
  vpc_id                  = aws_vpc.main_vpc.id
}

# Route53
resource "aws_route53_record" "api_kube" {
  zone_id = var.hosted_zone_id_44
  name    = "api.kubernetes.44-labs.com"
  type    = "A"
  ttl     = "300"
  records = [module.kubernetes_cluster.master_node_public_ip]
  depends_on = [module.kubernetes_cluster.master_node_public_ip]
}