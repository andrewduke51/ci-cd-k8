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
  hosted_zone_id_44 = var.hosted_zone_id_44
  api_hostname = var.api_hostname
}