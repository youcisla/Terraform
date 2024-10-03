# Installation Documentation

## 1. Installing Terraform

### 1.1 Download Terraform

1. Visit the official Terraform [download page](https://www.terraform.io/downloads).
2. Download the appropriate version for your operating system (Windows, macOS, or Linux).

### 1.2 Install Terraform

- **On Windows**:
   1. Extract the downloaded `.zip` file.
   2. Move the extracted Terraform executable to a folder on your system, and add that folder to your PATH environment variable so Terraform can be accessed globally from the command line.
   3. Verify the installation by running the following command:
      ```bash
      terraform -v
      ```
- **On macOS/Linux**:
   1. On macOS, you can install Terraform using Homebrew:
      ```bash
      brew install terraform
      ```
   2. On Linux, download the package and extract it to a directory in your PATH (e.g., `/usr/local/bin`).
   3. Verify the installation by running:
      ```bash
      terraform -v
      ```

## 2. Setting up AWS Account

### 2.1 Create an AWS Account

1. Go to [AWS Free Tier](https://aws.amazon.com/free/) and sign up for an AWS account if you don’t already have one.
2. Follow the instructions to verify your identity and create your account.

### 2.2 Set Up IAM User

1. Log in to the AWS Management Console.
2. Navigate to **IAM** (Identity and Access Management).
3. Create a new user with programmatic access:
   - Click **Users** → **Add user**.
   - Choose a user name (e.g., `Youcef`).
   - Select **Programmatic access** to enable API access.
4. Attach the necessary policies:
   - Select **Attach existing policies directly**.
   - Search for and attach the `AmazonEC2FullAccess` policy to give this user full EC2 permissions.
5. Download the Access Key and Secret Key that are generated for this user.

## 3. Preparing Development Environment

### 3.1 Create Project Directory

1. Create a working directory where you will store your Terraform files:
   ```bash
   mkdir quest1
   cd quest1

### 3.2 Create Terraform Files
1. Inside the `quest1` directory, create a folder named `terraform`:
```
mkdir terraform
cd terraform
```
2. Create a `main.tf` file to store your Terraform configuration. Use the following example content:
```
provider "aws" {
  region     = "eu-west-3"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

resource "aws_instance" "example" {
  ami           = "ami-095aa7c9d1226e00b"
  instance_type = "t2.micro"
}
```
### 3.3 Secure Your AWS Keys

1. Create a `terraform.tfvars` file (in the same directory as `main.tf`) to securely store your AWS keys:
```
touch terraform.tfvars
```
2. Add your AWS credentials to this file:
```
aws_access_key = "your_access_key_id"
aws_secret_key = "your_secret_access_key"
```
3. Make sure to exclude this file from being committed to version control by adding it to `.gitignore`:
```
echo "terraform.tfvars" >> .gitignore
```
### 3.4 Initialize Terraform

1. In your terminal, navigate to the `terraform` directory:
```
cd quest1/terraform
```
2. Run the following command to initialize Terraform:
```
terraform init
```
## 4. Deploy Infrastructure

### 4.1 Plan Infrastructure

1. Once Terraform is initialized, run the following command to generate an execution plan:
```
terraform plan
```
### 4.2 Apply the Plan

1. To create the AWS resources (EC2 instance), apply the plan:
```
terraform apply
```
2. Confirm by typing `yes` when prompted.
### 4.3 Verify Resource Creation

1. Log in to the AWS Management Console.
2. Navigate to the EC2 Dashboard to see the newly created EC2 instance.
