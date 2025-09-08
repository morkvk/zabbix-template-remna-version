#!/usr/bin/env bash
# remnanode_version.sh
# Возвращает строку из docker logs, содержащую "Version" (регистронезависимо)
# Возвращает пустую строку при ошибке или если не найдено.

CONTAINER_NAME="remnanode"

# Если нужно - использовать sudo: DOCKER_CMD="sudo docker"
DOCKER_CMD="docker"

# Получаем логи контейнера, отвергая stderr, ищем Version (case-insensitive)
${DOCKER_CMD} logs "${CONTAINER_NAME}" 2>/dev/null | grep -i "Version" || true
