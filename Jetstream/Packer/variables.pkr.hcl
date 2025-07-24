variable "flavor" {
  default = "m3.tiny"
  type    = string
}

variable image_name {
  default = "gen3dev"
  type    = string
}

variable source_image_name {
  description = "Image to use for the instance. Typically a JS2 featured image."
  default     = "Featured-Ubuntu20"
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

variable "helm_version" {
  description = "Version of Helm to install on the instance."
  default     = "v3.12.3"
  type        = string
}

variable "kubectl_version" {
  description = "Version of kubectl to install on the instance."
  default     = ""
  type        = string
}

variable "k9s_version" {
  type        = string
  default     = "0.50.7"
  description = "k9s version in semantic version format (e.g., 0.32.5)"
  
  validation {
    condition     = can(regex("^[0-9]+\\.[0-9]+\\.[0-9]+$", var.k9s_version))
    error_message = "The k9s_version must be in semantic version format X.Y.Z (e.g., 0.32.5)."
  }
}