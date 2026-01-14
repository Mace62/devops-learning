# AWS Application Load Balancer – Multi-AZ Public/Private Architecture

## 📌 Overview
This project demonstrates a **production-style AWS web architecture** using an **Application Load Balancer (ALB)** to securely serve traffic to **private EC2 instances** deployed across **multiple Availability Zones**.

The design follows AWS best practices:
- Public access terminates at the load balancer
- EC2 instances remain private
- Traffic is distributed across AZs
- Health checks ensure high availability
- No direct EC2 internet exposure

---

## 🧱 Architecture Summary

- **Region:** eu-west-2 (London)
- **VPC CIDR:** 10.0.0.0/16
- **Availability Zones:** eu-west-2a, eu-west-2b

### Architecture Pattern
```
Internet
│
Application Load Balancer (Public Subnets, Multi-AZ)
│
EC2 Instances (Private Subnets, Multi-AZ)
```

---

## 🛠️ AWS Services Used

- Amazon VPC
- Public and Private Subnets
- Internet Gateway (IGW)
- Application Load Balancer (ALB)
- Target Groups & Health Checks
- Amazon EC2
- Security Groups
- EC2 User Data (Bootstrapping)

---

## 🔧 Setup and Configuration

### 1️⃣ VPC
- Created a custom VPC with CIDR `10.0.0.0/16`
- DNS resolution and DNS hostnames enabled

📸 Screenshot: `screenshots/01-vpc.png`

---

### 2️⃣ EC2 Instances (Multi-AZ)
- Launched **two EC2 instances** in the same VPC
- Each instance placed in a **different Availability Zone**
- Instances run in **private subnets**
- No public IPv4 addresses assigned

📸 Screenshot: `screenshots/02-ec2-instances.png`

---

### 3️⃣ EC2 User Data (Web Server Automation)
- Used EC2 **user data** to automatically:
  - Install Apache (`httpd`)
  - Start the web server on boot
  - Serve unique HTML content per instance
- No SSH or manual configuration required

📸 Screenshot: `screenshots/03-user-data.png`

---

### 4️⃣ Application Load Balancer
- Created an **internet-facing ALB**
- Attached to **two public subnets** (one per AZ)
- Acts as the **single public entry point**

📸 Screenshot: `screenshots/04-application-load-balancer.png`

---

### 5️⃣ Target Group & Health Checks
- Target type: **EC2 instances**
- Protocol: HTTP (port 80)
- Health check path: `/`
- Both EC2 instances registered
- Health status verified as **Healthy**

📸 Screenshot: `screenshots/05-target-group.png`

---

### 6️⃣ Security Groups

#### ALB Security Group
- Inbound:
  - HTTP (80) from `0.0.0.0/0`
- Outbound:
  - All traffic allowed

📸 Screenshot: `screenshots/06-alb-security-group.png`

#### EC2 Security Group
- Inbound:
  - HTTP (80) **only from the ALB security group**
- Outbound:
  - All traffic allowed
- No SSH access
- No public CIDR rules

📸 Screenshot: `screenshots/07-ec2-security-group.png`

---

## 🧪 Testing & Verification

### Load Balancing Test
- Accessed the application via the **ALB DNS name**
- Refreshed the page multiple times
- Confirmed traffic alternates between EC2 instances
- Each instance returns unique content

📸 Screenshots:
- `screenshots/08-ec2-b.png`
- `screenshots/09-ec2-a.png`

---

## 🔐 Security Considerations

- EC2 instances have **no public IPs**
- All public traffic terminates at the ALB
- Security groups enforce **least-privilege access**
- EC2 instances only accept traffic from the ALB
- No SSH or administrative access exposed

---

## 💰 Cost Considerations

- Application Load Balancer incurs hourly cost while running
- EC2 instances are free-tier eligible (instance-type dependent)
- All resources should be deleted after testing to avoid charges

---

## ✅ Outcome

This project demonstrates:
- Secure VPC design using public and private subnets
- High availability with multi-AZ EC2 deployment
- Proper use of Application Load Balancers
- Health-based traffic routing
- Infrastructure automation using EC2 user data
- AWS security best practices

---

## 📂 Repository Structure

```
application-load-balancer/
├── README.md
└── screenshots/
  ├── 01-vpc.png
  ├── 02-ec2-instances.png
  ├── 03-user-data.png
  ├── 04-application-load-balancer.png
  ├── 05-target-group.png
  ├── 06-alb-security-group.png
  ├── 07-ec2-security-group.png
  ├── 08-ec2-b.png
  └── 09-ec2-a.png
```

---
