packer {
  required_plugins {
    openstack = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/openstack"
    }
  }
}

source "openstack" "gen3dev" {
  flavor          = var.flavor
  image_name      = "gen3dev-{{timestamp}}"
  source_image    = var.source_image
  ssh_username    = var.ssh_username
  networks        = var.networks
  security_groups = var.security_groups
  floating_ip     = var.floating_ip
}

build {
  sources = ["source.openstack.gen3dev"]
  provisioner "shell" {
    script = "scripts/gen3dev.sh"
  }
}