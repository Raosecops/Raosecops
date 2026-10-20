# servers.tf

# =============================================================================
# TIER 1: WEB SERVER (The Public Face)
# =============================================================================
resource "aws_instance" "web_server" {
  # ami: The "Soul" - Ubuntu Linux OS blueprint
  ami           = "ami-0c55b159cbfafe1f0" 
  
  # instance_type: The "Body" - Basic CPU/RAM (Free Tier equivalent)
  instance_type = "t2.micro"              
  
  # subnet_id: Placing this machine in the Public Tier 1 room
  subnet_id              = aws_subnet.web_subnet.id
  
  # vpc_security_group_ids: Attaching the Web Guard (allows Port 443)
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = { Name = "NebulaGuard-Web-Tier" }
}

# =============================================================================
# TIER 2: APPLICATION SERVER (The Logic Center)
# =============================================================================
resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  # subnet_id: Placing this machine in the Private Tier 2 room
  subnet_id              = aws_subnet.app_subnet.id
  
  # vpc_security_group_ids: Attaching the App Guard (Identity-based access)
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = { Name = "NebulaGuard-App-Tier" }
}

# =============================================================================
# TIER 3: DATABASE SERVER (The High-Security Vault)
# =============================================================================
resource "aws_instance" "db_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  # subnet_id: Placing this machine in the Isolated Tier 3 room
  subnet_id              = aws_subnet.db_subnet.id
  
  # vpc_security_group_ids: Attaching the DB Guard (Only trusts App Tier)
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = { Name = "NebulaGuard-DB-Tier" }
}
