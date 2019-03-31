#!/bin/bash
set -e

APPNAME=aws-network
CODEBUCKET="bryanlabs-code"

# Upload CFT to S3.
aws s3 cp cloudformation.yml s3://$CODEBUCKET/cfts/$APPNAME.yml
