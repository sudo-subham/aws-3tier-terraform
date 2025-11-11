Terraform AWS 3-Tier Architecture

A real-world cloud infrastructure built automatically with Terraform — showing how to deploy a complete VPC, web layer, and database layer.

🏗️ Architecture Overview

You built a classic 3-tier setup:

Internet layer → Application Load Balancer (public)

App layer → Auto Scaling EC2 instances (private)

DB layer → RDS MySQL (private)

Traffic flow:

Internet → ALB → EC2 (ASG) → RDS

⚙️ Components You Deployed

1️⃣ Network Layer

Custom VPC

Two public + two private subnets across AZs

Internet Gateway & NAT Gateway

Route tables for proper traffic routing

2️⃣ Application Layer

Launch Template defining EC2 configuration (AMI, key, user-data)

Auto Scaling Group in private subnets

Application Load Balancer in public subnets

Security groups for ALB and EC2

3️⃣ Database Layer

RDS MySQL instance

Subnet group using private subnets

Security group that only allows traffic from the app layer

Final Architecture (Simplified View)
```
                    Internet
                        │
             ┌────────────────────┐
             │ Application Load    │
             │ Balancer (Public)   │
             └────────────────────┘
                        │
        ┌───────────────┴────────────────┐
        │                                │
  EC2 Instance (Private 1)        EC2 Instance (Private 2)
  (Web/App Server)                (Web/App Server)
                        │
                        ▼
             ┌────────────────────┐
             │  RDS MySQL DB      │
             │ (Private Subnet)   │
             └────────────────────┘
```

📁 File Breakdown

provider.tf → AWS provider setup

variables.tf → Declares input variables

vpc.tf → Creates VPC, subnets, NAT, and routes

security_iam.tf → Security groups and IAM roles

alb_asg.tf → Launch Template, ALB, and ASG

rds.tf → RDS and DB subnet group

outputs.tf → Prints DNS names, endpoints, and IDs

terraform.tfvars → Stores your region, key name, passwords, AMI, etc.

data.tf → Dynamically fetches the latest Amazon Linux 2 AMI

🧩 Prerequisites

AWS account and IAM credentials configured with aws configure

Terraform installed (v1.4+)

Existing AWS key pair

IAM permissions for EC2, VPC, and RDS

🧩 Terraform Lifecycle You Performed

terraform init → initialized provider plugins

terraform plan → previewed what AWS resources would be created

terraform apply -auto-approve → deployed everything

terraform destroy -auto-approve → cleaned up resources when done

🚀 Steps You Performed

Initialized Terraform → downloaded provider plugins

Validated configuration → checked syntax

Planned → previewed all AWS resources to be created

Applied → deployed full infrastructure automatically

Accessed → ALB DNS in browser to view app output

Connected → to RDS endpoint via MySQL

Destroyed → infrastructure when done to save cost

🧾 Example Outputs

ALB DNS name → link to web app

RDS endpoint → database connection

VPC ID, public and private subnet IDs

<img width="1329" height="533" alt="image" src="https://github.com/user-attachments/assets/3e2affbb-be6a-44a1-83f5-dfa48f8386b6" />


🌐 How to Access

Visit the ALB DNS output (something like terraform-3tier-alb-xxxx.elb.amazonaws.com)
You’ll see:

“Hello from Terraform EC2”

🧹 Cleanup

To remove all AWS resources:

terraform destroy -auto-approve

🧠 Key Skills Demonstrated

Infrastructure as Code (IaC)

AWS networking concepts (VPC, subnets, routing)

Load balancing and auto scaling

Secure database architecture

Terraform variables, outputs, and dependency management

Full lifecycle automation (build → test → destroy)

👨‍💻 Author

Shubham Pathak
DevOps | Cloud | Terraform | AWS Enthusiast
