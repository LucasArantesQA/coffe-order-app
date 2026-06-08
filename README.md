
# ☕️ Coffee Order App

## 🚀 Descrição do Projeto

Sistema Fullstack para montagem de cafés personalizados, incluindo:

- 🔸 Validação de sabores clássicos.
- 🔸 Montagem de cafés personalizados.
- 🔸 Cálculo dinâmico de preços com regras de negócio.
- 🔸 Testes automatizados e pipeline pronto para validação.

## 🛠️ Tecnologias Utilizadas

- **Back-End:** Java, Spring Boot, JPA, Hibernate, PostgreSQL, JUnit, Docker.
- **Front-End:** React + Vite + Tailwind CSS, TypeScript.
- **Testes:** Cypress (E2E + API), Cucumber (BDD).
- **Outros:** Docker Compose, Swagger, Postman.

## 📂 Organização do Projeto

| Pasta            | Descrição                                               |
|------------------|---------------------------------------------------------|
| `/api-coffee`    | API REST Java Spring Boot com PostgreSQL               |
| `/frontend-react`| Front-End em React + Vite + Tailwind                   |
| `/docker`        | Configurações Docker + Docker Compose                  |
| `/testes-e2e`    | Testes E2E e API com Cypress + Cucumber (BDD)          |

Cada módulo possui um README específico com detalhes técnicos e instruções.

## 🔗 Links dos Repositórios

- 🔗 [API — api-coffee](./api-coffee/README.md)
- 🔗 [Front-End — frontend-react](./frontend-react/README.md)
- 🔗 [Testes E2E/API — testes-e2e](./tests-e2e/README.md)
- 🔗 [Docker — docker](./docker/README.md)

##  Executar o Projeto com Poucos Comandos

# ⚙️ Pré-requisitos
- [Docker + Docker Compose](https://docs.docker.com/get-docker/) instalados 
- Clonagem dos repositórios dos microsserviços no mesmo nível de pasta (estrutura abaixo)
```bash
📁 meu-workspace/
 ┣ 📁 api-coffee/
 ┣ 📁 frontend-react/
 ┣ 📁 docker/
 ┣ 📁 testes-e2e/
```

> ⚠️ O `docker-compose.yml` usa caminhos relativos, então mantenha os repositórios no mesmo nível de diretório.


##  1 Clone o projeto
```bash
git clone https://github.com/SENAI-SD/qa-junior-01452-2025-147.934.946-17.git
cd qa-junior-01452-2025-147.934.946-17
```

## 2 Execute o Docker Compose

```bash
cd docker
docker compose up -d --build
```

✔️ Esse comando executa:

- PostgreSQL → `localhost:5432`
- API → `http://localhost:8080/swagger-ui/index.html`
- Front-End → `http://localhost:5173`

> O Cypress **não sobe automaticamente** neste comando. Para rodá-lo, veja a seção abaixo.

---

## 🐳 Subir serviços individualmente

Todos os comandos devem ser executados a partir da pasta `docker/`.

### Só o banco + API (sem front-end)
```bash
docker compose up -d db api
```

### Adicionar o front-end depois
```bash
docker compose up -d frontend
```

### Rodar o Cypress (E2E)
O Cypress usa um profile separado para não subir por acidente.
```bash
docker compose --profile e2e up cypress
```

---

## 🔄 Resetar o banco de dados

Use este comando para apagar todos os dados e recriar o banco do zero com o seeder:

```bash
docker compose down -v && docker compose up -d db api
```

> O `-v` remove o volume do PostgreSQL. Na próxima subida o banco é recriado limpo e o seeder popula os dados iniciais automaticamente.

---

### 🔧 Executar módulos individualmente (sem Docker)

- Consulte os respectivos READMEs:
  - 🔗 [API — api-coffee](./api-coffee/README.md)
  - 🔗 [Front-End — frontend-react](./frontend-react/README.md)
  - 🔗 [Testes E2E/API — tests-e2e](./tests-e2e/README.md)


## 🚨 Observações e Melhorias 

-  Melhorias sugeridas: 
   - Autenticação JWT com controle de roles, protegendo rotas como /admin contra acesso público.
      -  Spring Security dependecy
      - Endpoints de login, register e password_recovery
      - User Model e Auth Service
      - Perfis de acesso (ex.: `ROLE_ADMIN`, `ROLE_USER`).

  - Ajuste dos códigos HTTP da API:
    - POST → 201 Created (atualmente retorna 200).
    - DELETE → 204 No Content (atualmente retorna 200).

Essas melhorias não foram aplicadas por foco na entrega funcional da prova, mas são práticas essencial em APIs profissionais, alinhando aos padrões REST e segurança OWASP

## 🐞 Relatório de Bug 

O relatório detalhado dos bugs encontrados, incluindo descrição, caminhos de reprodução, severidade, prioridade e evidências, está disponível no link abaixo:

🔗 [Acessar Relatório de Bugs - Google Docs](https://docs.google.com/document/d/1biyaHlkdRKxAr6qG27RIAxO4JXRTnqVYQWIcRWJ5UZE/edit?usp=sharing)


## Requisitos Não Atendidos 

-  Migrations não foram utilizados. Utilizamos Hibernate + JPA diretamente, por maior domínio na tecnologia, acelerando o desenvolvimento do back-end.

##  Plano de Testes e Estratégia

Toda a suíte de testes manuais está documentada e pode ser acessada na planilha abaixo:

👉 [Acessar Plano de Testes Manual e Acompanhamento de Bugs](https://docs.google.com/spreadsheets/d/1mFwIftxz8ImZCbSdEv4E5f-ABT1Vm-cWAxBKE5fCCx8/edit?gid=0#gid=0g)

- Criação de testes manuais baseados nos requisitos, regras de negócio e variações identificadas durante o desenvolvimento.
- Acompanhamento dos testes e dos bugs relacionados, incluindo evidências, classificação por severidade/prioridade e status.
- Documentação completa no Google Docs com detalhes técnicos e prints das ocorrências.

- Foi adotada uma abordagem de testes **caixa branca**, focada na validação de fluxos críticos, regras de negócio e comportamento da aplicação, alinhada com os requisitos funcionais e não funcionais.

- A planilha é essencial para **testes regressivos**, pois garante que funcionalidades já implementadas sejam revalidadas após correções, dividindo em baterias de testes e validações em diferentes ambientes


### 🛠️ Ferramentas e Processo

- Gestão dos testes: Planilha Google compartilhada.
- Evidências: Google Drive 
- Correções: Pull Requests no GitHub.

> Esta documentação garante rastreabilidade e controle completo sobre os testes manuais executados no projeto.

## 🧾 Especificações em Gherkin 

- 🔗 Arquivos .feature versionados em /testes-e2e/cypress/e2e/


## 👨‍💻 Autor

**Lucas Arantes**  
Coffee Order App — Analista de Qualidade de Software Júnior
