variable "project_id" {
  type        = string
  description = "The project ID to deploy resources"
}

variable "region" {
  type        = string
  description = "The region to deploy resources"
}

variable "zone" {
  type        = string
  description = "The zone to deploy resources"
}

variable "subnet_cidr_public" {
  type        = string
  description = "The CIDR block for the public subnet"
}

variable "subnet_cidr_private" {
  type        = string
  description = "The CIDR block for the private subnet"
}
