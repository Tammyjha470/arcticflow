# ArcticFlow — Root Configuration
# Modules will be called from here as they are built

terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "rg-arcticflow-tfstate"
    storage_account_name = "satfstatearcticflow"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.89"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "snowflake" {
  account                  = var.snowflake_account
  username                 = var.snowflake_user
  private_key_path         = var.snowflake_private_key_path
  private_key_passphrase   = var.snowflake_private_key_passphrase
}