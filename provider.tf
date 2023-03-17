terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Provider Block
provider "aws" {
   region = var.region[1]
 }