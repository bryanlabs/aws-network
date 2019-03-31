#!/bin/bash
set -e

NAME="aws-network"
CODEBUCKET="bryanlabs-code"

S3URL="https://s3-us-east-1.amazonaws.com"


VPC="10.0.0.0/16"
SubnetA="10.0.0.0/24"
SubnetB="10.0.1.0/24"
SubnetC="10.0.2.0/24"


# Set additional CLI Options, parameters...
OPTS="--parameters \
    ParameterKey=VPCCIDR,ParameterValue=$VPC \
    ParameterKey=SubnetACIDR,ParameterValue=$SubnetA \
    ParameterKey=SubnetBCIDR,ParameterValue=$SubnetB \
    ParameterKey=SubnetCCIDR,ParameterValue=$SubnetC"

export NAME CODEBUCKET S3URL VPC SubnetA SubnetB SubnetC OPTS

# Download template from Source
aws s3 cp s3://"$CODEBUCKET"/cfts/"$NAME".yml .

# Check File Size
SIZE=$(wc -c "$NAME".yml | cut -d ' ' -f1)

# Determine if create or update stack should be used.

if aws cloudformation describe-stacks --stack-name $NAME > /dev/null; then
    aws cloudformation update-stack --stack-name "$NAME" --template-url "$S3URL/$CODEBUCKET/cfts/$NAME".yml \
    --capabilities CAPABILITY_NAMED_IAM $OPTS
else
    aws cloudformation create-stack --stack-name "$NAME" --template-url "$S3URL/$CODEBUCKET/cfts/$NAME".yml \
    --capabilities CAPABILITY_NAMED_IAM $OPTS
fi

# Cleanup
rm -rf "$NAME".yml