# ❄️ ArcticFlow

> Enterprise-grade, Terraform-automated data engineering platform on Azure + Snowflake.

## Architecture
- **Ingestion:** Azure Data Factory
- **Storage:** ADLS Gen2 (Bronze / Silver / Gold medallion layers)
- **Staging:** Azure SQL Database
- **Warehouse:** Snowflake (RAW → ANALYTICS → REPORTING)
- **Security:** Azure Key Vault, Managed Identities, Private Endpoints, RBAC
- **IaC:** 100% Terraform — zero manual cloud clicks

## Project Structure
\```
arcticflow/
├── modules/         # Reusable Terraform modules
├── environments/    # Dev and prod configurations
└── docs/            # Architecture diagrams
\```

## Status
🚧 In active development

## Tech Stack
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform)
![Azure](https://img.shields.io/badge/Azure-0078D4?style=flat&logo=microsoftazure)
![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=flat&logo=snowflake)