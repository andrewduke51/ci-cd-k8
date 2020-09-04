module "kubernetes_cluster" {
  source = "./module"
  subnet_id = aws_subnet.subnet_dmz.id
  vpc_id = aws_vpc.main_vpc.id
}