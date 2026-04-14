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
      source  = "snowflakedb/snowflake"
      version = "~> 0.100"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "snowflake" {
  organization_name      = "HAHJJMT"
  account_name           = "XD80397"
  user                   = var.snowflake_user
  authenticator          = "SNOWFLAKE_JWT"
  private_key            = file(var.snowflake_private_key_path)
  private_key_passphrase = var.snowflake_private_key_passphrase
  role                   = "SECURITYADMIN"
}

module "networking" {
  source = "./modules/networking"

  project             = var.project
  environment         = var.environment
  location            = var.location
  resource_group_name = "rg-${var.project}-${var.environment}"
  tags                = var.tags
}

module "key_vault" {
  source = "./modules/key_vault"

  project             = var.project
  environment         = var.environment
  location            = var.location
  resource_group_name = module.networking.resource_group_name
  tenant_id           = var.tenant_id
  admin_object_id     = var.admin_object_id
  subnet_id           = module.networking.subnet_data_id
  tags                = var.tags
  allowed_ip_address  = var.allowed_ip_address
  depends_on = [module.networking]
}
module "storage" {
  source = "./modules/storage"

  project             = var.project
  environment         = var.environment
  location            = var.location
  resource_group_name = module.networking.resource_group_name
  subnet_id           = module.networking.subnet_data_id
  key_vault_id        = module.key_vault.key_vault_id
  allowed_ip_address  = var.allowed_ip_address
  tags                = var.tags

  depends_on = [module.key_vault]
}

module "sql" {
  source = "./modules/sql"

  project             = var.project
  environment         = var.environment
  location            = var.location
  resource_group_name = module.networking.resource_group_name
  subnet_id           = module.networking.subnet_data_id
  key_vault_id        = module.key_vault.key_vault_id
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
  allowed_ip_address  = var.allowed_ip_address
  tags                = var.tags

  depends_on = [module.key_vault]
}

module "data_factory" {
  source = "./modules/data_factory"

  project              = var.project
  environment          = var.environment
  location             = var.location
  resource_group_name  = module.networking.resource_group_name
  key_vault_id         = module.key_vault.key_vault_id
  key_vault_uri        = module.key_vault.key_vault_uri
  storage_account_name = module.storage.storage_account_name
  sql_server_fqdn      = module.sql.sql_server_fqdn
  sql_database_name    = module.sql.sql_database_name
  sql_admin_username   = var.sql_admin_username
  tags                 = var.tags

  depends_on = [module.key_vault, module.storage, module.sql]
}

module "snowflake" {
  source = "./modules/snowflake"

  project     = var.project
  environment = var.environment
  tags        = var.tags
}

module "monitoring" {
  source = "./modules/monitoring"

  project             = var.project
  environment         = var.environment
  location            = var.location
  resource_group_name = module.networking.resource_group_name
  storage_account_id  = module.storage.storage_account_id
  key_vault_id        = module.key_vault.key_vault_id
  data_factory_id     = module.data_factory.data_factory_id
  sql_server_id       = module.sql.sql_server_id
  alert_email         = var.alert_email
  tags                = var.tags

  depends_on = [module.data_factory, module.storage, module.sql, module.key_vault]
}
