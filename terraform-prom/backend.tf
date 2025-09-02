terraform {
  backend "s3" {
    bucket  = "my-grafana-project123"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-lock-grafana"
  }
}