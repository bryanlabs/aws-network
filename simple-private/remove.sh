#!/bin/bash
set -x

NAME=aws-network
CODEBUCKET="bryanlabs-code"

export NAME CODEBUCKET 

aws cloudformation delete-stack --stack-name "$NAME"
