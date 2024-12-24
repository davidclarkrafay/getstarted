terraform {
  backend "s3" {
    bucket = "dc-bucket"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
