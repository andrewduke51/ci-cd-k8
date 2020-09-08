module "kubernetes_cluster" {
  source                  = "./modules/custom-cluster"
  allowed_ssh_cidr_blocks = ["${var.allowed_cidr_blocks}/25", "${var.my_public_ip}/32"]
  allowed_k8s_cidr_blocks = ["${var.allowed_cidr_blocks}/25", "${var.my_public_ip}/32"]
  cidr_allowed            = var.allowed_cidr_blocks
  kubeconfig_file         = "kubeconfig"
  cluster_name            = "44-labs"
  subnet_id               = aws_subnet.subnet_dmz.id
  vpc_id                  = aws_vpc.main_vpc.id
  tags = {
    Name = "44-labs.com"
  }
  api_hostname      = var.api_hostname
}