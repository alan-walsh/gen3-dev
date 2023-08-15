packer {
  required_plugins {
    openstack = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/openstack"
    }
  }
}

source "openstack" "gen3dev" {
  flavor          = "1"
  image_name      = "gen3dev-{{timestamp}}"
  source_image    = "c914244b-77b5-4420-9a72-9b8763284163"
  ssh_username    = "ubuntu"
  networks        = ["ce30311e-2428-4b21-a4f8-79f60eb492f3"]
  security_groups = ["ed8c83f3-8f96-493b-bd27-576a1d00f871"]
  floating_ip     = "6379cb4d-e355-4c19-aea2-eafb4e0241ec"
}

build {
  sources = ["source.openstack.gen3dev"]
  provisioner "shell" {
    script = "scripts/gen3dev.sh"
  }
}
