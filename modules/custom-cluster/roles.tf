## ec2 cluster kubernetes role
resource "aws_iam_role" "ec2_role" {
  name               = "ec2-role"
  assume_role_policy = file("${path.module}/templates/assumerolepolicy.json")
  tags = {
    tag-key = "ec2-role"
  }
}

resource "aws_iam_instance_profile" "ec2_role_profile" {
  name = "ec2_role_profile"
  role = aws_iam_role.ec2_role.name
}
resource "aws_iam_policy" "ec2_kubernetes_policy" {
  name        = "ec2-kubernetes-policy"
  description = "A ec2 kubernetes policy"
  policy      = file("${path.module}/templates/ec2policykubernetes.json")
}
resource "aws_iam_policy_attachment" "ec2_kubernetes_policy_attach" {
  name       = "ec2_kubernetes_policy_attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_kubernetes_policy.arn
}
