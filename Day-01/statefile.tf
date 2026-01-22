# Best Practice:
# The storage account must be pre-created.
# Terraform should only reference it, not create it in this main.tf file configuration.

#Terraform State File
# Terraform uses the state file as the source of truth and reconciles differences between
# desired configuration and actual infrastructure during plan and apply operations.
#Terraform state should always be stored in a remote backend to ensure consistency, security, and collaboration.
#Terraform state files should never be manually modified; all state changes must be performed using
# Terraform commands to avoid corruption.
