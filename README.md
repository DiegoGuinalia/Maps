
# Pré-requisitos
Você deverá instalar o banco de dados **sqlite3**.
	**Link para download:**
https://sqlite.org/download.html 


# Primeiros passos
Após instalar o banco de dados, você deverá descompactar a pasta do código fonte e rodar os seguintes comandos:

**rake db:create** (Cria o banco de dados)
**rake db:migrate** (Roda todas as migrações)
**rake db:seed** (Utilizado para popular o banco de dados com as informações das ubs)
## Iniciando

após todos os passos anteriores, você deverá seguir os seguintes passos:

**rails s** (Para subir servidor local)
## web app
**http://localhost:3000** (Porta default para inicialização do sistema)
## API
http://localhost:3000/api/v1/find_ubs?query=[LATITUDE],[LONGITUDE]&page=[número_pagina_visualização]&per_page=[registros_por_página]

## Parando execução

Se você deseja parar a execução do servidor/sistema, basta rodar o seguinte comando em seu terminal:

**CTRL+c** ( Comando utilizado para parar o servidor e sistema )
## Referência
código pode ser visualizado através do link:
#### https://github.com/DiegoGuinalia/bionexo
