build {
  sources = [
    "source.amazon-ebs.ubuntu-base"
  ]

  provisioner "ansible" {
    #  Don't setup local proxy
    use_proxy = false
    #  The playbook to be run by Ansible
    playbook_file = format("%s/main.yml", var.ansible_playbook_path)
    # A requirements file which provides a way to install roles or collections
    galaxy_file = format("%s/requirements.yml", var.ansible_playbook_path)
    # The path to the directory on your local system in which to install the roles
    roles_path = var.roles_path
    # Extra arguments to pass to Ansible
    extra_arguments = [
      "--extra-vars",
      "ansible_python_interpreter=/bin/python3"
    ]
    # Environment variables to set before running Ansible
    ansible_env_vars = [
      "ANSIBLE_HOST_KEY_CHECKING=False",
      "ANSIBLE_SSH_ARGS='-o ForwardAgent=yes -o ControlMaster=auto -o ControlPersist=60s'",
      "ANSIBLE_ROLES_PATH=${var.roles_path}"
    ]
  }
}