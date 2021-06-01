# cnf ?= .env
# include $(cnf)
# export $(shell sed 's/=.*//' $(cnf))

SHELL=/bin/bash
TERRAFORM_VERSION=0.14.0
DOCKER_IMAGE=mdmansur/packer-ansible:v0.1

# HELP
# This will output the lp for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

hp: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAT_GOAL := help

packer-init: ## Run command 'packer init'
	docker run --rm -v $$PWD:/workspace -w /workspace -e PACKER_PLUGIN_PATH=/workspace/.packer.d/plugins $(DOCKER_IMAGE) init .
packer-fmt: ## Run command 'packer fmt'
	docker run --rm -v $$PWD:/workspace -w /workspace -e PACKER_PLUGIN_PATH=/workspace/.packer.d/plugins $(DOCKER_IMAGE) fmt .
packer-validate: ## Run command 'packer validate'
	docker run --rm -v $$PWD:/workspace -w /workspace -e PACKER_PLUGIN_PATH=/workspace/.packer.d/plugins $(DOCKER_IMAGE) validate .
packer-build: ## Run command 'packer build'
	docker run --rm -v $$PWD:/workspace -w /workspace --env-file $$PWD/.packer.env -e PACKER_PLUGIN_PATH=/workspace/.packer.d/plugins $(DOCKER_IMAGE) build .