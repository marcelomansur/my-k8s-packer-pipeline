source "amazon-ebs" "basic-example" {
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

  instance_type = var.instance_type
  ssh_username  = var.ssh_username
  ami_name      = var.ami_name

  tags = var.ami_tags
}

build {
  sources = [
    "source.amazon-ebs.basic-example"
  ]

  provisioner "ansible" {
    use_proxy     = false
    galaxy_file   = "./ansible/requirements.yml"
    playbook_file = "./ansible/playbook.yml"
    extra_arguments = [
      "--extra-vars",
      "ansible_python_interpreter=/bin/python3"
    ]
  }
}
