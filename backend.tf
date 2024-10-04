terraform {
  backend "s3" {
    bucket = "s3-project-mk"
    key = "tf-statefile"
    region = "us-east-1"
    dynamodb_table = "statelock-table"
    encrypt = true
  }
}