/*
 * Projeto 3.2 - Checkout E2E no SauceDemo
 *
 * O teste adiciona dois produtos ao carrinho, preenche os dados de entrega,
 * conclui o pedido e verifica a página de confirmação.
 *
 * Execução confirmada em 11/11/2026: 1 teste aprovado, 0 falhas.
 * Ambiente registrado: Fedora Linux, Node.js 24.18.1 e Cypress 16.3.0.
 * Mensagem validada: "Thank you for your order!"
 *
 * Use apenas as credenciais públicas de demonstração do SauceDemo.
 */


describe("Checkout - compra de dois produtos no SauceDemo", () => {
  beforeEach(() => {
    // A configuração do projeto define baseUrl como https://www.saucedemo.com.
    // Limpa o estado deste domínio e recarrega a página antes de cada teste.
    cy.visit("/");
    cy.clearCookies();
    cy.clearLocalStorage();
    cy.reload();

    cy.get('[data-test="username"]')
      .should("be.visible")
      .type("standard_user");
    cy.get('[data-test="password"]')
      .should("be.visible")
      .type("secret_sauce");
    cy.get('[data-test="login-button"]').click();

    // Confirma que o login chegou ao catálogo antes de começar o checkout.
    cy.url().should("include", "/inventory.html");
  });

  it("adiciona dois produtos e conclui a compra", () => {
    cy.get('[data-test="add-to-cart-sauce-labs-backpack"]')
      .should("be.visible")
      .click();
    cy.get('[data-test="add-to-cart-sauce-labs-bike-light"]')
      .should("be.visible")
      .click();

    cy.get('[data-test="shopping-cart-badge"]').should("have.text", "2");
    cy.get('[data-test="shopping-cart-link"]').click();
    cy.url().should("include", "/cart.html");

    cy.get('[data-test="inventory-item-name"]').should("have.length", 2);
    cy.contains(
      '[data-test="inventory-item-name"]',
      "Sauce Labs Backpack"
    ).should("be.visible");
    cy.contains(
      '[data-test="inventory-item-name"]',
      "Sauce Labs Bike Light"
    ).should("be.visible");

    cy.get('[data-test="checkout"]').click();
    cy.url().should("include", "/checkout-step-one.html");

    cy.get('[data-test="firstName"]')
      .should("be.visible")
      .type("QA");
    cy.get('[data-test="lastName"]')
      .should("be.visible")
      .type("Portfolio");
    cy.get('[data-test="postalCode"]')
      .should("be.visible")
      .type("90000-000");
    cy.get('[data-test="continue"]').click();

    cy.url().should("include", "/checkout-step-two.html");
    cy.get('[data-test="inventory-item-name"]').should("have.length", 2);
    cy.contains(
      '[data-test="inventory-item-name"]',
      "Sauce Labs Backpack"
    ).should("be.visible");
    cy.contains(
      '[data-test="inventory-item-name"]',
      "Sauce Labs Bike Light"
    ).should("be.visible");

    cy.get('[data-test="finish"]').click();
    cy.url().should("include", "/checkout-complete.html");

    cy.get('[data-test="complete-header"]')
      .should("be.visible")
      .and("have.text", "Thank you for your order!");
  });
});