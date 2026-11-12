
# Testes de API com Postman - ServeRest

## Objetivo

Este módulo reúne testes de API REST feitos com Postman na API pública ServeRest. Os cenários verificam login, validações no cadastro de usuários e operações de produtos.

## Arquivos

- `Serverest-API-Tests.postman_collection.json` - coleção Postman importável, Collection v2.1, com nove requisições e seus scripts de teste.
- `projeto-2.3-campo-obrigatorio-email.md` - caso de teste para cadastro sem o campo email.
- `projeto-2.4-senha-em-branco.md` - caso de teste para cadastro com senha em branco.
- `evidencias/` - capturas dos resultados dos testes, sem credenciais nem tokens.

## Configuração

1. Importe `Serverest-API-Tests.postman_collection.json` no Postman.
2. Crie ou selecione o ambiente `ServeRest - DEV`.
3. Defina a variável `baseUrl` como `https://serverest.dev`.
4. Deixe `token` sem valor inicial. A requisição de login válido salva o token no ambiente.
5. Confirme que `ServeRest - DEV` está selecionado no canto superior direito antes de executar as requisições.

O ambiente não é incluído no repositório. Não publique arquivos de ambiente, senhas, tokens ou capturas que mostrem esses valores.

## Cenários cobertos

- **Login válido:** `POST /login`; esperado `200 OK`, mensagem de sucesso e token retornado.
- **Login inválido:** `POST /login`; esperado `401 Unauthorized` e mensagem de credenciais inválidas.
- **Cadastro de usuário QA temporário:** esperado `201 Created`.
- **Cadastro sem email:** esperado `400 Bad Request` e mensagem de campo obrigatório.
- **Cadastro com senha em branco:** esperado `400 Bad Request` e mensagem de validação da senha.
- **Criar produto QA:** esperado `201 Created`; requer token de administrador.
- **Listar produtos:** esperado `200 OK`.
- **Atualizar produto QA:** esperado `200 OK`; requer token.
- **Excluir produto QA:** esperado `200 OK`; requer token.

Os scripts da coleção conferem status e conteúdo das respostas. Nos casos de validação, também verificam o formato esperado do erro.

## Ordem sugerida para executar

1. Selecione `ServeRest - DEV`.
2. Execute **Login - credenciais válidas** para gerar e salvar o token.
3. Execute os cenários de login inválido e cadastro.
4. Para o CRUD, execute **Criar produto QA**, **Listar produtos**, **Atualizar produto QA** e **Excluir produto QA**. Mantenha a ordem para trabalhar com o produto criado.
5. Confira o status HTTP e a aba **Test Results** de cada requisição.

## Resultados confirmados

- Login válido: `200 OK`, 3/3 testes aprovados.
- Login inválido: `401 Unauthorized`, 2/2 testes aprovados.
- CRUD de produtos: criação `201 Created`; listagem, atualização e exclusão `200 OK`.
- Validações de cadastro e schema: resultados esperados confirmados no Postman.


## Evidências de execução

### Login

- [Login válido - 200 OK, 3/3 testes aprovados](evidencias/login-valido.png)
- [Login inválido - 401 Unauthorized, 2/2 testes aprovados](evidencias/login-invalido.png)

### Cadastro e validações

- [Cadastro de usuário QA temporário](evidencias/cadastro-usuario-temporario.png)
- [Cadastro sem email - 400 Bad Request, 3/3 testes aprovados](evidencias/cadastro-email-obrigatorio.png)
- [Cadastro com senha em branco - 400 Bad Request, 3/3 testes aprovados](evidencias/cadastro-password-vazio.png)

### CRUD de produtos

- [Criar produto QA - 201 Created, 2/2 testes aprovados](evidencias/crud-criar-produto.png)
- [Listar produtos - 200 OK, 2/2 testes aprovados](evidencias/crud-listar-produtos.png)
- [Atualizar produto QA - 200 OK, 2/2 testes aprovados](evidencias/crud-atualizar-produto.png)
- [Excluir produto QA - 200 OK, 2/2 testes aprovados](evidencias/crud-excluir-produto.png)
