# Warehouse
resource "snowflake_warehouse" "main" {
  name           = "ARCTICFLOW_WH"
  warehouse_size = "X-SMALL"
  auto_suspend   = 60
  auto_resume    = true
  comment        = "Main compute warehouse for ArcticFlow"
}

# Databases
resource "snowflake_database" "raw" {
  name    = "RAW_DB"
  comment = "Raw ingested data from Azure bronze layer"
}

resource "snowflake_database" "analytics" {
  name    = "ANALYTICS_DB"
  comment = "Cleaned and transformed data from silver layer"
}

resource "snowflake_database" "reporting" {
  name    = "REPORTING_DB"
  comment = "Business ready aggregates from gold layer"
}

# Schemas
resource "snowflake_schema" "raw_bronze" {
  database = snowflake_database.raw.name
  name     = "BRONZE"
  comment  = "Bronze layer raw data"
}

resource "snowflake_schema" "analytics_silver" {
  database = snowflake_database.analytics.name
  name     = "SILVER"
  comment  = "Silver layer cleaned data"
}

resource "snowflake_schema" "reporting_gold" {
  database = snowflake_database.reporting.name
  name     = "GOLD"
  comment  = "Gold layer business ready data"
}

# Roles
resource "snowflake_account_role" "loader" {
  name    = "ARCTICFLOW_LOADER"
  comment = "Role for loading data into RAW_DB"
}

resource "snowflake_account_role" "transformer" {
  name    = "ARCTICFLOW_TRANSFORMER"
  comment = "Role for transforming data into ANALYTICS_DB"
}

resource "snowflake_account_role" "analyst" {
  name    = "ARCTICFLOW_ANALYST"
  comment = "Role for reading data from REPORTING_DB"
}

# Warehouse grants
resource "snowflake_grant_privileges_to_account_role" "loader_warehouse" {
  account_role_name = snowflake_account_role.loader.name
  privileges        = ["USAGE"]
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.main.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "transformer_warehouse" {
  account_role_name = snowflake_account_role.transformer.name
  privileges        = ["USAGE"]
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.main.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analyst_warehouse" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["USAGE"]
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.main.name
  }
}

# Database grants
resource "snowflake_grant_privileges_to_account_role" "loader_raw_db" {
  account_role_name = snowflake_account_role.loader.name
  privileges        = ["USAGE"]
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.raw.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "transformer_analytics_db" {
  account_role_name = snowflake_account_role.transformer.name
  privileges        = ["USAGE"]
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.analytics.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analyst_reporting_db" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["USAGE"]
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.reporting.name
  }
}
