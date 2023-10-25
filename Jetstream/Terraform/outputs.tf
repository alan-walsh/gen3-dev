output "instance_name" {
    value = "${openstack_compute_instance_v2.gen3_dev.name}.${lower(var.tenant_name)}.projects.jetstream-cloud.org"
}
