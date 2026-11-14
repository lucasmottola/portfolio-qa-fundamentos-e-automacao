# language: pt
@cadastro @saas @usuarios
Funcionalidade: Cadastro de Nova Conta de Usuário
  Como um novo usuário de uma aplicação SaaS
  Quero realizar o meu cadastro na plataforma
  Para obter acesso aos recursos do sistema com segurança

  Contexto:
    Dado que o visitante esteja na página de registro "/cadastrarusuarios"

  @caminho_feliz @sucesso
  Cenário: Cadastro de usuário com dados válidos e senha forte
    Quando o visitante preencher o nome "Lucas Mottola", e-mail "lucas.qa2@teste.com" e senha "SenhaSegura123!"
    E marcar a opção de perfil "Administrador"
    E clicar no botão "Cadastrar"
    Então o sistema deve realizar o cadastro com sucesso
    E exibir a mensagem "Cadastro realizado com sucesso"
    E redirecionar o usuário para a página de login "/login"


  @regra_negocio @email_duplicado
  Cenário: Tentativa de cadastro com e-mail já existente no banco de dados
    Dado que o e-mail "usuario.existente@teste.com" já esteja cadastrado no sistema
    Quando o visitante tentar cadastrar uma nova conta utilizando o e-mail "usuario.existente@teste.com"
    E clicar no botão "Cadastrar"
    Então o sistema deve recusar o cadastro
    E exibir a mensagem de erro "Este email já está sendo usado"
