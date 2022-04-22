#!/bin/bash

# Create param ECS-ServiceDiscovery-Namespaces
aws ssm put-parameter \
    --name "ECS-ServiceDiscovery-Namespaces" \
    --description "Cloudmap namespace to discover prometheus targets" \
    --value "$SERVICE_DISCOVERY_NAMESPACE" \
    --type "String" \
    --data-type "text" \
    --tier Standard

# Create param ECS-Prometheus-Configuration
PROMETHEUS_YAML_CONTENT=$(cat prometheus.yaml)

aws ssm put-parameter \
    --name "ECS-Prometheus-Configuration" \
    --description "Content of prometheus.yaml in ECS" \
    --value "$PROMETHEUS_YAML_CONTENT" \
    --type "String" \
    --data-type "text" \
    --tier Standard
