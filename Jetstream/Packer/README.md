## Building the base image in Jetstream

> [!NOTE]
> This build process requires [Packer](https://www.packer.io/) 1.9.2 or later.

1. If you have not already done so, log in to [Exosphere](https://jetstream2.exosphere.app/exosphere/). Among other things, this will provide a network that you can use. Documentation: https://docs.jetstream-cloud.org/ui/exo/exo/.
2. Using the OpenStack CLI, create a floating IP address in Jetstream in the public network
```shell
openstack floating ip create public
```
3. Copy the `gen3dev.auto.pkrvars.hcl.template` file to `gen3dev.auto.pkrvars.hcl` and edit the latter file to provide the appropriate values for your deployment. The `floating_ip` value should be the ID for the address you created in the previous step. The network ID should be from the `auto_allocated_network` network and the security group ID should be from the `exosphere` security group.
4. Initialize Packer
```shell
packer init .
```
5. Validate the Packer template
```shell
packer validate .
```
6. Build the image
```shell
packer build .
```
