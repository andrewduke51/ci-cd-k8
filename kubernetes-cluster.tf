module "kubernetes_cluster" {
  source                  = "./modules/custom-cluster"
  allowed_ssh_cidr_blocks = ["${var.allowed_cidr_blocks}/32"]
  allowed_k8s_cidr_blocks = ["${var.allowed_cidr_blocks}/32"]
  cidr_allowed            = var.allowed_cidr_blocks
  kubeconfig_file         = "kubeconfig"
  cluster_name            = "44-labs"
  subnet_id               = aws_subnet.subnet_dmz.id
  vpc_id                  = aws_vpc.main_vpc.id
  tags = {
    Name = "44-labs.com"
  }
}

//# Route53
//resource "aws_route53_record" "api_kube" {
//  zone_id = var.hosted_zone_id_44
//  name    = "api.kubernetes.44-labs.com"
//  type    = "A"
//  ttl     = "300"
//  records = ["${module.kubernetes_cluster.master_node_public_ip}"]
//}

//module "kubernetes_cluster" {
//  source = "./modules/clusters"
//  subnet_id = aws_subnet.subnet_dmz.id
//  vpc_id = aws_vpc.main_vpc.id
//}