#!/bin/bash
mkdir ~/.kube
#sudo snap install microk8s --classic --channel=1.21
#sudo snap install microk8s --classic --channel=1.22/stable
sudo snap install microk8s --classic
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

#echo "alias kubectl='microk8s kubectl'" >> ~/.bash_aliases
sudo snap alias microk8s.kubectl kubectl
sudo snap alias microk8s.helm3 helm

sudo microk8s enable storage dns helm3
#sudo microk8s enable ingress
#sudo microk8s enable dashboard

#sudo microk8s enable portainer
# portainer default por is 30777 , default user is admin

sudo microk8s status --wait-ready

echo sudo microk8s status
sudo microk8s status

echo sudo kubectl version
sudo kubectl version

echo sudo helm version
sudo helm version

echo sudo kubectl get nodes
sudo kubectl get nodes

echo sudo kubectl get pod -A
sudo kubectl get pod -A

echo sudo kubectl get services -A
sudo kubectl get services -A

# reload the user groups
newgrp microk8s
