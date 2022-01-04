#!/bin/bash
mkdir -p ~/.kube
#sudo snap install microk8s --classic --channel=1.21
#sudo snap install microk8s --classic --channel=1.22/stable
sudo snap install microk8s --classic
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

#echo "alias kubectl='microk8s kubectl'" >> ~/.bash_aliases
sudo snap alias microk8s.kubectl kubectl
sudo snap alias microk8s.helm3 helm

echo microk8s enable storage dns helm3
sudo microk8s enable storage dns helm3
#sudo microk8s enable ingress
#sudo microk8s enable dashboard
#sudo microk8s enable registry

#sudo microk8s enable portainer
# portainer default por is 30777 , default user is admin

echo microk8s status --wait-ready
sudo microk8s status --wait-ready
echo

# reload the user groups
newgrp microk8s
