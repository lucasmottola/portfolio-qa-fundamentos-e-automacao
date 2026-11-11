# Projeto 2.4 - Cadastro com senha em branco

## Objetivo

Verificar se a API rejeita o cadastro quando `password` está presente,
mas contém uma string vazia.

## Requisição

- **API:** ServeRest
- **Ambiente:** ServeRest - DEV
- **Método:** POST
- **Endpoint:** `{{baseUrl}}/usuarios`
- **Autorização:** No Auth
- **Corpo:** dados fictícios; `password` com valor `""`.

## Caso de teste

| ID | Cenário | Resultado esperado | Resultado obtido | Status |
|---|---|---|---|---|
| TC-API-2.4-001 | Cadastrar usuário com senha em branco | HTTP 400 e mensagem indicando que a senha não pode ficar em branco | HTTP 400; `{"password":"password não pode ficar em branco"}` | PASSOU |

## Testes no Postman

- `Status code é 400 Bad Request` — **PASSOU**
- `Resposta informa que a senha não pode ficar em branco` — **PASSOU**
- `Resposta de erro segue o schema de password` — **PASSOU**

## Schema validado

```javascript
var schemaErroSenha = {
  type: "object",
  required: ["password"],
  properties: {
    password: {
      type: "string"
    }
  }
};

