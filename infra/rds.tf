# create the rds instance
resource "aws_db_instance" "banco-mysql" {
  engine                  = "mysql"
  engine_version          = "8.0.31"
  multi_az                = false
  identifier              = "mysql-tech"
  username                = "daniel"
  password                = "daniel39pos"
  instance_class          = "db.t2.micro"
  allocated_storage       = 200
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  db_name                 = "techchallenge"
  skip_final_snapshot     = true   
}