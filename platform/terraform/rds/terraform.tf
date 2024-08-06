terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }

    port = {
      source  = "port-labs/port-labs"
      version = "2.0.3"
    }
  }

  required_version = "~> 1.3"

  backend "s3" {
    bucket = "sgt-demo-tfstate"
    key    = "terraform.tfstate"
    region = "af-south-1" # Replace with your region
  }
}