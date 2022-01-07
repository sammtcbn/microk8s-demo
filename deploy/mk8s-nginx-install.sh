#!/bin/bash
kubectl create deployment nginx --image=nginx
kubectl expose deployment nginx --type=ClusterIP --port=80 --name=nginx-service
