terraform {
  backend "s3" {
    bucket = "dc-rafay-bucket"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
