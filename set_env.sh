#!/bin/bash

export AWS_REGION="us-east-2" # Replace this with yours
export NETWORK_STACK_NAME="networking-stack" # Replace this with as per your choice
export ACCOUNT_ID=958221298220 # Replace this with yours

# SERVICE_DISCOVERY_NAMESPACE is created to create namespace in AWS CLOUD MAP
export SERVICE_DISCOVERY_NAMESPACE="ecs-services3" # Replace this with yours

export AWS_PROMETHEUS_SERVICE_WORKSPACE_ALIAS="prometheus-for-ecs" # Replace this with yours
export ECS_WEBAPP_PUBLIC_IP_ENABLED="ENABLED"
export ECS_PROMETHEUS_PUBLIC_IP_ENABLED="ENABLED"

export ECS_CLUSTER_NAME="ecs-cluster" # Replace this with yours
