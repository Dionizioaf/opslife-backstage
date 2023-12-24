#!/bin/bash
echo "Configurando machine do podman"
# Connect to the Podman VM using SSH and update /etc/sysctl.conf
podman machine ssh << EOF
if ! grep -qxF 'vm.max_map_count=262144' /etc/sysctl.conf; then
  echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
fi
EOF


echo "Building Postgresql image"
cd development-environment/postgresql
podman build . -t opslife/postgres --cache-from opslife/postgres -q