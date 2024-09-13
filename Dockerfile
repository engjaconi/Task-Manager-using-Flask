FROM python:3

RUN apt-get update && apt-get install -y curl

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Instalar o pytest
RUN pip install pytest

# Instalar o Bandit
RUN pip install bandit

COPY . .

# Executar a análise do pytest
RUN pytest --disable-warnings --maxfail=1

# Executar a análise do Bandit
RUN bandit -r . -lll

# Tornar o script de testes executável
RUN chmod +x ./run-tests.sh

# Tornar o script do bandit executável
RUN chmod +x ./run-bandit.sh

ENV FLASK_APP=todo_project/run.py
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]