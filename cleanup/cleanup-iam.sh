##!/bin/bash
#
# Delete IAM roles and policies
#
CLOUDWATCH_LOGS_POLICY_ARN=arn:aws:iam::aws:policy/CloudWatchLogsFullAccess
ECS_TASK_EXECUTION_POLICY_ARN=arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy
ECS_PROMETHEUS_TASK_POLICY_ARN=arn:aws:iam::$ACCOUNT_ID:policy/ECSPrometheusTaskPolicy
ECS_GENERIC_TASK_ROLE="ECS-Generic-Task-Role"
ECS_TASK_EXECUTION_ROLE="ECS-Task-Execution-Role"
ECS_PROMETHEUS_TASK_ROLE="ECS-Prometheus-Task-Role"
ECS_PROMETHEUS_TASK_POLICY="ECSPrometheusTaskPolicy"

aws iam detach-role-policy --role-name $ECS_GENERIC_TASK_ROLE --policy-arn $CLOUDWATCH_LOGS_POLICY_ARN
aws iam detach-role-policy --role-name $ECS_TASK_EXECUTION_ROLE --policy-arn $CLOUDWATCH_LOGS_POLICY_ARN
aws iam detach-role-policy --role-name $ECS_TASK_EXECUTION_ROLE --policy-arn $ECS_TASK_EXECUTION_POLICY_ARN
aws iam detach-role-policy --role-name $ECS_PROMETHEUS_TASK_ROLE --policy-arn $ECS_PROMETHEUS_TASK_POLICY_ARN

aws iam delete-policy --policy-arn $ECS_PROMETHEUS_TASK_POLICY_ARN

aws iam delete-role --role-name $ECS_GENERIC_TASK_ROLE
aws iam delete-role --role-name $ECS_TASK_EXECUTION_ROLE
aws iam delete-role --role-name $ECS_PROMETHEUS_TASK_ROLE
