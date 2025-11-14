*** Variables ***

# Input para adicionar nova tarefa
${INPUT_NEW_TODO}               xpath=//input[@data-testid='text-input']

# Filtros
${FILTER_ALL}                   xpath=//ul[@data-testid='footer-navigation']//a[text()='All']
${FILTER_ACTIVE}                xpath=//ul[@data-testid='footer-navigation']//a[text()='Active']
${FILTER_COMPLETED}             xpath=//ul[@data-testid='footer-navigation']//a[text()='Completed']

# Botões
${BUTTON_CLEAR_COMPLETED}       xpath=//footer[@data-testid='footer']//button[@class='clear-completed']
${BUTTON_DELETE_TASK}           xpath=//label[@data-testid="todo-item-label" and normalize-space()="{item}"]/following-sibling::button[@data-testid="todo-item-button"]

# Checkboxs
${CHECKBOX_SELECT_ALL}          xpath=//input[@data-testid='toggle-all']
${CHECKBOX_SELECT_ITEM}         xpath=//input[@type='checkbox' and @data-testid='todo-item-toggle'][following-sibling::label[normalize-space()='{item}']]
${TODO_ITEM_CHECKBOX_BY_INDEX}  xpath=(//li[@data-testid='todo-item'])[{index}]//input[@data-testid='todo-item-toggle']
${TODO_ITEM_CHECKBOX_BY_TEXT}   xpath=//label[normalize-space()='{item}']/preceding-sibling::input[@data-testid='todo-item-toggle']

# Labels
${TODO_ITEM_LABEL_BY_TEXT}      xpath=//label[@data-testid='todo-item-label' and normalize-space()='{item}']
${ITEM_TASK_NAME}               xpath=//label[@data-testid='todo-item-label']

# Quantidade de itens restantes
${ITEM_LEFT}                    xpath=//span[@class='todo-count' and normalize-space()='{itemLeft}']
${TODO_COUNT}                   xpath=//span[@class='todo-count']
