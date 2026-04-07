# ❄️ ArcticFlow

> Enterprise-grade, Terraform-automated data engineering platform on Azure + Snowflake.

![Status](https://img.shields.io/badge/Status-In%20Development-yellow)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?logo=microsoftazure&logoColor=white)
![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?logo=snowflake&logoColor=white)

---

## 🏗️ Architecture

| Layer | Technology |
|-------|-----------|
| Ingestion | Azure Data Factory |
| Storage | ADLS Gen2 — Bronze / Silver / Gold medallion |
| Staging | Azure SQL Database |
| Warehouse | Snowflake — RAW → ANALYTICS → REPORTING |
| Security | Azure Key Vault · Managed Identities · Private Endpoints · RBAC |
| IaC | 100% Terraform — zero manual cloud clicks |

---

## 📁 Project Structure
```
arcticflow/
├── main.tf                  # Root configuration & provider setup
├── variables.tf             # All input variables
├── outputs.tf               # All outputs
├── example.tfvars           # Example variable values (safe to commit)
├── modules/
│   ├── networking/          # VNet, subnets, private endpoints
│   ├── storage/             # ADLS Gen2 bronze/silver/gold layers
│   ├── sql/                 # Azure SQL staging database
│   ├── data_factory/        # ADF pipelines & linked services
│   ├── key_vault/           # Secrets, keys, access policies
│   ├── snowflake/           # Warehouse, databases, schemas, RBAC
│   └── monitoring/          # Log Analytics & alerts
├── environments/
│   ├── dev/                 # Dev environment config
│   └── prod/                # Prod environment config
└── docs/                    # Architecture diagrams
```

---

## 🔄 Data Flow
```
[Source / Azure SQL]
       ↓  ADF Pipeline
[ADLS Gen2 Bronze]  ← raw data
       ↓  ADF Transform
[ADLS Gen2 Silver]  ← cleaned & typed
       ↓  ADF Load
[ADLS Gen2 Gold]    ← business-ready
       ↓  Snowflake Stage
[Snowflake Warehouse] ← analytics layer
       ↑
[Azure Key Vault]   ← all secrets, zero hardcoding
```

---

## 🔐 Security Design

- All secrets stored in **Azure Key Vault** — never hardcoded
- **Managed Identities** for ADF — no passwords
- **RBAC** roles assigned via Terraform
- **Private Endpoints** on Storage & SQL
- **Snowflake RSA key pair** authentication — password-free

---

## 🚀 Getting Started

### Prerequisites
- Terraform >= 1.5.0
- Azure CLI authenticated (`az login`)
- Snowflake account with RSA key pair configured

### Deploy
```bash
cp example.tfvars terraform.tfvars
# Fill in your values in terraform.tfvars
terraform init
terraform plan
terraform apply
```

---

## 📌 Build Phases

- [x] Phase 0 — Local environment & tooling
- [x] Phase 1 — GitHub repo structure
- [ ] Phase 2 — Terraform remote state backend
- [ ] Phase 3 — Networking module
- [ ] Phase 4 — Key Vault module
- [ ] Phase 5 — Storage (ADLS Gen2) module
- [ ] Phase 6 — Azure SQL module
- [ ] Phase 7 — Azure Data Factory module
- [ ] Phase 8 — Snowflake module
- [ ] Phase 9 — Monitoring module