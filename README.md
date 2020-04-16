# AWS 

## container definitions
* if `essential` = true than if the current container crashes, the other containers stop too. at least one container must have `essential` to true.  
* hostname parameters is used to reach container. is optional if the container don't need to be accessed.

## Elastic BeansTalk
* docker
* multi docker plateform

## Managed Services
* Redis: AWS Elastic Cache
* Postgres: AWS RDS

## Setup AWS VPC and Security group
* allow any incoming traffic on port 80 from any IP
* allow any traffic from any other AWS service that has the same security group
* create security group to allow comm between all instances in same SG (including ports)
* assign the security group to each instance

## IAM
Add sufficient permissions to user (full beanstalk permissions)