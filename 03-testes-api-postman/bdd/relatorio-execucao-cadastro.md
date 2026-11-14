# Relatório de execução - cadastro de usuários na API ServeRest

## Objetivo

Registrar os resultados dos casos de teste de cadastro de usuários da API ServeRest.

## Dados da execução

- **API:** ServeRest
- **Endpoint:** `POST /usuarios`
- **Ferramenta:** Postman
- **Ambiente selecionado:** `ServeRest - DEV`
- **Data da execução:** 14/11/2026
- **Especificação:** [`cadastro-usuario-bdd.feature`](cadastro-usuario-bdd.feature)

> A feature Gherkin documenta os cenários. Os resultados abaixo foram executados e validados no Postman; a feature não foi executada por um runner Gherkin.

## Resultados

### CT-CAD-01 - Cadastrar usuário com dados válidos

- **Resultado observado:** `201 Created`; mensagem de cadastro realizado com sucesso.
- **Testes Postman:** 2/2 aprovados.
- **Status:** PASSOU.

### CT-CAD-02 - Recusar cadastro com e-mail já cadastrado

- **Pré-condição:** a requisição de preparação cadastrou um usuário de teste e retornou `201 Created`.
- **Execução:** a requisição CT-CAD-02 foi enviada ao mesmo endpoint com o mesmo corpo e o mesmo e-mail da preparação.
- **Resultado observado:** `400 Bad Request`; mensagem `Este email já está sendo usado`.
- **Testes Postman:** 2/2 aprovados.
- **Status:** PASSOU. O status 400 era o resultado esperado para esse cenário negativo.

## Evidências

- [CT-CAD-01 — cadastro válido](../evidencias/cadastro-usuario-temporario.png)
- [CT-CAD-02 — resultados dos testes Postman](../evidencias/cadastro-email-duplicado-testes.png)
- [CT-CAD-02 — resposta da API](../evidencias/cadastro-email-duplicado-resposta.png)
