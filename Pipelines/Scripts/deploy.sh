#!/bin/bash

WD=$(pwd)
echo "WD:" ${WD}
SCRIPTS=${WD}/deploy/Pipelines/Scripts
echo "SCRIPTS:" ${SCRIPTS}
source ${SCRIPTS}/header.sh

ARTIFACTS=${WD}/deploy/Artifacts
echo "ARTIFACTS:" ${ARTIFACTS}

K8S=${WD}/deploy/Pipelines/k8s
echo "K8S:" ${K8S}

header 'DEPLOY'

echo "Artifacts:"
cd ${ARTIFACTS} && ls -la

echo "Kubernetes:"
cd ${K8S} && ls -la

# Do we need to be SSHd into a node?

export KUBECONFIG=${ARTIFACTS}/kube-config.yaml

kubectl apply --filename ${K8S}/deployment.yaml 

kubectl apply --filename ${K8S}/service.yaml

kubectl apply --filename ${K8S}/ingress.yaml