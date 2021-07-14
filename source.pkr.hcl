source "amazon-ebs" "ubuntu-base" {
  # AWS region to be used
  region = var.region

  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }

  # AWS instance type to be used
  instance_type = var.instance_type
  # Username used on ssh connection
  ssh_username = var.ssh_username
  # AMI name to be created
  ami_name = var.ami_name

  # Tags to be created on AMI
  tags = var.ami_tags
}