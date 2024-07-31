variable "aws_region" {
  description = "The AWS region to deploy the resource to"
  default     = "af-south-1"
}

variable "bucket_name" {
  description = "The name for the S3 bucket"
}

variable "environment" {
  description = "The environment where the resources are deployed"
  default = "staging"
}