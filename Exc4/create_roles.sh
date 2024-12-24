# Script 2: Create Roles
#!/bin/bash

# Role viewer
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: viewer
rules:
- apiGroups: [""]
  resources: ["pods", "services", "deployments", "configmaps"]
  verbs: ["get", "list", "watch"]
EOF

# Role editor
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: editor
rules:
- apiGroups: [""]
  resources: ["pods", "services", "deployments", "configmaps"]
  verbs: ["get", "list", "watch", "create", "update", "delete"]
EOF

# Role admin
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: admin
rules:
- apiGroups: [""]
  resources: ["*"]
  verbs: ["*"]
EOF

echo "Roles viewer, editor, and admin created."
