# Makefile for Terraform

# Variables
TF_CMD ?= terraform
PARALLELISM ?= 1

# Targets
.PHONY: init plan apply destroy fmt validate

init:
	@$(TF_CMD) init

plan:
	@$(TF_CMD) plan

apply:
	@$(TF_CMD) apply -parallelism=$(PARALLELISM)

destroy:
	@$(TF_CMD) destroy -parallelism=$(PARALLELISM)

fmt:
	@$(TF_CMD) fmt -recursive

validate:
	@$(TF_CMD) validate

# To apply with a specific variable file
apply-with-var-file:
	@$(TF_CMD) apply -parallelism=$(PARALLELISM) -var-file=$(VAR_FILE)

# To plan with a specific variable file
plan-with-var-file:
	@$(TF_CMD) plan -var-file=$(VAR_FILE)

# To output resources
output:
	@$(TF_CMD) output

# To refresh the state
refresh:
	@$(TF_CMD) refresh