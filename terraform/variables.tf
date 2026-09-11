variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "devops-eks"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.20.0.0/16"
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
}
