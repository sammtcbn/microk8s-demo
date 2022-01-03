#!/bin/bash
echo microk8s status
microk8s status
echo

echo microk8s.config
microk8s.config
echo

echo kubectl version
kubectl version
echo

echo helm version
helm version
echo

echo kubectl get nodes
kubectl get nodes
echo

echo kubectl get pod -A
kubectl get pod -A
echo

echo kubectl get services -A
kubectl get services -A
echo

echo kubectl get all --all-namespaces
kubectl get all --all-namespaces
echo

echo kubectl cluster-info
kubectl cluster-info
echo

