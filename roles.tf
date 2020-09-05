resource "aws_iam_role" "kubernetes_role" {
  name = "kubernetes_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "kubernetes-role"
  }
}

resource "aws_iam_instance_profile" "kubernetes_profile" {
  name = "kubernetes_profile"
  role = aws_iam_role.kubernetes_role.name
}

resource "aws_iam_role_policy_attachment" "kubernetes_policy_attach" {
  role = aws_iam_role.kubernetes_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}