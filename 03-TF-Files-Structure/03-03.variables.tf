variable "environment" {
  type        = string
  description = "This is the environment value"
  default     = "Dev"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "UK West"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "learning-resources"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "azdevopsvenkat"
}
