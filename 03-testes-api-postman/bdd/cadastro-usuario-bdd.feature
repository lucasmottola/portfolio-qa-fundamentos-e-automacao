# language: pt
@serverest @api @usuarios
Funcionalidade: Cadastro de usuários na API ServeRest
  Como consumidor da API ServeRest
  Quero enviar requisições para cadastrar usuários
  Para validar as respostas do endpoint de cadastro

  Contexto:
    Dado que a API ServeRest esteja disponível
    E que as requisições enviem dados no formato JSON

  @caminho_feliz
  Cenário: CT-CAD-01 - Cadastrar usuário com dados válidos
    Dado que tenho um e-mail de teste válido ainda não cadastrado
    Quando envio uma requisição POST para "/usuarios" com dados válidos de cadastro
    Então a resposta HTTP deve ser 201 Created
    E a resposta JSON deve conter a mensagem "Cadastro realizado com sucesso"
    E a resposta JSON deve conter um campo "_id" preenchido

  @regra_negocio @email_duplicado
  Cenário: CT-CAD-02 - Recusar cadastro com e-mail já cadastrado
    Dado que um usuário de teste foi cadastrado com sucesso pela API
    Quando envio outra requisição POST para "/usuarios" com o mesmo corpo e e-mail
    Então a resposta HTTP deve ser 400 Bad Request
    E a resposta JSON deve conter a mensagem "Este email já está sendo usado"
