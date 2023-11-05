terraform {
  backend "s3" {
    bucket = "terraform-tech-daniel"
    key    = "dev-rds/terraform.tfstate"
    region  = "us-east-1"
  }
}