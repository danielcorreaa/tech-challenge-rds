terraform {
  backend "s3" {
    bucket = "terraform-tech-daniel"
    key    = "homolog/terraform.tfstate"
    region  = "us-east-1"
  }
}