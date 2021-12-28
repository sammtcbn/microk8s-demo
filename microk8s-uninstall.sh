#!/bin/bash
#microk8s.disable dashboard ingress
sudo microk8s.disable storage dns helm3

sudo snap disable microk8s

sudo snap remove microk8s

rm -rf ~/.kube

sudo snap unalias kubectl
sudo snap unalias helm
