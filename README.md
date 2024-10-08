# README: Terraform to Network Infrastructure Diagram

## Objective

The purpose of this task is to convert the provided Terraform code into a detailed network infrastructure diagram. This will visualize the infrastructure built using Terraform, including VPCs, subnets, instances, gateways, and security configurations.

## Prerequisites

1. **Knowledge of AWS** and basic networking concepts (VPC, Subnets, Internet Gateway, etc.).
2. **Familiarity with Terraform** to understand the structure and components of the code.
3. A valid **AWS Free Tier account** to deploy the infrastructure if needed.

## Files Included

The following files are provided for the task:
- **ec2.tf**: Contains the EC2 instance definitions.
- **vpc.tf**: Contains the VPC and networking setup.
- **main.tf**: Contains the main configurations.
- **installation.md**: Instructions on how to install and set up Terraform.
- **usage.md**: Instructions on how to use the Terraform code.
- **outputs.md**: Lists the outputs of the Terraform code.
- **quest1Etape1.md**: Questions and answers related to the first stage.
- **quest1Etape2.md**: Questions and answers related to the second stage.
- **quest1Etape3.md**: Questions and answers related to the third stage.
- **quest1Etape4.md**: Questions and answers related to the fourth stage.

## Requirements

The project is divided into four stages. Each stage has specific infrastructure requirements that need to be included in the network diagram.

### Stage 1: Setup of Terraform and AWS Registration

1. **Install Terraform** following the steps in `installation.md`.
   
2. **Create an AWS account**:
   - Use the **Free Tier**.
   - Create an **IAM user** with administrator access and generate access keys.
   - **Important**: Do not hardcode the access keys in the Terraform code.

3. **Directory Structure**:
   - `terraform/`: Store the Terraform code.
   - `questions_de_cours/`: Include answers to these questions:
     - What is Infrastructure as Code?
     - What is Terraform used for?
     - What is a Terraform provider?
   - `documentation/`: Document installation and usage instructions.

### Stage 2: VPC Infrastructure Creation with Terraform

1. **VPC Creation**:
   - Create a **VPC** with a range of `192.168.0.0/16`.
   - Attach an **Internet Gateway** to the VPC.

2. **Subnet Creation**:
   - Create a **/24 subnet** in availability zone `eu-west-3a`, named `internal`.

3. **Routing Configuration**:
   - Set up a **Route Table** to route traffic through the Internet Gateway.
   - Associate the **Route Table** with the subnet.

4. **Network ACL**:
   - Create an **ACL** for the VPC allowing:
     - **Port 22** (SSH) from `0.0.0.0/0` for inbound.
     - All traffic for outbound.

5. **Diagram Requirements**:
   - Include the **VPC**, **subnet**, **Internet Gateway**, **Route Table**, **ACL**, and **instances** (reverse_proxy, backend, database).

### Stage 3: EC2 Instances Creation with Terraform

1. **Generate SSH Key**:
   - Use an **RSA SSH key** (`deploy_idrsa`) for accessing the EC2 instances.

2. **Create EC2 Instances**:
   - **Reverse Proxy**:
     - **AMI**: `ami-0314c062c813a4aa0`
     - **Instance Type**: t2.micro
     - **Security Group**: Allows all traffic.
     - **Public IP Address**: Enabled.
   - **Backend and Database**:
     - **AMI**: `ami-0314c062c813a4aa0`
     - **Instance Type**: t2.micro
     - No public IP addresses.
     - Properly configure network and security group.

3. **Root Block Device**:
   - Minimum size: **8GB**.
   - Type: **General Purpose SSD (gp2)**.

4. **Diagram Requirements**:
   - Include **reverse_proxy**, **backend**, and **database** instances with network settings, IPs, and security groups.

### Stage 4: Infrastructure Deployment with Terraform

1. **Terraform Commands**:
   - Understand and document the use of:
     - `terraform apply`: Deploy the infrastructure.
     - `terraform destroy`: Remove the infrastructure.
     - `terraform plan`: Preview changes.
   
2. **Diagram Requirements**:
   - Use the Terraform outputs to include public IPs, security groups, and network configurations in the diagram.

3. **Important**:
   - After completing the task, **destroy the infrastructure** to avoid unnecessary costs.

## Instructions for the Network Diagram

1. **Infrastructure Overview**:
   - The diagram should include all networking components like **VPCs**, **subnets**, **Internet Gateway**, **Route Tables**, **ACLs**, and **Security Groups**.
   - Represent all **EC2 instances** (reverse_proxy, backend, database) with their associated IP addresses and network connections.

2. **File Outputs**:
   - Use the information from `outputs.md` and the Terraform code to determine public and private IP addresses, subnet associations, and security group rules.

3. **Software Tools**:
   - You can use diagramming tools like **Lucidchart**, **Draw.io**, or any similar tools to create the diagram.
