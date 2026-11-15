# Testes de API com Postman - ServeRest

Este módulo reúne testes de API executados no Postman contra a API pública de demonstração ServeRest. A coleção verifica autenticação, cadastro de usuários, validações de dados e operações CRUD de produtos.

> As requisições foram executadas no Postman. A feature Gherkin deste módulo documenta os casos de cadastro, mas não foi executada por um runner BDD.

## Conteúdo do módulo

- `Serverest-API-Tests.postman_collection.json` - coleção Postman em formato Collection v2.1, com 11 requisições e scripts de validação.
- `bdd/cadastro-usuario-bdd.feature` - especificação Gherkin para cadastro válido e tentativa de cadastro com e-mail já existente.
- `bdd/relatorio-execucao-cadastro.md` - resultados observados para os casos CT-CAD-01 e CT-CAD-02.
- `projeto-2.3-campo-obrigatorio-email.md` - caso de teste para cadastro sem o campo `email`.
- `projeto-2.4-senha-em-branco.md` - caso de teste para cadastro com senha em branco.
- `evidencias/` - capturas de execução do Postman.

## O que os testes verificam

### Login

- **Credenciais válidas:** `POST /login`; resultado observado `200 OK`, mensagem de sucesso e token salvo no ambiente. Resultado registrado: 3/3 testes aprovados.
- **Credenciais inválidas:** `POST /login`; resultado observado `401 Unauthorized` e mensagem de credenciais inválidas. Resultado registrado: 2/2 testes aprovados.

### Cadastro de usuários

- **CT-CAD-01 - Cadastro válido:** `POST /usuarios`; resposta observada `201 Created`, mensagem de sucesso e identificador `_id`. Resultado registrado: 2/2 testes aprovados.
- **CT-CAD-02 - E-mail já cadastrado:** primeiro execute a requisição **Preparação - usuário para CT-CAD-02** com um e-mail de teste ainda não cadastrado. Depois envie **CT-CAD-02 - email já cadastrado** com o mesmo corpo e o mesmo e-mail. A resposta observada foi `400 Bad Request`, com a mensagem `Este email já está sendo usado`; 2/2 testes aprovados.
- **E-mail ausente:** `POST /usuarios`; resposta observada `400 Bad Request`, com validação do campo obrigatório e do formato JSON do erro. Resultado registrado: 3/3 testes aprovados.
- **Senha em branco:** `POST /usuarios`; resposta observada `400 Bad Request`, com validação do campo e do formato JSON do erro. Resultado registrado: 3/3 testes aprovados.

No CT-CAD-02, o `400 Bad Request` é o resultado esperado do cenário negativo: a API rejeita o segundo cadastro com o mesmo e-mail. Para repetir o teste, use um novo e-mail fictício na preparação e mantenha exatamente o mesmo corpo na requisição de duplicidade. Não reutilize e-mail pessoal ou senha pessoal.

### Produtos

- **Criar produto QA:** `POST /produtos`; resultado observado `201 Created`. O script salva o identificador do produto no ambiente.
- **Listar produtos:** `GET /produtos`; resultado observado `200 OK`.
- **Atualizar produto QA:** `PUT /produtos/{{produtoId}}`; resultado observado `200 OK`.
- **Excluir produto QA:** `DELETE /produtos/{{produtoId}}`; resultado observado `200 OK`.

As requisições de criação, atualização e exclusão exigem token de administrador. A ordem recomendada para o CRUD é criar, listar, atualizar e excluir.

## Como configurar o Postman

1. Importe `Serverest-API-Tests.postman_collection.json` no Postman.
2. Crie ou selecione o ambiente `ServeRest - DEV`.
3. Configure `baseUrl` com `https://serverest.dev`.
4. Deixe `token` sem valor inicial. A requisição **Login - credenciais válidas** salva o token retornado no ambiente.
5. Confirme que `ServeRest - DEV` está selecionado no canto superior direito antes de enviar as requisições.

O arquivo do ambiente não faz parte do repositório. Não publique ambiente exportado, token, senha ou capturas que revelem esses valores.

## Ordem sugerida de execução

1. Execute **Login - credenciais válidas** para obter o token.
2. Execute **Login - credenciais inválidas**.
3. Execute os testes de cadastro: CT-CAD-01, preparação e CT-CAD-02, e depois os casos de e-mail ausente e senha em branco.
4. Execute o CRUD de produtos nesta ordem: criar, listar, atualizar e excluir.
5. Em cada requisição, confira o status HTTP, o corpo da resposta e a aba **Test Results**.

A requisição de preparação do CT-CAD-02 cria um usuário descartável na API pública. Execute-a uma vez para cada e-mail novo; a segunda requisição precisa reutilizar o mesmo e-mail para exercitar a regra de duplicidade.

## Evidências

### Login

- [Login válido - 200 OK, 3/3 testes aprovados](evidencias/login-valido.png)
- [Login inválido - 401 Unauthorized, 2/2 testes aprovados](evidencias/login-invalido.png)

### Cadastro e validações

- [Cadastro de usuário QA temporário - 201 Created](evidencias/cadastro-usuario-temporario.png)
- [Cadastro sem e-mail - 400 Bad Request, 3/3 testes aprovados](evidencias/cadastro-email-obrigatorio.png)
- [Projeto 2.3 - detalhes do caso, schema e resultado](projeto-2.3-campo-obrigatorio-email.md)
- [Cadastro com senha em branco - 400 Bad Request, 3/3 testes aprovados](evidencias/cadastro-password-vazio.png)
- [CT-CAD-02 - resposta da API para e-mail duplicado](evidencias/cadastro-email-duplicado-resposta.png)
- [CT-CAD-02 - 2/2 testes Postman aprovados](evidencias/cadastro-email-duplicado-testes.png)

### CRUD de produtos

- [Criar produto QA - 201 Created, 2/2 testes aprovados](evidencias/crud-criar-produto.png)
- [Listar produtos - 200 OK, 2/2 testes aprovados](evidencias/crud-listar-produtos.png)
- [Atualizar produto QA - 200 OK, 2/2 testes aprovados](evidencias/crud-atualizar-produto.png)
- [Excluir produto QA - 200 OK, 2/2 testes aprovados](evidencias/crud-excluir-produto.png)
