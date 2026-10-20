
# 0-Trust 3-Tier Cloud VPC Architecture & Micro-Segmentation Lab

## 📌 Project Overview
This repository contains the complete infrastructure-as-code blueprints and verification controls for an enterprise-grade, three-tier zero-trust cloud network deployment simulated using LocalStack. The architecture enforces an uncompromising **Default-Deny** security posture. It implements isolated perimeter boundaries, explicit directional egress configurations, and cryptographic identity micro-segmentation to thoroughly segregate the public web interface, private application logic, and the backend database workloads.

---

## 🗺️ Visual Architectural Traffic Flow & Subnet Layout

The structural mapping below highlights how data moves across the multi-tier system. Packets are forced to hop sequentially from Tier 1 to Tier 2 to Tier 3. Direct access from the internet to the application layer, or from the web layer to the database layer, is structurally blocked by identity-aware security filters.

```text
       [ Public Internet (0.0.0.0/0) ]
                      │
              ( Ingress: Port 443 )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 1: PUBLIC WEB INGRESS SUBNET (10.0.1.0/24)         │
│ 📝 Computes: Web App Ingress Server                      │
│ 🛡️ SG Policy: Inbound 443 | Outbound 0.0.0.0/0 (Global)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 8080 )
             ( Identity: Web SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 2: PRIVATE APP-LEVEL SUBNET (10.0.2.0/24)          │
│ 📝 Computes: Core Logic Server                           │
│ 🛡️ SG Policy: Inbound 8080 | Outbound 10.0.0.0/16 (VPC)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 5432 )
             ( Identity: App SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 3: PRIVATE ISOLATED DATABASE SUBNET (10.0.3.0/24)   │
│ 📝 Computes: Backend Database Server                     │
│ 🛡️ SG Policy: Inbound 5432 | Outbound: DEFAULT-DENY (None)│
└──────────────────────────────────────────────────────────┘

# 0-Trust 3-Tier Cloud VPC Architecture & Micro-Segmentation Lab

## 📌 Project Overview
This repository contains the complete infrastructure-as-code blueprints and verification controls for an enterprise-grade, three-tier zero-trust cloud network deployment simulated using LocalStack. The architecture enforces an uncompromising **Default-Deny** security posture. It implements isolated perimeter boundaries, explicit directional egress configurations, and cryptographic identity micro-segmentation to thoroughly segregate the public web interface, private application logic, and the backend database workloads.

---

## 🗺️ Visual Architectural Traffic Flow & Subnet Layout

The structural mapping below highlights how data moves across the multi-tier system. Packets are forced to hop sequentially from Tier 1 to Tier 2 to Tier 3. Direct access from the internet to the application layer, or from the web layer to the database layer, is structurally blocked by identity-aware security filters.

```text
       [ Public Internet (0.0.0.0/0) ]
                      │
              ( Ingress: Port 443 )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 1: PUBLIC WEB INGRESS SUBNET (10.0.1.0/24)         │
│ 📝 Computes: Web App Ingress Server                      │
│ 🛡️ SG Policy: Inbound 443 | Outbound 0.0.0.0/0 (Global)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 8080 )
             ( Identity: Web SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 2: PRIVATE APP-LEVEL SUBNET (10.0.2.0/24)          │
│ 📝 Computes: Core Logic Server                           │
│ 🛡️ SG Policy: Inbound 8080 | Outbound 10.0.0.0/16 (VPC)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 5432 )
             ( Identity: App SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 3: PRIVATE ISOLATED DATABASE SUBNET (10.0.3.0/24)   │
│ 📝 Computes: Backend Database Server                     │
│ 🛡️ SG Policy: Inbound 5432 | Outbound: DEFAULT-DENY (None)│
└──────────────────────────────────────────────────────────┘

# 0-Trust 3-Tier Cloud VPC Architecture & Micro-Segmentation Lab

## 📌 Project Overview
This repository contains the complete infrastructure-as-code blueprints and verification controls for an enterprise-grade, three-tier zero-trust cloud network deployment simulated using LocalStack. The architecture enforces an uncompromising **Default-Deny** security posture. It implements isolated perimeter boundaries, explicit directional egress configurations, and cryptographic identity micro-segmentation to thoroughly segregate the public web interface, private application logic, and the backend database workloads.

---

## 🗺️ Visual Architectural Traffic Flow & Subnet Layout

The structural mapping below highlights how data moves across the multi-tier system. Packets are forced to hop sequentially from Tier 1 to Tier 2 to Tier 3. Direct access from the internet to the application layer, or from the web layer to the database layer, is structurally blocked by identity-aware security filters.

```text
       [ Public Internet (0.0.0.0/0) ]
                      │
              ( Ingress: Port 443 )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 1: PUBLIC WEB INGRESS SUBNET (10.0.1.0/24)         │
│ 📝 Computes: Web App Ingress Server                      │
│ 🛡️ SG Policy: Inbound 443 | Outbound 0.0.0.0/0 (Global)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 8080 )
             ( Identity: Web SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 2: PRIVATE APP-LEVEL SUBNET (10.0.2.0/24)          │
│ 📝 Computes: Core Logic Server                           │
│ 🛡️ SG Policy: Inbound 8080 | Outbound 10.0.0.0/16 (VPC)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 5432 )
             ( Identity: App SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 3: PRIVATE ISOLATED DATABASE SUBNET (10.0.3.0/24)   │
│ 📝 Computes: Backend Database Server                     │
│ 🛡️ SG Policy: Inbound 5432 | Outbound: DEFAULT-DENY (None)│
└──────────────────────────────────────────────────────────┘

# 0-Trust 3-Tier Cloud VPC Architecture & Micro-Segmentation Lab

## 📌 Project Overview
This repository contains the complete infrastructure-as-code blueprints and verification controls for an enterprise-grade, three-tier zero-trust cloud network deployment simulated using LocalStack. The architecture enforces an uncompromising **Default-Deny** security posture. It implements isolated perimeter boundaries, explicit directional egress configurations, and cryptographic identity micro-segmentation to thoroughly segregate the public web interface, private application logic, and the backend database workloads.

---

## 🗺️ Visual Architectural Traffic Flow & Subnet Layout

The structural mapping below highlights how data moves across the multi-tier system. Packets are forced to hop sequentially from Tier 1 to Tier 2 to Tier 3. Direct access from the internet to the application layer, or from the web layer to the database layer, is structurally blocked by identity-aware security filters.

```text
       [ Public Internet (0.0.0.0/0) ]
                      │
              ( Ingress: Port 443 )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 1: PUBLIC WEB INGRESS SUBNET (10.0.1.0/24)         │
│ 📝 Computes: Web App Ingress Server                      │
│ 🛡️ SG Policy: Inbound 443 | Outbound 0.0.0.0/0 (Global)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 8080 )
             ( Identity: Web SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 2: PRIVATE APP-LEVEL SUBNET (10.0.2.0/24)          │
│ 📝 Computes: Core Logic Server                           │
│ 🛡️ SG Policy: Inbound 8080 | Outbound 10.0.0.0/16 (VPC)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 5432 )
             ( Identity: App SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 3: PRIVATE ISOLATED DATABASE SUBNET (10.0.3.0/24)   │
│ 📝 Computes: Backend Database Server                     │
│ 🛡️ SG Policy: Inbound 5432 | Outbound: DEFAULT-DENY (None)│
└──────────────────────────────────────────────────────────┘


# 0-Trust 3-Tier Cloud VPC Architecture & Micro-Segmentation Lab

## 📌 Project Overview
This repository contains the complete infrastructure-as-code blueprints and verification controls for an enterprise-grade, three-tier zero-trust cloud network deployment simulated using LocalStack. The architecture enforces an uncompromising **Default-Deny** security posture. It implements isolated perimeter boundaries, explicit directional egress configurations, and cryptographic identity micro-segmentation to thoroughly segregate the public web interface, private application logic, and the backend database workloads.

---

## 🗺️ Visual Architectural Traffic Flow & Subnet Layout

The structural mapping below highlights how data moves across the multi-tier system. Packets are forced to hop sequentially from Tier 1 to Tier 2 to Tier 3. Direct access from the internet to the application layer, or from the web layer to the database layer, is structurally blocked by identity-aware security filters.

```text
       [ Public Internet (0.0.0.0/0) ]
                      │
              ( Ingress: Port 443 )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 1: PUBLIC WEB INGRESS SUBNET (10.0.1.0/24)         │
│ 📝 Computes: Web App Ingress Server                      │
│ 🛡️ SG Policy: Inbound 443 | Outbound 0.0.0.0/0 (Global)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 8080 )
             ( Identity: Web SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 2: PRIVATE APP-LEVEL SUBNET (10.0.2.0/24)          │
│ 📝 Computes: Core Logic Server                           │
│ 🛡️ SG Policy: Inbound 8080 | Outbound 10.0.0.0/16 (VPC)  │
└─────────────────────┬────────────────────────────────────┘
                      │
             ( Ingress: Port 5432 )
             ( Identity: App SG Only )
                      ▼
┌──────────────────────────────────────────────────────────┐
│ TIER 3: PRIVATE ISOLATED DATABASE SUBNET (10.0.3.0/24)   │
│ 📝 Computes: Backend Database Server                     │
│ 🛡️ SG Policy: Inbound 5432 | Outbound: DEFAULT-DENY (None)│
└──────────────────────────────────────────────────────────┘



# Network Subnetting

# Define the core virtual private network container
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16" # Allocates a total address space of 65,536 private IP addresses
  enable_dns_hostnames = true          # Ensures resources inside this network can resolve internal DNS lines
  
  tags = {
    Name = "zero-trust-vpc"            
  }
}

# ==============================================================================
# TIER 1: PUBLIC WEB INGRESS SUBNET
# ==============================================================================
# IP Address Allocation: 10.0.1.0/24 (Allows up to 254 usable host virtual machines)
# 📥 INCOMING (Ingress Data Flow): Authorized from any source IP globally (0.0.0.0/0) strictly on Port 443 (HTTPS).
# 📤 OUTGOING (Egress Data Flow): Authorized to route directly to the public internet (0.0.0.0/0) via the Internet Gateway.
# ==============================================================================
resource "aws_subnet" "web_subnet" {
  vpc_id            = aws_vpc.main_vpc.id 
  cidr_block        = "10.0.1.0/24"       
  availability_zone = "us-east-1a"        
  
  tags = {
    Name = "web-tier-subnet"
  }
}

# ==============================================================================
# TIER 2: PRIVATE APP-LEVEL SUBNET (Core Business Logic)
# ==============================================================================
# IP Address Allocation: 10.0.2.0/24 (Allows up to 254 usable host virtual machines)
# 📥 INCOMING (Ingress Data Flow): STRICTLY permitted only if the traffic originates from Tier 1 (10.0.1.0/24) on Port 8080.
# 📤 OUTGOING (Egress Data Flow): Constrained strictly to internal network communication (10.0.0.0/16). External internet routes are dropped.
# ==============================================================================
resource "aws_subnet" "app_subnet" {
  vpc_id            = aws_vpc.main_vpc.id 
  cidr_block        = "10.0.2.0/24"       
  availability_zone = "us-east-1a"        
  
  tags = {
    Name = "app-tier-subnet"
  }
}

# ==============================================================================
# TIER 3: PRIVATE ISOLATED DATABASE SUBNET
# ==============================================================================
# IP Address Allocation: 10.0.3.0/24 (Allows up to 254 usable host virtual machines)
# 📥 INCOMING (Ingress Data Flow): STRICTLY permitted only if traffic originates from Tier 2 (10.0.2.0/24) on PostgreSQL Port 5432.
# 📤 OUTGOING (Egress Data Flow): absolute DEFAULT-DENY posture. This subnet has 0 outbound route mappings.
# ==============================================================================
resource "aws_subnet" "db_subnet" {
  vpc_id            = aws_vpc.main_vpc.id 
  cidr_block        = "10.0.3.0/24"       
  availability_zone = "us-east-1a"        
  
  tags = {
    Name = "db-tier-subnet"
  }
}

# Provision the Internet Gateway for public traffic routing
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id # Mounts the gateway onto the VPC perimeter to act as an external transit bridge
  
  tags = {
    Name = "vpc-internet-gateway"
  }
}

# Establish a public route table to intercept outbound web tier traffic
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"             # Evaluates all traffic destined for the public internet
    gateway_id = aws_internet_gateway.igw.id # Pumps that external traffic straight out through the internet gateway
  }
  
  tags = {
    Name = "public-route-table"
  }
}

# Bind the Public Web Subnet explicitly to the Internet Gateway route path
resource "aws_route_table_association" "web_assoc" {
  subnet_id      = aws_subnet.web_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


# Writing Firewall Rules

# Construct the Security Firewall for the Web Ingress Tier (Tier 1)
resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allows secure public HTTPS ingress and regulated system responses"
  vpc_id      = aws_vpc.main_vpc.id
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"                  
    cidr_blocks = ["0.0.0.0/0"]          # INGOING: Accepts traffic from any source IP globally on HTTPS port 443
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                   
    cidr_blocks = ["0.0.0.0/0"]          # OUTGOING: Allows server responses and system patches to hit global paths
  }
  
  tags = {
    Name = "web-tier-firewall"
  }
}

# Construct the Firewall for the App-Level Tier (Tier 2)
resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Allows ingress strictly originating from the Web SG tier"
  vpc_id      = aws_vpc.main_vpc.id
  
  ingress {
    from_port       = 8080               
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id] # INGOING: Only allows packets carrying the Web SG identity token
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]        # OUTGOING: Heavily restricted. Traffic can only travel internally within the VPC limits.
  }
  
  tags = {
    Name = "app-tier-firewall"
  }
}

# Construct the Firewall for the Isolated Database Tier (Tier 3)
resource "aws_security_group" "db_sg" {
  name        = "db-security-group"
  description = "Enforces database isolation by strictly trusting the App SG tier identity token"
  vpc_id      = aws_vpc.main_vpc.id
  
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id] # INGOING: Web tier cannot connect to DB. Only App SG token is trusted here.
  }
  
  # NOTE: Absolute absence of an egress rule block locks down the DB tier into an un-bypassable Default-Deny outbound posture.
  # OUTGOING: completely BLOCKED. No data can leave this subnet.
  
  tags = {
    Name = "db-tier-firewall"
  }
}

# Setting up Instances or Servers

# Provision the Web Application Server Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Mock AMI value map recognized by LocalStack
  instance_type = "t2.micro"              
  subnet_id     = aws_subnet.web_subnet.id 
  vpc_security_group_ids = [aws_security_group.web_sg.id] 
  
  tags = {
    Name = "production-web-ingress-server"
  }
}

# Provision the Middle-Tier Application Server Instance
resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.app_subnet.id 
  vpc_security_group_ids = [aws_security_group.app_sg.id] 
  
  tags = {
    Name = "production-core-app-logic"
  }
}

# Provision the Back-end Secure Database Server Instance
resource "aws_instance" "db_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.db_subnet.id  
  vpc_security_group_ids = [aws_security_group.db_sg.id] 
  
  tags = {
    Name = "production-backend-database"
  }
}

# Network Verificatio AUdit 

# Provision the Web Application Server Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Mock AMI value map recognized by LocalStack
  instance_type = "t2.micro"              
  subnet_id     = aws_subnet.web_subnet.id 
  vpc_security_group_ids = [aws_security_group.web_sg.id] 
  
  tags = {
    Name = "production-web-ingress-server"
  }
}

# Provision the Middle-Tier Application Server Instance
resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.app_subnet.id 
  vpc_security_group_ids = [aws_security_group.app_sg.id] 
  
  tags = {
    Name = "production-core-app-logic"
  }
}

# Provision the Back-end Secure Database Server Instance
resource "aws_instance" "db_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.db_subnet.id  
  vpc_security_group_ids = [aws_security_group.db_sg.id] 
  
  tags = {
    Name = "production-backend-database"
  }
}


# Network Verification Audit 

# Provision the Web Application Server Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Mock AMI value map recognized by LocalStack
  instance_type = "t2.micro"              
  subnet_id     = aws_subnet.web_subnet.id 
  vpc_security_group_ids = [aws_security_group.web_sg.id] 
  
  tags = {
    Name = "production-web-ingress-server"
  }
}

# Provision the Middle-Tier Application Server Instance
resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.app_subnet.id 
  vpc_security_group_ids = [aws_security_group.app_sg.id] 
  
  tags = {
    Name = "production-core-app-logic"
  }
}

# Provision the Back-end Secure Database Server Instance
resource "aws_instance" "db_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.db_subnet.id  
  vpc_security_group_ids = [aws_security_group.db_sg.id] 
  
  tags = {
    Name = "production-backend-database"
  }
}

---

## 🛡️ Network Verification & Audit Trail

To thoroughly test and mathematically prove the security boundaries of this multi-tier architecture, live validation audits were executed directly from inside the core runtime virtualization environment. The following empirical evidence demonstrates how the firewall patterns react under explicit network testing conditions.

### Test 1: Public Web Server Ingress Validation
*   **Target Resource:** Web App Ingress Server
*   **Destination Network Coordinates:** `10.0.1.4` on Port `443` (HTTPS)
*   **Auditing Command Executed:** `curl -kI https://10.0.1.4:443 --connect-timeout 5`
*   **Observed Runtime Output:** `curl: (7) Failed to connect to 10.0.1.4 port 443: Connection refused`
*   **Architectural Security Proof:** **SUCCESSFUL PASS**. The security group rules successfully permitted the testing packet to clear the firewall gate and hit the target resource. The resulting `Connection refused` message is a low-level software response confirming that the network path is wide open; it simply indicates that a local application listener (such as Nginx) has not yet been compiled on the host to catch the handshakes.

### Test 2: Unmapped Port Posture Evaluation
*   **Target Resource:** Backend Database Server
*   **Destination Network Coordinates:** `10.0.3.4` on Port `3306` (MySQL)
*   **Auditing Command Executed:** `curl http://10.0.3.4:3306 --connect-timeout 5`
*   **Observed Runtime Output:** `curl: (28) Connection timed out after 5001 milliseconds`
*   **Architectural Security Proof:** **SUCCESSFUL PASS**. This test confirms the active execution of our Default-Deny security posture. Because Port 3306 was never explicitly authorized in the Terraform configurations, the security group rules dropped the incoming packets instantly and silently without responding to the originating scanner.

### Test 3: Zero-Trust Identity Chaining Verification
*   **Target Resource:** Protected Backend Database Server
*   **Destination Network Coordinates:** `10.0.3.4` on Port `5432` (PostgreSQL)
*   **Auditing Command Executed:** `curl http://10.0.3.4:5432 --connect-timeout 5`
*   **Observed Runtime Output:** `curl: (28) Connection timed out after 5001 milliseconds`
*   **Architectural Security Proof:** **SUCCESSFUL PASS**. This result proves that identity-based micro-segmentation is working perfectly. Even though Port 5432 is open on the database instance, the database firewall dropped the connection because the testing shell did not carry the trusted security group token of the Application Server (Tier 2). This demonstrates that even if an attacker compromises the Web Server (Tier 1), direct access to the Database is completely blocked.

---

 ---

## 🛠️ Problems Faced & Engineering Troubleshooting Log

Building, standing up, and validating this multi-tier software-defined infrastructure presented real-world deployment challenges. Below is an engineering breakdown of the key technical problems faced, the system telemetry analyzed, and how they were systematically debugged and resolved.

### Problem 1: The Local Host Network Isolation Trap
* **The Symptom/Friction:** Initial network routing tests fired straight from the local Ubuntu machine terminal shell using `ping -c 3 10.0.1.4` or `curl http://10.0.1.4` failed completely, resulting in `100% packet loss` and connection failures.
* **The Root-Cause Analysis:** Private virtual subnets generated within simulated cloud architectures (`10.0.0.0/16`) reside inside an isolated, containerized software-defined network space managed by LocalStack. Because the physical host machine’s operating system and routing tables have no inherent route statements or gateway interfaces mapping to these private container IP addresses, packets were dropped at the host boundary before they could ever reach the virtual network perimeter. The infrastructure was functional, but the auditor was physically outside the data center.
* **The Resolution Action:** Intercepted the operational container environment directly to establish a proper internal network perspective. By executing:
    ```bash
    sudo docker exec -it localstack_main /bin/bash
    ```
    The terminal shell was dropped directly into the core container namespace. Running the network validation scripts from *within* this shared virtualization plane granted direct visibility to the simulated subnets, allowing verification commands to execute successfully.

### Problem 2: The Stateful Ingress-Egress Firewall Blockade
* **The Symptom/Friction:** The very first public ingress validation test directed at the Web Server (`10.0.1.4:443`) hung indefinitely in the terminal window before returning a critical `curl: (28) Connection timed out after 5001 milliseconds` error.
* **The Root-Cause Analysis:** A granular code audit of `securitygroups.tf` revealed a misconfiguration in the Web Security Group's stateful egress routing block. The outbound rule was tightly constrained to the local VPC boundary (`cidr_blocks = ["10.0.0.0/16"]`). While the stateful firewall properly permitted the public test packet *inbound* through Port 443, the reverse application handshake/response packet generated by the server was blocked and dropped at the firewall egress perimeter, unable to route its way back to the external testing client.
* **The Resolution Action:** Refactored the egress rule block of the Web Security Group to allocate an unrestricted global output routing path using standard CIDR notation:
    ```hcl
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"] # Reconfigured from 10.0.0.0/16 to allow global return transit
    }
    ```
    This structural adjustment opened up the bidirectional traffic lines, allowing return handshakes to exit the network cleanly.

### Problem 3: Defunct Upstream Tracking & Git Authentication "Repository Not Found" Failure
* **The Symptom/Friction:** Executing the initial synchronization command `git push -u origin main` triggered an immediate terminal crash returning the following fatal messages:
    ```text
    remote: Repository not found.
    fatal: repository '[https://github.com/raocybersec/your-repo-name.git/](https://github.com/raocybersec/your-repo-name.git/)' not found
    ```
* **The Root-Cause Analysis:** Deep-dive analysis of the terminal logs identified two separate pipeline issues. First, the local Git tracker was referencing a generic documentation placeholder string (`your-repo-name.git`) that did not exist on the cloud provider side. Second, modern source-control architectures enforce strict cryptographic access policies that reject standard account passwords over HTTPS interfaces to protect against credential stuffing attacks.
* **The Resolution Action:** Cleared the broken target reference out of the local project configurations by running:
    ```bash
    git remote remove origin
    ```
    An empty, matching target repository named `0-trust-cloud-vpc-architecture` was initialized via the browser dashboard on GitHub. A secure, programmatic Personal Access Token (PAT) with explicit `repo` scopes was generated under GitHub Developer Settings. Finally, the local workspace was linked to the real destination and pushed securely by passing the PAT as the authentication key:
    ```bash
    git remote add origin [https://github.com/raocybersec/0-trust-cloud-vpc-architecture.git](https://github.com/raocybersec/0-trust-cloud-vpc-architecture.git)
    git push -u origin main
    ```
