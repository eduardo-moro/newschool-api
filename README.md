# New School

Uma API pensada para dar vida à um projeto que busca implementar alguns conceitos da pedagogia a um projeto de tecnologia.
Boa parte da inspiração bibliográfica para tal projeto vem de livros como:
- "O porvir, desafios das linguagens do século XXI", de Pedro Demo, que detém uma lista interminável de títulos neste assunto;
- "Educação da criança excepcional", de Samuel A. Kirk e James J. Gallagher;
- "Linguagem, desenvolvimento e aprendizagem", de Lev Vygotsky;
- "Virtualmente Humanos", de Martine Rothblatt;
- "Pedagogia do oprimido", de Paulo Freire.

## ✨ Funcionalidades desejadas (à API, verificar mais funcionalidades do projeto na plataforma WEB)

- **Comunicação com IA**: Tema já saturado, porém a idéia é ser capaz de criar resumos e até mesmo adaptar conteúdos novos para a plataforma à partir de textos e documentos;
- **Gerênciamento e rankeamento de rotas de aprendizado**: CRUD de trilhas de aprendizado e rankeamento de trilhas por popularidade, avaliação, nivel do conteúdo;
- **Criação de conteúdo independente**: Permitir que usuários criem conteúdo para a plataforma, que poderão ser acessados em forma de trilhas ou conteúdo avulso;
- **Billing e controle de acesso à conteúdos**: Permitir que criadores de conteúdo precifiquem o acesso, a idéia é permitir que apenas parte do conteúdo seja privado de forma paga, para permitir maior distribuição dos conteúdos que se utilizem dos métodos de ensino da plataforma.

## 🛠 Tecnologias Utilizadas

- **PHP 8.4+**
- **Laravel 11** (Eloquent ORM, Migrations, Factories)
- **MySQL** (Modelagem relacional)
- **Docker** (Ambiente de desenvolvimento isolado)
- **PHPUnit** (Testes automatizados com cobertura completa)

## ⚙️ Instalação local
>readme está sendo preparado para primeira publicação, com os comandos padrão para a framework laravel, demais instruções para a configuração do banco de dados serão inclusas fururamente;

### Pré-requisitos
Certifique-se de ter os seguintes itens instalados em sua máquina:

- PHP 8.4+
- Composer
- MySQL Server

---

1. Clone o repositório:
```bash
git clone git@github.com:eduardo-moro/newschol-api.git
cd newschol-api
```

2. Instale as dependências:
```bash
composer install
```

3. Configure o ambiente:
```bash
composer run setup-project
```

4. Inicie o servidor local:
```bash
php artisan serve
```

---

## 🐳 Execução com Docker (Opcional)
### Pré-requisitos
Certifique-se de ter os seguintes itens instalados em sua máquina:

- Docker
- Docker desktop (opcional, recomendado)

---

1. Construa e inicie o container:
```bash
docker compose up -d #pode ser o comando docker-compose up -d em alguns ambientes.
```
O serviço estará disponível na [porta 8000 do host local](127.0.0.1:8000)

## 🧪 Testes Automatizados
Os testes foram escritos usando PHPUnit e podem ser executados com o seguinte comando:
```bash
php artisan test
```

## 📚 Documentação
### Swagger
O endpoint `/api/documentation` permite acesso à interface do swagger.

### Postman
Na pasta `/postman` na raiz do projeto, se encontra o conjunto de chamadas da API.

> Ambas as ferramentas foram utilizadas, para não apenas disponibilizar a documentação, mas também a visualização facilitada dos retornos.

## 🏛️ Licença
<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/">
    <span property="dct:title">Desenvolvido</span> por <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://github.com/eduardo-moro">Eduardo Henrique de Paula Moro</a>, este projeto está protegido sob a licença  
    <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY-NC-ND 4.0</a>.
    <br/><span>Portanto, não pode ser comercializado por terceiros.</span>
</p>


<div align="right">
    <span>Feito com ❤️.</span>
</div>
