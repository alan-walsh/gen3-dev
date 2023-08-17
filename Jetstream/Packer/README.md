## Building the base image in Jetstream

> [!NOTE]
> This build process requires [Packer](https://www.packer.io/) 1.9.2 or later.

1. If you have not already done so, log in to [Exosphere](https://jetstream2.exosphere.app/exosphere/). Among other things, this will provide a network that you can use. Documentation: https://docs.jetstream-cloud.org/ui/exo/exo/.
2. Create a floating IP address in Jetstream using the public network
```shell
openstack floating ip create public
```
3. Copy the `gen3dev.auto.pkrvars.hcl.template` file to `gen3dev.auto.pkrvars.hcl` and edit the latter file to provide the appropriate values for your deployment. The `floating_ip` value should be the ID for the address you created in the previous step.
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