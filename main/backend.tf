terraform {
  backend "s3" {
    bucket         = "terraformchisom"
    key            = "My-infrastructure.tfstate"
    region         = "us-east-1"
    profile = "terraform"
  }
}