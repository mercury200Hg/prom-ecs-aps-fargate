aws cloudformation create-stack --stack-name $NETWORK_STACK_NAME \
    --template-body file://setup-networking.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --region ${AWS_REGION}

echo "Waiting for 180 seconds for the operation to complete"
sleep 180;

# Export the vpc id
export VPC_ID=$(aws cloudformation describe-stacks \
    --stack-name $NETWORK_STACK_NAME \
    --query "Stacks[0].Outputs[?OutputKey=='VPCId'].OutputValue" \
    --output text)


# Export the subnet id
export PRIVATE_SUBNET_IDS=$(aws cloudformation describe-stacks \
    --stack-name $NETWORK_STACK_NAME \
    --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet1'].OutputValue" \
    --output text)

# Export security group id
export SECURITY_GROUP_ID=$(aws cloudformation describe-stacks \
    --stack-name $NETWORK_STACK_NAME \
    --query "Stacks[0].Outputs[?OutputKey=='PublicSecurityGroup'].OutputValue" \
    --output text)
