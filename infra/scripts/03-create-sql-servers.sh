#!/bin/bash
set -e

source ../env/$1.env

az sql server create \
  --name $SQL_SERVER \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --admin-user sqladminuser \
  --admin-password $SQL_ADMIN_PASSWORD
