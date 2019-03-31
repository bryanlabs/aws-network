# aws-network
**aws-network** - Simple Private Network stack.

Quickly deploy a small private network inside AWS.

------------
FEATURES
------------
* 1 VPC  
* 3 subnets  
* Parameters  
* Named Outputs

------------
Deploy
------------
Create an S3 bucket to store code. (EG: org-code)  
Update deploy.sh with subnets and code bucket  

````
./build.sh
./deploy.sh
````

Diagram: 
![alt text][logo]

[logo]: simple-private.png "Simple Private Network"