#!/bin/bash

ENV=$1

RG="rg-service-scheduler-$ENV"
SQL_SERVER="sql-scheduler-$ENV"
DB_NAME="ServiceScheduler_$ENV"

az sql db create \
  --resource-group $RG \
  --server $SQL_SERVER \
  --name $DB_NAME \
  --service-objective Basic
