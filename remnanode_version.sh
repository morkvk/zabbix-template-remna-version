#!/usr/bin/env bash
# remnanode_version.sh
# Возвращает строку "Version X.Y.Z" из docker logs (регистронезависимо)
# Возвращает пустую строку при ошибке или если не найдено.

CONTAINER_NAME="remnanode"

# Если нужно - использовать sudo: DOCKER_CMD="sudo docker"
DOCKER_CMD="docker"

# Получаем логи контейнера, отвергая stderr, ищем Version (case-insensitive),
# затем извлекаем "Version" + номер версии (убираем боковые символы и лишние пробелы)
${DOCKER_CMD} logs "${CONTAINER_NAME}" 2>/dev/null | \
grep -i "Version" | \
sed -n 's/.*Version\s*│\s*\([0-9.]\+\).*/Version \1/p' | \
head -n 1 || true
