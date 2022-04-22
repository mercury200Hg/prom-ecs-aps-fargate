## Cleanup of this installation
- Assuming you are running the cleanup not in the same session and doesn't have the variables loaded

1. Source the ENV
  - ``` source set_env.sh ```
1. Clean ECS Services
  - ``` source cleanup/cleanup-ecs.sh ```
2. Clean ECS Task Definitions.
  - ``` This has to be done manually by going to ECS cluster TaskDefinitions and de-registering them ```
3. Cleanup AWS CloudMap
  - ```  source cleanup/cleanup-cloudmap.sh ```
4. Cleanup IAM
  - ``` source cleanup/cleanup-iam.sh ```
5. Cleanup the Network
  - ``` source cleanup/cleanup-network.sh ```
