#!/bin/bash
sudo apt update
sudo apt install lsscsi net-tools wget git unzip apache2 -y
wget https://raw.githubusercontent.com/taiqp/lavoro-forwork/main/shell/alias.txt
sudo snap install docker
sudo snap install yq
sudo apt install mysql-client -y
sudo apt install postgresql-client -y
sudo apt install awscli -y
sudo apt install ansible -y
sudo snap install terraform --classic
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
cat alias.txt >> ~/.bashrc
sudo curl -kLO https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
