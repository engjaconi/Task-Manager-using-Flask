import pytest
from todo_project import app, db, bcrypt
from todo_project.models import User

@pytest.fixture
def client():
    # Configurar a aplicação para o modo de teste
    app.config['TESTING'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'  # Banco de dados em memória
    app.config['WTF_CSRF_ENABLED'] = False

    with app.app_context():
        db.create_all()  # Criar tabelas antes de cada teste
        yield app.test_client()  # Retorna o cliente de teste
        db.drop_all()  # Limpar o banco de dados após os testes

def test_criar_tabelas(client):
    # Verifica se as tabelas foram criadas
    # Aqui você pode testar a existência de tabelas específicas
    # usando a função `inspect` do SQLAlchemy.
    from sqlalchemy import inspect

    inspector = inspect(db.engine)
    tables = inspector.get_table_names()

    assert 'user' in tables
    assert 'task' in tables 
    # Verificar se o número de tabelas criadas está correto
    expected_table_count = 2
    assert len(tables) == expected_table_count

def test_criar_usuarios(client):
    # Cria um usuário
    hashed_password = bcrypt.generate_password_hash('testuser').decode('utf-8')
    response = client.post('/register', data={'username': 'testuser', 'password': hashed_password})
    assert response.status_code == 200