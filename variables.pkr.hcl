variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
}

variable "ssh_username" {
  type = string
}

variable "ami_name" {
  type = string
}

variable "ami_tags" {
  type = map(string)
  default = {
    "Packer" = "true"
  }
}