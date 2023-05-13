#!/bin/bash
set -ex

# Install Zilla to the Kubernetes cluster with helm and wait for the pod to start up
ZILLA_CHART=../zilla-0.1.0.tgz
helm install zilla-tcp-reflect $ZILLA_CHART --namespace zilla-tcp-reflect --create-namespace --wait \
    --values values.yaml \
    --set-file zilla\\.yaml=zilla.yaml

# Start port forwarding
kubectl port-forward --namespace zilla-tcp-reflect service/zilla-tcp-reflect 12345 > /tmp/kubectl-zilla.log 2>&1 &
until nc -z localhost 12345; do sleep 1; done
