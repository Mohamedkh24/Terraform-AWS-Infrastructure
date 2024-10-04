# Terraform: AWS Infrastructure
This project contains Terraform code to automate the provisioning of AWS infrastructure. It helps to deploy and manage cloud resources such as VPCs, EC2 instances, S3 buckets, and more. The goal is to provide a scalable and easily configurable infrastructure using Infrastructure as Code (IaC).

## Project Overview

The **Terraform AWS Infrastructure** project helps automate the deployment of various AWS resources using Terraform. It allows you to define infrastructure in a declarative manner, making it easier to version, maintain, and replicate cloud environments.

## Features

1. **Remote s3 bucket for statefile.**
2. **DynamoDB State Locking.**
3. **Datasource to get the image id for ec2.**
4. **Provision a VPC with public and private subnets.**
5. **Launch EC2 instances in defined subnets.**
6. **Set up security groups with predefined rules.**
7. **Create Load Balancers.**


## VPC Resource Map
![Screenshot 2024-10-03 073037](https://github.com/user-attachments/assets/26331f6f-713b-4390-9abc-7dc29f0b0405)

 VPC: A Virtual Private Cloud with a 10.0.0.0/16 CIDR block.
 
 AZs: Two availability zones (AZs) to distribute resources.
 
 Subnets: Public and private subnets across AZs:

    Public Subnets: 10.0.0.0/24 and 10.0.2.0/24
   
    Private Subnets: 10.0.1.0/24 and 10.0.3.0/24

## EC2 Instances
- 4 EC2 instances:

    2 in public subnets with NGINX configured as a reverse proxy.
   
    2 in private subnets with HTTP services running and hosting a web pages.

## Load Balancers

1. **Network Load Balancer (NLB)** : handles incoming traffic and distributes it across the NGINX proxy servers in the public subnets.

 ![Screenshot 2024-10-03 073314](https://github.com/user-attachments/assets/3d4f8fe4-2dba-4320-9d7f-6802e2090a1b)

2. **Application Load Balancer (ALB)** : forwards traffic to the appropriate proxy server based on the application layer requests.
   
![Screenshot 2024-10-03 073251](https://github.com/user-attachments/assets/2ad9c737-fd91-4a06-a483-b8a4b8f34d63)


## Remote s3 bucket for the statefile (on "Dev" workspace)

![image](https://github.com/user-attachments/assets/c8ad8731-a207-48c3-a708-a8df58d05e68)


## State Locking 
Using DynamoDB for state locking to ensure safe collaboration and version control.

![image](https://github.com/user-attachments/assets/9644b6d9-e733-467c-8f34-d7beeda798ff)


## Accessing the Web pages using "DNS"

![Screenshot 2024-10-03 073439](https://github.com/user-attachments/assets/425b2760-7170-4d9e-bf76-ba7f45370f90)

![Screenshot 2024-10-03 073452](https://github.com/user-attachments/assets/af66f722-57a8-4e2a-8200-34c9eb16bae3)
