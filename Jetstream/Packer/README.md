## Building the base image in Jetstream

> [!NOTE]
> This build process requires [Packer](https://www.packer.io/) 1.9.2 or later.

1. If you have not already done so, log in to [Exosphere](https://jetstream2.exosphere.app/exosphere/). Among other things, this will provide a network that you can user. Documentation: https://docs.jetstream-cloud.org/ui/exo/exo/.
2. Create a floating IP address in Jetstream.
3. Initialize Packer
```shell
packer init .
```
4. Validate the Packer template
```shell
packer validate .
```
5. Build the image
```shell
packer build .
```