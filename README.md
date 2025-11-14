# 📘 Automação de Testes — TodoMVC (Robot Framework + Selenium)

Este repositório contém automações end-to-end usando **Robot Framework** com biblioteca **SeleniumLibrary** validando funcionalidades do site **TodoMVC**.

---

## Como clonar o projeto

No terminal, execute:

```bash
git clone https://github.com/joelrocha68/projeto-todos.git
```

## 1. Pré-requisitos

Antes de rodar os testes, certifique-se de ter instalado:

### Python 3.8+  
Verifique sua versão com:

```bash
python3 --version
```

### pip atualizado

```bash
pip install --upgrade pip
```

### Google Chrome

```bash
google-chrome --version
```

---

## 2. Instalação das dependências

Na raiz do projeto, execute:

```bash
pip install -r requirements.txt
```

O arquivo `requirements.txt` inclui as dependências necessárias, como:

- `robotframework`
- `robotframework-seleniumlibrary`

---

## 3. Como rodar os testes

### Rodar todos os testes e salvar evidências em `results/`

Na raiz do projeto:

```bash
robot -d results tests/
```

O parâmetro `-d results` define o diretório onde serão gerados:

- `log.html`
- `report.html`
- `output.xml`

### Rodar apenas um arquivo de testes específico

```bash
robot -d results tests/TodoSiteTests.robot
```

### Rodar apenas um cenário pelo nome

```bash
robot -d results -t "Cenário 1: Adicionar, marcar e filtrar todas as tarefas como concluidas" tests/TodoSiteTests.robot
```