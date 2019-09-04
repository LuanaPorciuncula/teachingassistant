Feature: Auto-avaliação
  As a Aluno
  I want to Me auto-avaliar e ver a avaliação do professor quanto a mim
  so that Eu possa comparar como eu acho que deveria ter ido e como o professor acha que fui


Scenario: Concluindo o preenchimento de uma auto-avaliação bem sucedido
    Given Eu estou na página de “auto-avaliação”
    And Eu estou logado como “aluno” com o nome de usuário “Fulano da Silva”
    And Eu vejo os conceitos “Requisitos”, “Gerência de configuração”, “Gerência de projetos”, “Testes”, “Projeto e implementação” e “Refatoração”, para fazer minha auto-avaliação
    When Eu me auto-avalio com “MA”, “MA”, “MANA”, “MPA”, “MA” e “MA”, respectivamente
    And Eu concluo a operação
    Then Eu estou na página de “auto-avaliação”
    And Uma mensagem aparecerá na tela, informando que a operação foi bem sucedida
    And Eu vejo minha auto-avaliação “MA”, “MA”, “MANA”, “MPA”, “MA” e “MA”

Scenario: Concluindo o preenchimento de uma auto-avaliação bem sucedido
  Given Eu faço uma requisição ao sistema como “aluno” com o nome de usuário “Fulano da Silva”
  When Eu me auto-avalio com “MA”, “MA”, “MANA”, “MPA”, “MA” e “MA”, respectivamente
  And Peço para o sistema concluir a operação de auto-avaliação
  Then O sistema verifica que todos os conceitos foram auto-avaliados
  And O sistema salva “MA”, “MA”, “MANA”, “MPA”, “MA” e “MA” na auto-avaliação do aluno “Fulano da Silva”
  And O sistema informa que a operação foi bem sucedida
