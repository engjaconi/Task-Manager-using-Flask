#!/bin/bash

# Sair imediatamente se algum comando falhar
set -e

# Exibir os comandos que estão sendo executados
set -x

# Rodar bandit
dependency-check --project "todo" --scan . --format JSON
# Exibir o report
cat /usr/src/app/./dependency-check-report.json