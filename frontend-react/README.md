
# 🎨 Front-End 

## 📜 Descrição

Front-End desenvolvido em **React + Vite + Tailwind CSS**, responsável pela interface de montagem de cafés personalizados.

## 🏗️ Estrutura do Projeto

```
src/
 ┣ components/   ← Componentes reutilizáveis
 ┣ contexts/     ← Contextos globais (ex.: OrderContext)
 ┣ hooks/        ← Hooks personalizados
 ┣ pages/        ← Páginas da aplicação
 ┣ services/     ← Consumo de API
 ┣ types/        ← Tipagens TypeScript
 ┗ utils/        ← Funções utilitárias
```

## ▶️ Como rodar o Front-End individualmente (sem Docker)

Altere o arquivo `.env` na pasta `frontend-react/`:

```bash
VITE_API_URL=http://localhost:8080
```

Depois rode:

```bash
npm install
npm run dev
```

Aplicação disponível em: `http://localhost:5173`

---

## 🐳 Subir só o front-end via Docker

Execute a partir da pasta `docker/`. O banco e a API precisam estar rodando antes:

```bash
# Se banco e API ainda não estão no ar
docker compose up -d db api

# Sobe o front-end
docker compose up -d frontend
```

> O front-end só sobe após a API passar no healthcheck.
