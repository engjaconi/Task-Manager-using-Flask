#!/bin/bash

# Sair imediatamente se algum comando falhar
set -e

# Exibir os comandos que estão sendo executados
set -x

# Rodar testes com pytest
pytest --disable-warnings --maxfail=1

# Outras opções que você pode considerar adicionar:
# pytest -v   # Para saída mais detalhada
# ytest
# pytest --cov=app   # Para rodar testes com cobertura de código