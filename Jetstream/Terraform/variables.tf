variable "auth_url" {
  type        = string
  description = "The authentication URL for your OpenStack environment"
}

variable "tenant_name" {
  type        = string
  description = "The name of the tenant/project in your OpenStack environment"
}

variable "application_credential_id" {
  type        = string
  description = "The ID of the application credential to use for authentication"
}

variable "application_credential_secret" {
  type        = string
  description = "The secret key of the application credential to use for authentication"
}

variable "flavor_name" {
  type        = string
  description = "The name of the flavor (size) for the instance"
}

variable "instance_name" {
  type        = string
  description = "The name of the instance to create"
}

variable "key_pair" {
  type        = string
  description = "The name of the key pair to use for SSH access"
}

variable "security_groups" {
  type        = list(string)
  description = "A list of security group names to apply to the instance"
}

variable "network_name" {
  type        = string
  description = "The name of the network to attach the instance to"
}

variable "image_search_name" {
  type        = string
  description = "The name (regex) of the image to search for"
}