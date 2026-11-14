# Portfólio de Engenharia de Qualidade de Software

Este repositório reúne exercícios práticos de qualidade de software. O foco é compreender requisitos, planejar cenários de teste, executar verificações e registrar resultados com evidências.

Os exercícios de interface usam o SauceDemo. Os testes de API usam a ServeRest. São aplicações de demonstração distintas, sem integração entre si neste portfólio.

## Módulos publicados

### 01. Testes manuais e BDD

Cenários de login, carrinho e checkout descritos em Gherkin, acompanhados por relatórios e capturas de execução.

- [Feature de login com usuário bloqueado](01-testes-manuais-e-bdd/login-locked-user-bdd.feature)
- [Feature de carrinho e checkout](01-testes-manuais-e-bdd/carrinho-e-checkout-bdd.feature)
- [Relatório de execução do login](01-testes-manuais-e-bdd/relatorio-execucao-login.md)
- [Relatório de execução do checkout](01-testes-manuais-e-bdd/relatorio-execucao-checkout.md)

Os arquivos Gherkin documentam comportamentos. Eles não são executados por um runner BDD neste repositório.

### 03. Testes de API com Postman

Coleção importável para autenticação, cadastro de usuários, validações de dados e operações CRUD de produtos.

- [README do módulo API e Postman](03-testes-api-postman/README.md)
- [Coleção Postman Collection v2.1](03-testes-api-postman/Serverest-API-Tests.postman_collection.json)
- [Feature de cadastro na ServeRest](03-testes-api-postman/bdd/cadastro-usuario-bdd.feature)

### 04. Automação web com Cypress

Testes de interface com JavaScript e Cypress para login com usuário bloqueado e checkout.

- [README do módulo Cypress](04-automacao-cypress/README.md)
- [Teste Cypress de login bloqueado](04-automacao-cypress/cypress/e2e/login-locked-user.cy.js)
- [Teste Cypress de checkout](04-automacao-cypress/cypress/e2e/checkout.cy.js)

Para instalar as dependências e executar os testes, use o terminal na pasta `04-automacao-cypress`:

```bash
npm ci
npm test
```

## Escopo e evidências

A pasta `02-bug-reports` não faz parte da versão atual do repositório. Por isso, esta página lista somente os módulos que estão publicados.

Consulte o README de cada módulo para os passos de execução, os resultados registrados e as evidências. Os resultados descrevem execuções documentadas nas datas indicadas e podem mudar se as aplicações de demonstração forem atualizadas.
