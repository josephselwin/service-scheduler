#!/bin/bash

LOCATION="eastus"

az group create \
  --name rg-service-scheduler-dev \
  --location $LOCATION

az group create \
  --name rg-service-scheduler-qa \
  --location $LOCATION

az group create \
  --name rg-service-scheduler-prod \
  --location $LOCATION
