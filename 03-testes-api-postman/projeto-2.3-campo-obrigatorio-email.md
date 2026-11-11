# Projeto 2.3 — Cadastro sem campo obrigatório

## Objetivo

Verificar se a API rejeita o cadastro de um usuário quando a propriedade
`email` é omitida e se identifica o campo obrigatório na resposta.

## Ambiente e requisição

- **API:** ServeRest
- **Ambiente:** ServeRest - DEV
- **Método:** POST
- **Endpoint:** `{{baseUrl}}/usuarios`
- **Autorização:** No Auth
- **Corpo:** JSON de teste sem a propriedade `email`.
- **Dados:** fictícios; nenhum token foi necessário.

## Caso de teste

| ID | Cenário | Resultado esperado | Resultado obtido | Status |
|---|---|---|---|---|
| TC-API-2.3-001 | Enviar cadastro sem `email` | HTTP 400 e indicação de que `email` é obrigatório | HTTP 400; resposta: `{"email":"email é obrigatório"}` | PASSOU |

## Verificações no Postman

- `Status code é 400 Bad Request` — **PASSOU**
- `Resposta informa que email é obrigatório` — **PASSOU**

## Observação

Na primeira tentativa, a URL continha um espaço no final, representado como `%20`,
e a API informou que não reconhecia aquela rota. A URL foi corrigida antes da
execução registrada acima. Essa tentativa não foi considerada falha da API.

## Escopo e limitações

Este caso valida somente a ausência do campo `email`. Outros campos, formatos de
e-mail e regras de cadastro precisam de casos próprios e devem ser avaliados conforme
o contrato atual da API.

## Evidência
2.3 - email é obrigatório.png

