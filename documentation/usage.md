# Usage Documentation

## 1. Running Terraform to Manage AWS Resources

### Initializing the Terraform Project

- Before making any changes or deploying infrastructure, you must initialize Terraform:
```
  terraform init
```
This will download the necessary provider plugins (like AWS) and prepare your working directory.

### Creating AWS Infrastructure

- To apply the Terraform plan and create resources (such as EC2 instances), run:
```
terraform apply
```
- Terraform will show a plan of what it will create, and you need to confirm by typing `yes` when prompted. Example of the command output:
```
Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
Only 'yes' will be accepted to approve.

Enter a value: yes
```
- Terraform will then create the AWS infrastructure (e.g., EC2 instance) as defined in your `main.tf` file.

### Verifying Infrastructure Creation

1. After Terraform completes the creation, you can verify your resources by logging into the AWS Management Console.
2. Navigate to the EC2 Dashboard where you can see the EC2 instance that was created by Terraform.
    - You will find information such as the instance ID, public IP address, and instance state (running).

### Destroying AWS Infrastructure

- If you no longer need the resources you created and want to avoid charges, you can destroy them using:
```
terraform destroy
```
- Terraform will show a plan of what it will destroy. Confirm by typing `yes` when prompted:
```
Plan: 1 to destroy, 0 to change, 0 to add.

Do you really want to destroy all resources?
Only 'yes' will be accepted to approve.

Enter a value: yes
```
This command will delete all the resources that were created by Terraform.

## 2. Accessing AWS Resources

### Connecting to an EC2 Instance (Optional)

- If your Terraform configuration included creating an EC2 instance and you need to connect to it, you can do so via SSH.
1. Ensure you have the key pair used to create the instance (if applicable).
2. Use the public IP or DNS provided by AWS to connect to the instance:
```
ssh -i /path/to/your/key.pem ec2-user@<instance-public-ip>
```
- Replace `/path/to/your/key.pem` with the actual path to your SSH key.
- Replace `<instance-public-ip>` with the actual public IP of the EC2 instance (this can be found in the EC2 Dashboard).

### Example

```
ssh -i /Users/username/Downloads/my-key.pem ec2-user@3.112.155.124
```
Once connected, you will have access to the EC2 instance.

## 3. Updating Infrastructure with Terraform

### Modifying the Configuration

- If you need to update your infrastructure, you can edit the `main.tf` file to add or change resources.

### Applying Updates

- After modifying your configuration, run the following command to apply the changes:
```
terraform apply
```
Terraform will provide a plan of what will be updated, created, or destroyed. Type yes to confirm the changes.

### Example Update

If you add a new resource (like another EC2 instance), Terraform will show a plan for adding that resource. Run:
```
terraform apply
```

## 4. Working with Terraform State

- Terraform uses a file called `terraform.tfstate` to keep track of your infrastructure. This file should be version controlled if you're working in a team or using remote backends.

- Make sure not to delete or manually edit the `terraform.tfstate` file.