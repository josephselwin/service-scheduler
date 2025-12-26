#!/bin/bash

ENV=$1   # dev | qa | prod
LOCATION="eastus"

RG="rg-service-scheduler-$ENV"
SQL_SERVER="sql-scheduler-$ENV"
ADMIN_USER="sqladminuser"
ADMIN_PASSWORD="YourStrongPasswordHere"

az sql server create \
  --name $SQL_SERVER \
  --resource-group $RG \
  --location $LOCATION \
  --admin-user $ADMIN_USER \
  --admin-password $ADMIN_PASSWORD
