packer {
  required_plugins {
    openstack = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/openstack"
    }
  }
}

source "openstack" "gen3dev" {
  flavor     = var.flavor
  image_name = "${var.image_name}-{{timestamp}}"
  source_image_filter {
    filters {
      name       = var.source_image_name
      visibility = "public"
    }
    most_recent = true
  }
  ssh_username    = var.ssh_username
  networks        = var.networks
  security_groups = var.security_groups
  floating_ip     = var.floating_ip
}

build {
  sources = ["source.openstack.gen3dev"]
  provisioner "shell" {
    environment_vars = [
      "HELMVERSION=${var.helm_version}",
      "KUBECTLVERSION=${var.kubectl_version}",
      "K9SVERSION=${var.k9s_version}"
    ]
    script = "scripts/gen3dev.sh"
  }
}
