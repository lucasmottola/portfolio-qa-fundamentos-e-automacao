# language: pt
@carrinho @checkout @e2e
Funcionalidade: Fluxo de Carrinho de Compras e Checkout no E-Commerce
  Como um cliente autenticado no SauceDemo
  Quero adicionar produtos ao carrinho e realizar o processo de checkout
  Para garantir a aquisição dos itens desejados com sucesso

  Contexto:
    Dado que o usuário esteja autenticado com o perfil "standard_user"
    E esteja na página inicial do catálogo de produtos "/inventory.html"

  @caminho_feliz @sucesso
  Cenário: CT-001 - Realizar compra de múltiplos produtos com sucesso
    Quando o usuário adicionar o produto "Sauce Labs Backpack" ao carrinho
    E adicionar o produto "Sauce Labs Bike Light" ao carrinho
    E acessar a página do carrinho de compras
    E clicar no botão "Checkout"
    E preencher as informações de entrega com o primeiro nome "Lucas", sobrenome "Mottola" e CEP "90000-000"
    E clicar no botão "Continue"
    E confirmar o resumo do pedido na página de visão geral
    E clicar no botão "Finish"
    Então o sistema deve exibir a confirmação de pedido com a mensagem "Thank you for your order!"
    E a rota atual deve ser "/checkout-complete.html"

  @regra_negocio @validacao_campos 
  Cenário: CT-002 - Validar que First Name é obrigatório
    Dado que o usuário adicionou um produto ao carrinho e acessou a tela de checkout
    Quando o usuário preencher o primeiro nome como "" sobrenome como "Mottola" e CEP como "90000-000"
    E clicar no botão "Continue"
    Então o sistema deve exibir a mensagem de erro "Error: First Name is required"
    E o usuário deve permanecer na tela de checkout "/checkout-step-one.html"

  @regra_negocio @validacao_campos 
  Cenário: CT-003 - Validar que Last Name é obrigatório
    Dado que o usuário adicionou um produto ao carrinho e acessou a tela de checkout
    Quando o usuário preencher o primeiro nome como "Lucas" sobrenome como "" e CEP como "90000-000"
    E clicar no botão "Continue"
    Então o sistema deve exibir a mensagem de erro "Error: Last Name is required"
    E o usuário deve permanecer na tela de checkout "/checkout-step-one.html"

  @regra_negocio @validacao_campos 
  Cenário: CT-004 - Validar que Postal Code é obrigatório
    Dado que o usuário adicionou um produto ao carrinho e acessou a tela de checkout
    Quando o usuário preencher o primeiro nome como "Lucas" sobrenome como "Mottola" e CEP como ""
    E clicar no botão "Continue"
    Então o sistema deve exibir a mensagem de erro "Error: Postal Code is required"
    E o usuário deve permanecer na tela de checkout "/checkout-step-one.html"
