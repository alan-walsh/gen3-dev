# gen3-dev
Code to create a development environment for Gen3

> [!NOTE]
> This project requires a base image with various software, including Kubernetes and Helm. If you or someone else have not already created this image, please refer to the instructions in the Packer folder.

1. Log in to the [Exosphere](https://jetstream2.exosphere.app/exosphere) console. This will create a network and security group that you can use in the Terraform deployment. You can also manually create these resources in the OpenStack Horizon console.
2. Change into the terraform folder:
```shell
cd terraform
```
3. Copy the gen3-dev.auto.tfvars.template file to gen3-dev.auto.tfvars and edit the values to match your environment.
```shell
cp gen3-dev.auto.tfvars.template gen3-dev.auto.tfvars
```
> [!IMPORTANT]
> m3.medium is the minimum recommended flavor. If you choose a smaller flavor, you may run out of memory or disk space.
4. Initialize Terraform
```shell
terraform init
```
5. Run terraform plan to see what resources will be created
```shell
terraform plan
```
6. Run terraform apply to create the resources
```shell
terraform apply
```
7. Open a terminal and connect to the instance using name provided in the Terraform output:
```shell
ssh ubuntu@usefully-proud-iguana.cis123456.projects.jetstream-cloud.org
```
> [!NOTE]
> If you stop or shelve your instance you can resume at this point. Shelving is recommended when you are not actively using the instance because it will stop the billing for the instance in Jetstream.
8. Start minikube using the appropriate version of Kubernetes for Gen3
```shell
minikube start --kubernetes-version v1.23.17
```
9. Increase the max_map_count for Elasticsearch
```shell
sudo sysctl -w vm.max_map_count=262144
```
10. Install Gen3 using the instructions in the repo: https://github.com/uc-cdis/gen3-helm
> [!NOTE]
> You will need to provide a minimal values.yaml file.

> [!IMPORTANT]
> Use the Jetstream hostname for the instance as the hostname for the Gen3 installation, e.g.: `gen3-e54ddea68b5424cb.cis123456.projects.jetstream-cloud.org`
11. Get the URL for the revproxy service
```shell
minikube service revproxy-service --url
```
12. Edit the Caddy config file to proxy that URL to the Gen3 services, then restart caddy
```shell
sudo vi /etc/caddy/Caddyfile
```

Sample Caddyfile:
```
gen3-e54ddea68b5424cb.cis123456.projects.jetstream-cloud.org {

        # Another common task is to set up a reverse proxy:
        reverse_proxy 192.168.49.2:32247

}
```

```shell
sudo systemctl restart caddy
```
You should now be able to access the Gen3 services using the hostname for your VM.
