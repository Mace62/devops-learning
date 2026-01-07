# AWS VPC Public–Private Architecture with Bastion Host

## 📌 Overview
This project demonstrates a secure AWS VPC architecture using:
- One **public subnet** with a **bastion (jump) EC2 instance**
- One **private subnet** with an internal EC2 instance
- Internet access via **Internet Gateway** and **NAT Gateway**
- Controlled access using **Security Groups**
- Verified access to private resources via the bastion host

---

## 🧱 Architecture
- **VPC CIDR:** `10.0.0.0/16`
- **Region:** eu-west-2
- **Availability Zone:** eu-west-2a

The architecture follows AWS best practices by isolating private resources while allowing controlled administrative access.

---

## 🛠️ Components Used
- Amazon VPC
- Public Subnet
- Private Subnet
- Internet Gateway (IGW)
- NAT Gateway with Elastic IP
- Route Tables
- EC2 (Public Bastion Host)
- EC2 (Private Instance)
- Security Groups

---

## 🔧 Setup and Configuration

### 1️⃣ VPC
- Created a custom VPC with CIDR `10.0.0.0/16`
- DNS resolution and DNS hostnames enabled

📸 Screenshot: `screenshots/01-vpc.png`

---

### 2️⃣ Subnets
- **Public Subnet:** `10.0.0.0/20`
- **Private Subnet:** `10.0.128.0/20`
- Public subnet configured to auto-assign public IPv4 addresses

📸 Screenshot: `screenshots/02-subnets.png`

---

### 3️⃣ Internet Gateway
- Created and attached an Internet Gateway to the VPC

📸 Screenshot: `screenshots/03-internet-gateway.png`

---

### 4️⃣ NAT Gateway
- Allocated an Elastic IP
- Created a public NAT Gateway in the public subnet
- Used for outbound internet access from private subnet

📸 Screenshot: `screenshots/04-nat-gateway.png`  
📸 Screenshot: `screenshots/04-nat-gateway-list.png`

---

### 5️⃣ Route Tables

#### Public Route Table
- Route: `0.0.0.0/0 → Internet Gateway`
- Associated with the public subnet

📸 Screenshot: `screenshots/05-public-route-table.png`

#### Private Route Table
- Route: `0.0.0.0/0 → NAT Gateway`
- Associated with the private subnet
- Includes an S3 VPC Gateway Endpoint for private S3 access

📸 Screenshot: `screenshots/06-private-route-table.png`

---

### 6️⃣ EC2 Instances

#### Public EC2 (Bastion Host)
- Launched in public subnet
- Public IPv4 address assigned
- Used as a bastion host for administrative access

📸 Screenshot: `screenshots/09-public-ec2.png`

#### Private EC2
- Launched in private subnet
- No public IPv4 address
- Accessible only from the bastion host

📸 Screenshot: `screenshots/10-private-ec2.png`

---

### 7️⃣ Security Groups

#### Public EC2 Security Group
- Inbound:
  - SSH (22) allowed **only from my public IP**
- Outbound:
  - All traffic allowed
- Mistake:
  - I didn't name the security group so it was left as default (launch-wizard-1) which made keeping track of it difficult

📸 Screenshot: `screenshots/11-public-sg.png`

#### Private EC2 Security Group
- Inbound:
  - SSH (22) allowed **only from the public EC2 security group**
- Outbound:
  - All traffic allowed

📸 Screenshot: `screenshots/12-private-sg.png`

---

### 8️⃣ Bastion Host Access Test
- Successfully connected to the private EC2 via the public EC2 using SSH ProxyCommand
- Verified private instance identity and internal IP address

📸 Screenshot: `screenshots/13-bastion-ssh.png`

---

## 🔐 Security Considerations
- Private EC2 has no public IP
- SSH access restricted using least-privilege security groups
- Bastion host pattern used for controlled access
- NAT Gateway used for outbound-only internet access from private subnet

---

## 💰 Cost Considerations
- NAT Gateway incurs hourly cost while running
- Resources should be deleted after testing to avoid charges
- EC2 instances can be stopped when not in use

---

## ✅ Outcome
This project successfully demonstrates:
- Secure network segmentation
- Controlled access to private resources
- Proper use of AWS networking components
- Best practices for VPC design and security

---

## 📂 Repository Structure
`
aws-vpc-networking/
├── README.md
├── screenshots/
│   ├── 01-vpc.png
│   ├── 02-subnets.png
│   ├── 03-internet-gateway.png
│   ├── 04-nat-gateway.png
│   ├── 04-nat-gateway-list.png
│   ├── 05-public-route-table.png
│   ├── 06-private-route-table.png
│   ├── 09-public-ec2.png
│   ├── 10-private-ec2.png
│   ├── 11-public-sg.png
│   ├── 12-private-sg.png
│   └── 13-bastion-ssh.png
`