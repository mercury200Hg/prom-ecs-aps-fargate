##!/bin/bash

WORKSPACE_ID=$(aws amp create-workspace --alias $AWS_PROMETHEUS_SERVICE_WORKSPACE_ALIAS --query "workspaceId" --output text --region $AWS_REGION)

sed -e s/WORKSPACE/$WORKSPACE_ID/g \
< prometheus.yaml.template \
> prometheus.yaml
