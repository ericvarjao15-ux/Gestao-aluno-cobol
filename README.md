# Sistema de Gestão de Alunos em COBOL (Acesso Relativo / Direct File Access)

Este projeto demonstra a manipulação de arquivos com organização **Relativa (RELATIVE)** e acesso **Dinâmico (DYNAMIC)** na linguagem COBOL, implementando rotinas de inclusão e consulta direta de registros via chave relativa.

---

## 📌 Destaques Técnicos

* **Organização Relativa (`ORGANIZATION IS RELATIVE`)**: Permite o mapeamento direto de registros via posição física (Relative Record Number - RRN), dispensando varredura sequencial.
* **Acesso Dinâmico (`ACCESS MODE IS DYNAMIC`)**: Estrutura preparada para alternar entre acesso aleatório/direto (`READ`, `WRITE`) e sequencial no mesmo arquivo.
* **Tratamento de Exceções I/O**: Uso das cláusulas `INVALID KEY` e `NOT INVALID KEY` para prevenção de sobregravações e tratamento de registros não encontrados.

---

## 🛠️ Estrutura dos Dados

| Campo | Nível | Tipo / Máscara | Descrição |
| :--- | :---: | :---: | :--- |
| `WS-MATRICULA` | 05 | `PIC 9(3)` | Chave / Código do Aluno |
| `WS-NOME` | 05 | `PIC X(30)` | Nome completo |
| `WS-IDADE` | 05 | `PIC 9(2)` | Idade |

---

## 🚀 Como Executar

### Pré-requisitos
* Compilador COBOL (ex: **GnuCOBOL** / `cobc`)

### Compilação e Execução

```bash
# Compilar o código fonte
cobc -x -o gestao-aluno GESTAO-ALUNO.cbl

# Executar o programa
./gestao-aluno
