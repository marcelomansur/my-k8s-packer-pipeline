variable "region" {
  type        = string
  description = "AWS region to be used"
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "AWS instance type to be used"
}

variable "ssh_username" {
  type        = string
  description = "Username used on ssh connection"
}

variable "ami_name" {
  type        = string
  description = "AMI name to be created"
}

variable "ami_tags" {
  type        = map(string)
  description = "Tags to be created on AMI"
  default = {
    "Packer"      = "true",
    "Provisioner" = "ansible",
    "Tecnology"   = "k8s"
  }
}

variable "roles_path" {
  type        = string
  description = "The path to the directory on your local system in which to install the roles"
  default     = "provisioners/ansible/roles"
}

variable "ansible_playbook_path" {
  type        = string
  description = "The playbook to be run by Ansible"
  default     = "provisioners/ansible"
}