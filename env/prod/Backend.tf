terraform {
  backend "s3" {
    bucket = "terraform-tech-daniel"
    key    = "Prod-rds/terraform.tfstate"
    region  = "us-east-1"
  }
}