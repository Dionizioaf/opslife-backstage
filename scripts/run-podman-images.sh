#!/bin/bash
# TODO: opção de criar os diretótios para mapeamento dos volumes
# DONE: precisa verificar se já existe antes de criar
cd development-environment/postgresql
mkdir -p data tmp scripts
chmod 777 * data tmp scripts
# DONE: criar script para remover os containers antes de iniciá-los novamente
echo "Iniciando omni-postgres..."
CONTAINER_NAME="opslife-postgres"
if podman inspect -t container "$CONTAINER_NAME" &> /dev/null; then
    echo "Container $CONTAINER_NAME is already running. Stopping it..."
    podman stop "$CONTAINER_NAME"
    podman rm "$CONTAINER_NAME"
fi

podman run -d \
    --name opslife-postgres \
    -p 5432:5432 \
    --env DOCKER_CONTAINER_NAME="opslife-postgres" \
    --user postgres \
    --userns keep-id:uid=999,gid=999 \
    --health-interval 10s \
    --health-timeout 5s \
    --health-retries 3 \
    --privileged \
    --volume ${PWD}/scripts:/scripts \
    --volume ${PWD}/tmp:/tmp \
    --volume ${PWD}/data:/opt/postgres/data \
    opslife/postgres