# 🐳 Docker

## 📜 Descrição

Orquestra todos os serviços da aplicação via Docker Compose:

- API Spring Boot
- Front-End React
- Banco de dados PostgreSQL
- Cypress E2E (profile separado)

---

## 🏗️ Serviços e portas

| Serviço    | Porta | Observação                        |
|------------|-------|-----------------------------------|
| PostgreSQL | 5432  | healthcheck com `pg_isready`      |
| API        | 8080  | healthcheck no `/v3/api-docs`     |
| Front-End  | 5173  | sobe após API passar no healthcheck |
| Cypress    | —     | headless, profile `e2e`           |

---

## ▶️ Subir tudo (banco + API + front-end)

```bash
docker compose up -d --build
```

---

## 🔧 Subir serviços individualmente

```bash
# Só banco + API
docker compose up -d db api

# Só o front-end (banco e API devem estar rodando)
docker compose up -d frontend

# Cypress (banco, API e front-end devem estar rodando)
docker compose --profile e2e up cypress
```

---

## 🔄 Resetar o banco de dados

Apaga o volume do PostgreSQL e recria do zero. O seeder popula os dados iniciais automaticamente:

```bash
docker compose down -v && docker compose up -d db api
```

> Use este comando sempre que o banco estiver com dados corrompidos (ex: após rodar o Schemathesis).

---

## 🛑 Parar todos os serviços

```bash
# Para os containers mas mantém os volumes (dados preservados)
docker compose down

# Para os containers e apaga os volumes (dados perdidos)
docker compose down -v
```
