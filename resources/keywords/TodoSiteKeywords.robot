*** Settings ***

Library          SeleniumLibrary
Library          String
Resource         ../variables/TodoSiteVariables.robot
Resource         ../locators/TodoSiteLocators.robot

*** Keywords ***
Open Browser To Todo Site
    [Documentation]    Abrir o navegador e acessar a url do site To-Do
    Open Browser    ${TODO_SITE_URL}    ${BROWSER}    options=add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--remote-debugging-port=9222");add_argument("--disable-gpu");add_argument("--headless=new")
    Maximize Browser Window

Add Todo Item
    [Documentation]    Adiciona um item de tarefa na lista pelo texto fornecido.
    [Arguments]    ${item_text}
    Wait Until Element Is Visible    ${INPUT_NEW_TODO}    timeout=10s
    Input Text                       ${INPUT_NEW_TODO}    ${item_text}
    Press Keys                       ${INPUT_NEW_TODO}    ENTER

Add Multiple Todo Items
    [Documentation]    Adiciona múltiplos itens de tarefa na lista.
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
        Add Todo Item    ${item}
    END

Check Todo Item
    [Documentation]    Marca o checkbox de uma tarefa pelo seu texto.
    [Arguments]    ${item_text}
    ${locator}=    Replace String       ${TODO_ITEM_CHECKBOX_BY_TEXT}    {item}    ${item_text}
    ${xpath}=      Replace String       ${locator}    xpath=    ${EMPTY}
    Wait Until Page Contains Element    ${locator}    timeout=${DEFAULT_TIMEOUT}
    Execute JavaScript    var el=document.evaluate("${xpath}",document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;if(el){el.click();}
    Log To Console        Checkbox da tarefa "${item_text}" marcado.

Filter Todos By Status
    [Documentation]    Filtra as tarefas pelo status: All, Active ou Completed.
    [Arguments]    ${status}
    Run Keyword If    '${status}' == 'All'        Click Element     ${FILTER_ALL}
    Run Keyword If    '${status}' == 'Active'     Click Element     ${FILTER_ACTIVE}
    Run Keyword If    '${status}' == 'Completed'  Click Element     ${FILTER_COMPLETED}
    Log To Console    Filtrado por: ${status}

Assert Todo Item Is Visible
    [Documentation]    Verifica se um item de tarefa com o texto especificado está visível na página.
    [Arguments]    ${item_text}
    ${locator}=    Replace String       ${TODO_ITEM_LABEL_BY_TEXT}    {item}    ${item_text}
    Wait Until Element Is Visible       ${locator}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible           ${locator}
    Log To Console    Verificado: Item "${item_text}" está visível.

Assert Todo Item Is Not Visible
    [Documentation]    Verifica se um item de tarefa com o texto especificado NÃO está visível na página.
    [Arguments]    ${item_text}
    ${locator}=    Replace String       ${TODO_ITEM_LABEL_BY_TEXT}    {item}    ${item_text}
    Wait Until Element Is Not Visible   ${locator}    timeout=${DEFAULT_TIMEOUT}
    Element Should Not Be Visible       ${locator}
    Log To Console    Verificado: Item "${item_text}" não está visível.

Assert Todo Items Are Visible
    [Documentation]    Verifica se TODOS os itens de tarefa na lista estão visíveis na página.
    [Arguments]    @{item_texts}
    FOR    ${item_text}    IN    @{item_texts}
        Assert Todo Item Is Visible    ${item_text}
    END

Assert Todo Items Are Not Visible
    [Documentation]    Verifica se NENHUM dos itens de tarefa na lista está visível na página.
    [Arguments]    @{item_texts}
    FOR    ${item_text}    IN    @{item_texts}
        Assert Todo Item Is Not Visible    ${item_text}
    END

Delete Item
    [Documentation]    Excluir uma tarefa pelo texto.
    [Arguments]    ${item_text}
    ${locator}=           Replace String    ${TODO_ITEM_CHECKBOX_BY_TEXT}    {item}    ${item_text}
    ${delete_locator}=    Replace String    ${BUTTON_DELETE_TASK}            {item}    ${item_text}
    Mouse Over            ${locator}
    Click Element         ${delete_locator}

Assert Quantity Item Left
    [Documentation]    Verifica a quantidade de itens restantes.
    [Arguments]    ${item_left}
    ${locator}=        Set Variable    ${TODO_COUNT}
    Wait Until Element Is Visible      ${locator}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text}=    Get Text        ${locator}
    ${actual_num}=     Replace String Using Regexp    ${actual_text}    \D    ${EMPTY}
    ${expected_num}=   Replace String Using Regexp    ${item_left}      \D    ${EMPTY}
    Should Be Equal    ${actual_num}    ${expected_num}
    Log To Console     Verificado: ${actual_num} items left == ${expected_num}

Click Button Clear Completed
    [Documentation]    Clica no botão "Clear completed" para limpar as tarefas concluídas
    Wait Until Element Is Visible    ${BUTTON_CLEAR_COMPLETED}    timeout=${DEFAULT_TIMEOUT}
    Click Element                    ${BUTTON_CLEAR_COMPLETED}