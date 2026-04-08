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

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Address prefixes for each subnet"
  type        = map(string)
  default = {
    data    = "10.0.1.0/24"
    private = "10.0.2.0/24"
    compute = "10.0.3.0/24"
  }
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}
