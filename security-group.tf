resource "aws_security_group" "allow_tls" {
  name        = "allow_from"
  description = "Allow inbound traffic from Home"
  vpc_id      = "${aws_vpc.main_vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["${var.my_public_ip}/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}