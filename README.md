# Task-Manager-using-Flask

Uma aplicação web simples para armazenar suas tarefas pessoais.

# Funcionalidades

- Autenticação de usuário.
- Fácil de usar, com Dockerfile para uso em container.

# Requesitos

Certifique que possua o docker instalado e sendo executado em seu ambiente.

# Execução

1. Clone o repositório com o comando:
    
    ```git clone https://github.com/engjaconi/Task-Manager-using-Flask```

2. Dentro da raiz do projeto execute o camando no terminal para fazer o build do container:

    ```docker build -t todo .```

3. Executando testes na aplicação:
    ```docker run --rm todo ./run-tests.sh```

4. Executando a aplicação: 

    ```docker run -p 5000:5000 todo```


# Resultados

## Registration Page
Login or Register if you dont have an account

![Registration Page](output/register.jpg)

## Accessing URL's 
User cannot access any URL's if they are not logged in

![Invalid Access](output/invalid-access.jpg)

## After Successfull Login
See all your tasks after successfull login.

![After Login](output/after-login.jpg)

## Add Tasks
Click the **Add Task** link in the side-bar to add tasks

![Image of Yaktocat](output/add-task.jpg)

## View All Tasks
Click the **View All Task** link in the side-bar to see all tasks. You can **Update** and **Delete** Tasks from this page.

![Image of Yaktocat](output/all-tasks.jpg)

## Account Settings
Change your username and password. You can access this by clicking dropdown in the Navbar

![Image of Yaktocat](output/account-settings.jpg)

