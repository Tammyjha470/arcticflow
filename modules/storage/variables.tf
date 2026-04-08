variable "project" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID allowed to access storage"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID to store storage account key"
  type        = string
}

variable "allowed_ip_address" {
  description = "Your local IP address allowed through storage firewall"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}
