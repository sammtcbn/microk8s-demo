#!/bin/bash
function print_green()
{
    echo -e "\033[0;32m$@\033[0m"
}

print_green "microk8s enable istio"
microk8s enable istio
