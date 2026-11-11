describe("Login — usuário bloqueado no SauceDemo", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("recusa o acesso e mostra uma mensagem", () => {
    cy.get('[data-test="username"]').type("locked_out_user");
    cy.get('[data-test="password"]').type("secret_sauce");
    cy.get('[data-test="login-button"]').click();

    cy.get('[data-test="error"]')
      .should("be.visible")
      .and(
        "contain.text",
        "Epic sadface: Sorry, this user has been locked out."
      );
  });
});
