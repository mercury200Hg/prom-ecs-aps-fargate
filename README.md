# prom-ecs-aps-fargate
This repository contains sample application which can be used as reference to deploy prometheus-collector agent in ECS (Fargate resource  Compatibility) with it's integration with AWS Prometheus service.

- I have used several references from different other sources to compile this repository mentioned below.
  - Blog: https://aws.amazon.com/blogs/opensource/metrics-collection-from-amazon-ecs-using-amazon-managed-service-for-prometheus/
  - Some scripts from Github: https://github.com/aws-samples/prometheus-for-ecs
  - Youtube Video: https://www.youtube.com/watch?v=Wk0h3aGtlUo

- For more details on how to use this project kindly refer - https://medium.com/


Follow the following steps -
1. Setup environment
  - ``` source set_env.sh ```
2. Launch Network - VPC, Subnets, SecurityGroup, InternetGateway, RouteTable, Routes
  - ``` source network-setup/networking-setup.sh ```
3. Create ECS cluster with fargate. Name should match with variable **`$ECS_CLUSTER_NAME`** from **`set_env.sh`**. For this check- https://www.youtube.com/watch?v=Wk0h3aGtlUo at time **3:13** to **3:41**
4. Create IAM policies to allow push metrics from ECS prometheus to AWS Managed PrometheusService
  - ``` source iam.sh ```
5. Create ServiceDiscovery Namespace and register your task defnition service into AWS CLOUDMAP.
  - ``` source cloudmap.sh ```
6. Create Workspace for AWS Managed Prometheus.
  - ``` source amp.sh ```
7. Execute either of 2 below:
  - Go to AWS Systems Manager > Parameter Store in Console (UI)
    - Create a new Parameter of type text **"ECS-ServiceDiscovery-Namespaces"** with value of variable **`$SERVICE_DISCOVERY_NAMESPACE`** from **`set_env.sh`**.
    - Create a new Parameter  of type text **"ECS-Prometheus-Configuration"** with **content of the "prometheus.yaml"** genereted on your local machine at step 5.
  - Alternatively execute  -
    - ``` source set_aws_system_params.sh ```
8. Create Task Definitions for your ECS. In case you wish to modify the same, do the changes to **webappTaskDefinition.json.template**. This is the place where you can replace your application definition and prometheus params like CPU/Memory
  - ``` source task-definitions.sh ```
8. Finally create services for your TaskDefinitions to launch them.
  - ``` source services.sh ```
9. If you have set **ECS_PROMETHEUS_PUBLIC_IP_ENABLED** to **ENABLED**, then visit it's running task details in ECS cluster to get the public IP.
   You shall be able to access prometheus on port **9090** with this on that IP.
