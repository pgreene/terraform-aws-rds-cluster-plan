module "aws_sg_db" {
  source = "git::https://github.com/pgreene/terraform-aws-security-group"
  //source  = "app.terraform.io/space/security-group/aws"
  //version = "1.0.0"
  name = join("-",[module.label.id,"dsg"])
  vpc_id = local.vpc_id
  tags = module.label.tags
}

module "aws_sg_rule_db3306_ingress" {
  source = "git::https://github.com/pgreene/terraform-aws-security-group-rule"
  //source  = "app.terraform.io/space/security-group-rule/aws"
  //version = "1.0.0"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  from_port = "3306"
  to_port = "3306"
  protocol = "tcp"
  security_group_id = module.aws_sg_db.id
}

module "aws_sg_rule_db3306_egress" {
  source = "git::https://github.com/pgreene/terraform-aws-security-group-rule"
  //source  = "app.terraform.io/space/security-group-rule/aws"
  //version = "1.0.0"
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  from_port = "3306"
  to_port = "3306"
  protocol = "tcp"
  security_group_id = module.aws_sg_db.id
}

module "aws_db_subnet_group" {
  source = "git::https://github.com/pgreene/terraform-aws-db-subnet-group"
  //source  = "app.terraform.io/space/db-subnet-group/aws"
  //version = "1.0.0"
  name = "your-subnet-group-name"
  //subnet_ids = ["subnet-123456","subnet-123456","subnet-123456"]
  subnet_ids = local.private_subnets
  //tags = 
}

module "aws_rds_cluster_parameter_group" {
  source = "git::https://github.com/pgreene/terraform-aws-rds-cluster-parameter-group"
  //source  = "app.terraform.io/space/rds-cluster-parameter-group/aws"
  //version = "1.0.0"
  name = "your-parameter-group-name"
  max_connections = "10000"
  slow_query_log = "1"
  log_queries_not_using_indexes = "1"
  wait_timeout = "300"
  //tags = 
}

module "aws_rds_cluster_aurora_serverless" {
  source = "git::https://github.com/pgreene/terraform-aws-rds-cluster"
  //source  = "app.terraform.io/space/rds-cluster/aws"
  //version = "1.0.0"
  name = "your-database-cluster-name"
  apply_immediately = true
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  vpc_security_group_ids = [module.aws_sg_db.id]
  db_subnet_group_name = module.aws_db_subnet_group.id
  db_cluster_parameter_group_name = module.aws_rds_cluster_parameter_group.id
  engine_mode = "serverless"
  engine = "aurora"
  //DO NOT SET ENGINE VERSION WHEN USING AURORA SERVERLESS !!!
  //engine_version = "5.6.mysql_aurora.1.17.9"
  deletion_protection = false
  scaling_configuration = {}
    scaling_configuration_auto_pause = false
    scaling_configuration_max_capacity = 8
    scaling_configuration_min_capacity = 2
    scaling_configuration_seconds_until_auto_pause = null
  //enabled_cloudwatch_logs_exports = ["audit", "error"]
  //scaling_configuration_timeout_action = "ForceApplyCapacityChange" 
  skip_final_snapshot = false
  final_snapshot_identifier = join("-",[module.label.id,"delete"])
  //tags = 
}
