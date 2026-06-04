
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

## ▶️ Como rodar a API localmente

```bash
cd api-coffee
./mvnw spring-boot:run
```

API disponível em: `http://localhost:8080`
