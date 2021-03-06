variable "subnet_vpc" {
  default = "10.80.80.0/22"
}

variable "subnet_dmz" {
  default = "10.80.81.0/25"
}

variable "subnet_internal" {
  default = "10.80.82.0/24"
}

variable "my_public_ip" {
  description = "Use your Public IP here"
  default = "0.0.0.0"
}

variable "s3_bucket_name" {
  default = "develop-terraform-backend-s3-store"
}

variable "terraform_dynamodb_iam_locks" {
  default = "terraform-dynamodb-iam-locks"
}

variable "allowed_cidr_blocks" {
  description = "Allow your Public IP"
  default = "0.0.0.0"
}

variable "api_hostname" {
  default = "example.com"
}