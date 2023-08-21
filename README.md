# gen3-dev
Code to create a development environment for Gen3

> [!NOTE]
> This project requires a base image with various software, including Kubernetes and Helm. If you or someone else have not already created this image, please refer to the instructions in the Packer folder.

1. Log in to the [Exosphere](https://jetstream2.exosphere.app/exosphere) console.
2. Click `Create->Instance` to create a new instance.
3. Click `By Image` and find the base image referenced above.
4. Click on `Create Instance` next to the image name.
5. Enter a name for the instance or click the `Random Name` button.
6. Choose the flavor.
> [!IMPORTANT]
> m3.medium is the minimum recommended flavor. If you choose a smaller flavor, you may run out of memory or disk space.
7. Choose a keypair.
8. Click `Create` to create the instance.
9. When the instance is ready, click on the instance name to view the details.
10. Copy the SSH connection information, e.g. `exouser@149.165.x.x`
11. Open a terminal and connect to the instance using the SSH connection information.
12. Start minikube using the appropriate version of Kubernetes for Gen3
```shell
minikube start --kubernetes-version v1.23.17
```
14. Increase the max_map_count for Elasticsearch
```shell
sudo sysctl -w vm.max_map_count=262144
```
13. Install Gen3 using the instructions in the repo: https://github.com/uc-cdis/gen3-helm
> [!NOTE]
> You will need to provide a minimal values.yaml file.

> [!IMPORTANT]
> Use the hostname value provided in the Exosphere information page for the instance as the hostname for the Gen3 installation, e.g. `usefully-proud-iguana.cis123456.projects.jetstream-cloud.org`
14. Expose the revproxy service
```shell
minikube service revproxy-service --url
```
15. Edit the Caddy config file to proxy that URL to the Gen3 services, then restart caddy
```shell
sudo vi /etc/caddy/Caddyfile
```

```shell
sudo systemctl restart caddy
```
You should now be able to access the Gen3 services using the hostname for your VM.
