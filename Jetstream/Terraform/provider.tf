terraform {
    required_providers {
        openstack = {
            source  = "terraform-provider-openstack/openstack"
            version = ">=1.54.1"
        }
        random = {
            source  = "hashicorp/random"
            version = ">=3.6.0"
        }
    }
}

provider "openstack" {
    application_credential_id     = var.application_credential_id
    tenant_name                   = var.tenant_name
    application_credential_secret = var.application_credential_secret
    auth_url                      = var.auth_url
}

provider "random" {}