# Script 1: Create Users
#!/bin/bash

# Create service accounts for users
kubectl create serviceaccount user-viewer -n default
kubectl create serviceaccount user-editor -n default
kubectl create serviceaccount user-admin -n kube-system

echo "Users user-viewer, user-editor, and user-admin created."
