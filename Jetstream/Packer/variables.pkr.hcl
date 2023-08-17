variable "flavor" {
  default = "m3.tiny"
  type    = string
}

variable image_name {
  default = "gen3dev"
  type    = string
}

variable "source_image" {
  description = "Image to use for the instance. Typically a JS2 featured image."
  type        = string
}

variable "ssh_username" {
  description = "Username for SSH access to the instance during build, e.g. 'ubuntu' for Ubuntu 22.04"
  type        = string
}

variable "networks" {
  description = "Network (singular) to attach the instance to."
  type        = list(string)
}

variable "security_groups" {
  description = "Security group (singular) to attach to the instance."
  type        = list(string)
}

variable "floating_ip" {
  description = "Floating IP to attach to the instance. See README for more information."
  type        = string
}