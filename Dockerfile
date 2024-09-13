FROM python:3

RUN apt-get update && apt-get install -y curl

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Instalar o pytest
RUN pip install pytest

# Instalar o bandit
RUN pip install bandit

# Instalar java para rodar o dependency-check
# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# Adicionar o repositório do Java
RUN apt-get update && apt-get install -y default-jdk

# Definir variáveis de ambiente para o Java
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Instalar o dependency-check
RUN pip install dependency-check

COPY . .

# Executar a análise do pytest
RUN pytest --disable-warnings --maxfail=1

# Executar a análise do Bandit
RUN bandit -r . -lll

# Executar a análise do dependency-check
RUN dependency-check --project "todo" --scan . --format JSON

# Tornar o script de testes executável
RUN chmod +x ./run-tests.sh

# Tornar o script do bandit executável
RUN chmod +x ./run-bandit.sh

# Tornar o script do dependency-check executável
RUN chmod +x ./run-dependency-check.sh

ENV FLASK_APP=todo_project/run.py
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]