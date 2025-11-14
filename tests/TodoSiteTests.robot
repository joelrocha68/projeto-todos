*** Settings ***

Library          SeleniumLibrary
Resource         ../resources/keywords/TodoSiteKeywords.robot

Test Setup       Open Browser To Todo Site
Test Teardown    Close Browser

*** Test Cases ***

Cenário 1: Adicionar, marcar e filtrar todas as tarefas como concluidas
    Add Multiple Todo Items            Atividade 1    Atividade 2    Atividade 3
    Check Todo Item                    Atividade 2
    Filter Todos By Status             Completed
    Assert Quantity Item Left          2 items left!
    Assert Todo Items Are Visible      Atividade 2
    Assert Todo Items Are Not Visible  Atividade 1    Atividade 3
    
Cenário 2: Adicionar, marcar, excluir e filtrar todas as tarefas como concluidas
    Add Multiple Todo Items            Atividade 1    Atividade 2    Atividade 3    Atividade 4
    Check Todo Item                    Atividade 3
    Delete Item                        Atividade 3
    Filter Todos By Status             Completed
    Assert Quantity Item Left          3 items left!
    Assert Todo Items Are Not Visible  Atividade 1    Atividade 2    Atividade 3    Atividade 4

Cenário 3: Adicionar, marcar e limpar as tarefas concluidas
    Add Multiple Todo Items            Atividade 1    Atividade 2    Atividade 3    Atividade 4
    Check Todo Item                    Atividade 4
    Click Button Clear Completed
    Assert Quantity Item Left          3 items left!
    Assert Todo Items Are Visible      Atividade 1    Atividade 2    Atividade 3
    Assert Todo Items Are Not Visible  Atividade 4