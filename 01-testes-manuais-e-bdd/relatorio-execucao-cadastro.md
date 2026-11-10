# Relatório de Execução de Teste - Cadastro de Usuário (SaaS) 

## Informações Gerais
* **Projeto:** Plataforma SaaS (ServeRest)
* **Funcionalidade:** Registro de Novos Usuários (`/cadastrarusuarios`)
* **Técnica Aplicada:** Regra de Unicidade (e-mail já existente)
* **QA Responsável:** Lucas Doege Mottola
* **Status Geral:** PASSOU (100% de Aprovação)

## Cobertura de Testes
| ID | Cenário de Teste | Técnica / Regra | Status |
| :--- | :--- | :--- | :--- |
| **CT-CAD-01** | Cadastro de usuário com dados válidos | Happy Path | PASS |
| **CT-CAD-02** | Validação de e-mail duplicado na base | Regra de Unicidade | PASS |
