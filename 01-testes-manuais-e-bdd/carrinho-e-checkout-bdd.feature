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
  Cenário: Realizar compra de múltiplos produtos com sucesso
    Quando o usuário adicionar o produto "Sauce Labs Backpack" ao carrinho
    E adicionar o produto "Sauce Labs Bike Light" ao carrinho
    E acessar a página do carrinho de compras
    E clicar no botão "Checkout"
    E preencher as informações de entrega com o primeiro nome "Lucas", sobrenome "Mottola" e CEP "90000-000"
    E clicar no botão "Continue"
    E confirmar o resumo do pedido na página de visão geral
    E clicar no botão "Finish"
    Então o sistema deve exibir a confirmação de pedido com a mensagem "THANK YOU FOR YOUR ORDER"
    E a rota atual deve ser "/checkout-complete.html"

  @regra_negocio @validacao_campos
  Esquema do Cenário: Validação de campos obrigatórios no formulário de checkout
    Dado que o usuário adicionou um produto ao carrinho e acessou a tela de checkout
    Quando o usuário preencher o primeiro nome como "<primeiro_nome>", sobrenome como "<sobrenome>" e CEP como "<cep>"
    E clicar no botão "Continue"
    Então o sistema deve exibir a mensagem de erro "<mensagem_erro>"
    E o usuário deve permanecer na tela de checkout "/checkout-step-one.html"

    Exemplos:
      | primeiro_nome | sobrenome | cep       | mensagem_erro                  |
      |               | Mottola   | 90000-000 | Error: First Name is required  |
      | Lucas         |           | 90000-000 | Error: Last Name is required   |
      | Lucas         | Mottola   |           | Error: Postal Code is required |
