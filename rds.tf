# ----------------------------
# RDS Subnet Group
# ----------------------------
resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "${var.project}-rds-subnet-group-${random_string.rds_suffix.result}"
  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
  description = "RDS Subnet Group"
}

resource "random_string" "rds_suffix" {
  length  = 4
  special = false
  upper   = false
}
# ----------------------------
# RDS MySQL Database
# ----------------------------
resource "aws_db_instance" "rds" {
  identifier             = "${var.project}-rds"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false
  multi_az               = false

  tags = {
    Name = "${var.project}-rds"
  }
}
