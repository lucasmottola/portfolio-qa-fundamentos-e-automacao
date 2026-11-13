
## Projeto 3.1 - Login com usuário bloqueado

### Objetivo

Automatizar o cenário em que um usuário bloqueado tenta entrar no SauceDemo.
O teste confirma que o acesso é recusado e que a interface apresenta uma
mensagem de bloqueio.

### Caso automatizado

- **Arquivo:** `cypress/e2e/login-locked-user.cy.js`
- **Tipo:** teste de interface (UI), funcional e negativo.
- **Resultado esperado:** o formulário permanece na página de login e exibe
  a mensagem de usuário bloqueado.
- **Resultado obtido:** a mensagem esperada foi exibida.
- **Status:** PASSOU.

### Como executar

```bash
npm ci
npx cypress run --spec "cypress/e2e/login-locked-user.cy.js"
```


### Resultado da execução

Executado em 11/11/2026 com Node.js 24.18.1, Cypress 16.3.0 e
Electron headless. Resultado: **1 teste aprovado, 0 falhas**.

O Cypress mostrou um aviso de que Electron está depreciado como navegador
de teste e poderá ser removido em uma versão futura. O aviso não impediu
a execução.

### Observação

O SauceDemo é um site de demonstração. As credenciais usadas são as públicas
do exercício; não use senhas pessoais.


## Projeto 3.2 - Checkout de dois produtos

- **Arquivo:** `cypress/e2e/checkout.cy.js`
- **Comando:** `npx cypress run`, executado na pasta `04-automacao-cypress`.
- **Última execução:** 13/11/2026.
- **Ambiente:** Fedora Linux, Node.js 24.18.1, Cypress 16.3.0, Electron headless.
- **Resultado deste cenário:** 1 teste aprovado, 0 falhas.
- **Resultado da suíte completa:** 2 arquivos de teste executados, 2 testes aprovados, 0 falhas.
- **Confirmação do checkout:** `Thank you for your order!`
- **Aviso:** o Cypress informou que Electron está depreciado como navegador de teste. O aviso não impediu a execução.
- **Evidência:** saída do Cypress no terminal. Não foram gerados screenshots nem vídeo nesta execução.
