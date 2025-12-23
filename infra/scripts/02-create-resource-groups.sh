#!/bin/bash
set -e

source ../env/$1.env

az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION \
  --tags Environment=$ENV App=ServiceScheduler
