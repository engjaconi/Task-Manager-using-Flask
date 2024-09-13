#!/bin/bash

# Sair imediatamente se algum comando falhar
set -e

# Exibir os comandos que estão sendo executados
set -x

# Rodar bandit
bandit -r . -lll