# security_groups.tf (UPDATED & HARDENED)

# =============================================================================
# TIER 1 GUARD: WEB SERVER SECURITY GROUP
# =============================================================================
resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allow public HTTPS traffic inside Tier 1"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowed: The public needs to access the website
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Open to all networks so response can leave
  }
}

# =============================================================================
# TIER 2 GUARD: APPLICATION SERVER SECURITY GROUP
# =============================================================================
resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Allow custom backend traffic only from the Web Tier"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id] # Only trusts the Web Guard ID
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"] # Trapped inside our internal network
  }
}

# =============================================================================
# TIER 3 GUARD: DATABASE SERVER SECURITY GROUP (VULNERABILITY FIXED)
# =============================================================================
resource "aws_security_group" "db_sg" {
  name        = "db-security-group"
  description = "Allow database queries only from the App Tier"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id] # Only trusts the App Guard ID
  }

  # VULNERABILITY FIX: Changed from 0.0.0.0/0 to 10.0.0.0/16
  # Data can now NEVER escape directly to the public internet.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"] 
  }
} 
