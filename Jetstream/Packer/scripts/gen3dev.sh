#!/bin/bash -e
# This script is run as the last step of image provisioning

# Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
sudo minikube config set vm-driver none

# Increase max_map_count for Elasticsearch
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf

# Kubectl
if [ -z "$KUBECTLVERSION" ]
then
  # If KUBECTLVERSION is not set, get the latest version
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
else
  # If KUBECTLVERSION is set, use that version
  curl -LO "https://dl.k8s.io/release/$KUBECTLVERSION/bin/linux/amd64/kubectl"
fi
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Helm
# NOTE: installing from the script so that Helm can easily be updated in the future
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod +x get_helm.sh
bash ./get_helm.sh -v $HELMVERSION

# Caddy
sudo apt-get update
sudo apt-get install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt-get update
sudo apt-get install -y caddy

#k9s
wget https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_Linux_amd64.tar.gz
tar -xzvf k9s_Linux_amd64.tar.gz
sudo cp k9s /usr/local/bin/