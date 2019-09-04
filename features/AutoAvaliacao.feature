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

Scenario: Concluindo o preenchimento de uma auto-avaliação mal sucedido devido a ausência de conceitos para pelo menos uma meta
  Given Eu estou na página de “auto-avaliação”
  And Eu estou logado como “aluno” com o nome de usuário “Fulano da Silva”
  And Eu vejo os conceitos “Requisitos”, “Gerência de configuração”, “Gerência de projetos”, “Testes”, “Projeto e implementação” e “Refatoração”, para fazer minha auto-avaliação
  When Eu me auto-avalio com “MA”, “MA”, “MANA”, “MPA”, “MA” e “”, respectivamente
  And Eu concluo a operação
  Then Eu estou na página de “auto-avaliação”
  And O sistema não salva a auto-avaliação do aluno “Fulano da Silva”
  And Uma mensagem aparecerá na tela, informando que a operação foi mal sucedida e instruindo a auto-avaliar todos os conceitos para concluir a operação.

Scenario: Concluindo o preenchimento de uma auto-avaliação mal sucedido devido a ausência de conceitos para pelo menos uma meta
  Given Eu faço uma requisição ao sistema como “aluno” com o nome de usuário “Fulano da Silva”
  When Eu me auto-avalio com “MA”, “MA”, “MANA”, “MPA”, “MA” e “”, respectivamente
  And Peço para o sistema concluir a operação de auto-avaliação
  Then O sistema verifica que pelo menos um campo não foi auto-avaliado
  And O sistema informa que a operação foi mal sucedida e que a causa foi que pelo menos um campo não foi auto-avaliado

Scenario: Visualizar auto-avaliações discrepantes com nenhum aluno discrepante
  Given Eu estou na página de “auto-avaliação”
  And Eu estou logado como “professor” com o nome de usuário “Sicrano de Souza”
  And Eu vejo uma lista de alunos com suas respectivas auto-avaliações nas metas  “Requisitos”, “Gerência de configuração”, “Gerência de projetos”, “Testes” e “Projeto e implementação” com 3 alunos, “Fulano da Silva” com as auto-avaliações “superior”, “igual”, ”igual”, ”igual” e “igual”, “Beltrano dos Santos” com as auto-avaliações “inferior”, “inferior”, “inferior”, “inferior” e “inferior” e Maria Oliveira com as auto-avaliações “igual”, “igual”, ”igual”, ”igual” e “igual”.
  When Eu seleciono a opção de “auto-avaliações discrepantes”
  Then Eu sou levado para a página de “auto-avaliações discrepantes”
  And Eu vejo 0 alunos com discrepância, 0% de discrepância e uma lista de alunos vazia.
