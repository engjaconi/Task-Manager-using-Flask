FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Tornar o script de testes executável
RUN chmod +x ./run-tests.sh

ENV FLASK_APP=todo_project/run.py
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]