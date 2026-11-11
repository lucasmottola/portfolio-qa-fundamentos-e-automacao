/*
 * P3.2 — Checkout E2E no SauceDemo
 *
 * Como usar este arquivo:
 * 1. Na raiz do repositório, confirme que a pasta do projeto contém
 *    04-automacao-cypress/cypress.config.js e package.json.
 * 2. Baixe este arquivo e salve-o no seu clone como
 *    04-automacao-cypress/cypress/e2e/checkout.cy.js.
 * 3. Não use a cópia aninhada vazia
 *    04-automacao-cypress/04-automacao-cypress/cypress/e2e/.
 * 4. Antes de registrar o teste como aprovado, valide no SauceDemo se os
 *    seletores data-test e os resultados esperados ainda correspondem à tela.
 *
 * Este spec não foi executado durante sua preparação. Ele usa as credenciais
 * públicas de demonstração do SauceDemo, nunca credenciais pessoais.
 * A asserção final usa como hipótese o texto literal da captura publicada.
 * A feature BDD diverge em caixa e pontuação: mantenha o caso bloqueado até
 * confirmar o critério aprovado e alinhar a feature com o resultado esperado.
 */

describe("Checkout — compra de dois produtos no SauceDemo", () => {
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