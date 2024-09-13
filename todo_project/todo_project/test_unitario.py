import pytest
from todo_project import app

@pytest.fixture
def client():
    with app.app_context():
        yield app.test_client()

def test_pagina_inicial(client):
    response = client.get('/')
    assert response.status_code == 200, "Expected status code 200 (OK)"
    assert 'Aditya Bagad' in response.data.decode('utf-8'), "Response should contain developer name"