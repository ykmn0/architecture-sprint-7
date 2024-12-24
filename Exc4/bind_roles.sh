# Script 3: Bind Roles to Users
#!/bin/bash

# Bind user-viewer to viewer role
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: viewer-binding
  namespace: default
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: viewer
subjects:
- kind: ServiceAccount
  name: user-viewer
  namespace: default
EOF

# Bind user-editor to editor role
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: editor-binding
  namespace: default
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: editor
subjects:
- kind: ServiceAccount
  name: user-editor
  namespace: default
EOF

# Bind user-admin to admin cluster role
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-binding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: admin
subjects:
- kind: ServiceAccount
  name: user-admin
  namespace: kube-system
EOF

echo "Role bindings created."