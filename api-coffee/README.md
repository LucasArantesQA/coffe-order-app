
# 🚀 API 

## 📜 Descrição

API REST desenvolvida em **Java com Spring Boot**, responsável pela gestão dos pedidos de café, sabores clássicos, ingredientes e cálculo de preços.

## 🔧 Arquitetura

- **Model:** Representação das entidades (Ingredient, Flavor, CoffeeOrder).
- **Repository:** Interfaces JPA para persistência dos dados.
- **Service:** Contém a lógica de negócio (validação, cálculos, regras).
- **Controller:** Exposição dos endpoints REST.


## ⚙️ Pré-requisitos

- ✔️ Java 17+
- ✔️ Maven 3.9+ (ou usar o wrapper ./mvnw incluído no projeto)
- ✔️ Banco de dados PostgreSQL rodando ( via Docker )
- ✔️ IDE ou editor de sua preferência (IntelliJ, VSCode, Eclipse, etc.)
- ✔️ Docker (opcional, se quiser rodar tudo via containers)

🔸 Observação: Caso deseje rodar a API localmente, sem Docker, será necessário configurar corretamente o arquivo application.properties:

```bash
spring.datasource.url=jdbc:postgresql://localhost:5432/coffee-db
```

## 🧪 Testes Unitários

- Implementados com **JUnit + Mockito**.
- Cobrem regras de negócio, validações e casos de exceção.

```bash
cd api-coffee
./mvnw test
```


## 📮 Documentação de API

- Swagger disponível em:  
`http://localhost:8080/swagger-ui/index.html`

## 🔗 Postman Collection

- A collection Postman está na raiz da API:  
`/api-coffee/postman_collection.json`

## ▶️ Como rodar a API localmente (sem Docker)

```bash
# Necessário ter PostgreSQL rodando em localhost:5432
# e o application.properties apontando para localhost

./mvnw spring-boot:run
```

API disponível em: `http://localhost:8080`

---

## 🐳 Subir só a API via Docker

Execute a partir da pasta `docker/`:

```bash
# Sobe o banco e a API (sem front-end e sem cypress)
docker compose up -d db api
```

A API ficará disponível em `http://localhost:8080` e o Swagger em `http://localhost:8080/swagger-ui/index.html`.

---

## 🔄 Resetar o banco de dados

Para apagar todos os dados (inclusive os inseridos pelo Schemathesis) e recriar do zero:

```bash
# Execute na pasta docker/
docker compose down -v && docker compose up -d db api
```

> O seeder roda automaticamente ao subir a API com o banco vazio e popula os ingredientes e sabores clássicos iniciais.
>
> Se o banco tiver dados corrompidos (campos `null`), o seeder os remove automaticamente no startup — sem precisar derrubar o banco.
