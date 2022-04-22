##!/bin/bash

# WebApp Service
#
SERVICE_NAME=WebAppService
TASK_DEFINITION=$WEBAPP_TASK_DEFINITION
CLOUDMAP_SERVICE_ARN=$CLOUDMAP_WEBAPP_SERVICE_ARN
aws ecs create-service --service-name $SERVICE_NAME \
--cluster $ECS_CLUSTER_NAME \
--task-definition $TASK_DEFINITION \
--desired-count 2 \
--service-registries "registryArn=$CLOUDMAP_SERVICE_ARN" \
--network-configuration "awsvpcConfiguration={subnets=$PRIVATE_SUBNET_IDS,securityGroups=[$SECURITY_GROUP_ID],assignPublicIp=$ECS_WEBAPP_PUBLIC_IP_ENABLED}" \
--scheduling-strategy REPLICA \
--launch-type "FARGATE" \
--region=$AWS_REGION

#
# Create the Prometheus Service
#
SERVICE_NAME=PrometheusService
TASK_DEFINITION=$PROMETHEUS_TASK_DEFINITION
aws ecs create-service --service-name $SERVICE_NAME \
--cluster $ECS_CLUSTER_NAME \
--task-definition $TASK_DEFINITION \
--desired-count 1 \
--network-configuration "awsvpcConfiguration={subnets=$PRIVATE_SUBNET_IDS,securityGroups=[$SECURITY_GROUP_ID],assignPublicIp=$ECS_PROMETHEUS_PUBLIC_IP_ENABLED}" \
--scheduling-strategy REPLICA \
--launch-type "FARGATE" \
--region=$AWS_REGION
