# Script 1: Create Users
#!/bin/bash

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: user-viewer
  namespace: default
EOF

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: user-editor
  namespace: default
EOF

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: user-admin
  namespace: kube-system
EOF

echo "Users user-viewer, user-editor, and user-admin created."
