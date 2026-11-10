# language: pt
@autenticacao @login @saucedemo
Funcionalidade: Autenticação de Usuários no E-Commerce
  Como um cliente cadastrado no SauceDemo
  Quero realizar o login na plataforma
  Para acessar o catálogo de produtos e realizar compras

  @cenario_negativo @usuario_bloqueado
  Cenário: Recusa de acesso para usuário bloqueado
    Dado que o usuário esteja na página inicial de autenticação "https://www.saucedemo.com/"
    Quando preencher o campo de usuário com "locked_out_user"
    E preencher o campo de senha com "secret_sauce"
    E clicar no botão "Login"
    Então o sistema deve recusar o acesso e manter o usuário na rota "/"
    E exibir a mensagem de erro "Epic sadface: Sorry, this user has been locked out."
