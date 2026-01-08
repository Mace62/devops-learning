# AWS Learning

This repository contains hands-on AWS projects created as part of my learning in cloud computing and DevOps fundamentals.

Each project focuses on core AWS concepts and is documented with explanations and screenshots within its own folder.

---

## 📌 Projects

### VPC Networking
This project explores the fundamentals of AWS networking by designing and implementing a secure Virtual Private Cloud (VPC) architecture.

Key concepts covered include:
- Public and private subnets
- Internet Gateway and NAT Gateway
- Route tables and traffic flow
- EC2 instances in public and private subnets
- Bastion host access to private resources
- Security group configuration using least-privilege principles

Full setup details, screenshots, and explanations can be found in the `vpc-networking` directory.

---

## Application Load Balancer Networking

This project demonstrates a **secure, highly available AWS web architecture** using an **Application Load Balancer (ALB)** to route internet traffic to **private EC2 instances** deployed across multiple Availability Zones.

The design follows AWS best practices by terminating public access at the load balancer while keeping compute resources isolated within private subnets.

### Key concepts covered

- Application Load Balancer (ALB) configuration
- Public and private subnet design
- Multi–Availability Zone deployment for high availability
- EC2 instance bootstrapping using user data
- Target groups and health check configuration
- Security group design using least-privilege access
- Preventing direct public access to EC2 instances
- End-to-end traffic validation via ALB DNS name

Full setup details, screenshots, and architectural explanations can be found in the **`application-load-balancer`** directory.
