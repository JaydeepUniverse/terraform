provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_s3_bucket" "jaydeep-nextgen-cicd-spinnaker" {
  bucket = "jaydeep-nextgen-cicd-spinnaker"
  tags = {
    EmployeeName = "Jaydeep"
    Environment = "Dev"
  }
}