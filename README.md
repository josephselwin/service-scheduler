service-scheduler/
│
├── README.md
│
├── infra/                     # Azure infrastructure (CLI / IaC)
│   ├── env/
│   │   ├── dev.env
│   │   ├── qa.env
│   │   └── prod.env
│   │
│   ├── scripts/
│   │   ├── 01-login.sh
│   │   ├── 02-create-resource-groups.sh
│   │   ├── 03-create-sql-servers.sh
│   │   ├── 04-create-databases.sh
│   │   ├── 05-create-keyvaults.sh
│   │   └── 99-destroy-env.sh
│   │
│   └── README.md
│
├── db/
│   ├── migrations/            # Immutable schema changes
│   │   ├── V001__Create_Core_Tables.sql
│   │   ├── V002__Add_Availability.sql
│   │   ├── V003__Indexes.sql
│   │
│   ├── procedures/            # Stored procedures
│   │   ├── sp_CreateAppointment.sql
│   │   ├── sp_CheckAvailability.sql
│   │
│   ├── seed/                  # Dev/test seed data only
│   │   └── dev_seed_data.sql
│   │
│   └── README.md
│
├── api/
│   ├── src/
│   ├── tests/
│   ├── Dockerfile
│   └── README.md
│
├── ui/
│   ├── web/
│   ├── mobile/
│   └── README.md
│
├── pipelines/
│   ├── azure-pipelines.yml
│   ├── db-migrations.yml
│   └── release.yml
│
└── docs/
    ├── architecture.md
    ├── environments.md
    └── runbooks.md
