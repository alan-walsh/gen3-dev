resource "random_id" "suffix" {
byte_length = 8
}

locals {
    instance_name = "${var.instance_name}-${random_id.suffix.hex}"
}

data "openstack_images_image_ids_v2" "images" {
  name_regex = var.image_search_name
  sort       = "updated_at"
}

resource "openstack_compute_floatingip_v2" "floating_ip" {
    pool = "public"
}

resource "openstack_compute_instance_v2" "gen3_dev" {
  name            = local.instance_name
  flavor_name     = var.flavor_name
  image_id        = data.openstack_images_image_ids_v2.images.ids[0]
  key_pair        = var.key_pair
  security_groups = var.security_groups

  network {
    name = var.network_name
  }
}

resource "openstack_compute_floatingip_associate_v2" "associate_floating_ip" {
  floating_ip = openstack_compute_floatingip_v2.floating_ip.address
  instance_id = openstack_compute_instance_v2.gen3_dev.id
}