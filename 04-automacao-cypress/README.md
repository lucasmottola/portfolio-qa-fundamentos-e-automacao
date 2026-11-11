
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
