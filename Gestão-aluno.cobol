IDENTIFICATION DIVISION.
PROGRAM-ID. GESTAO-ALUNO.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT ARQUIVO-ALUNO ASSIGN TO "ALUNOS.DAT"
    ORGANIZATION IS RELATIVE
    ACCESS MODE IS DYNAMIC
    RELATIVE KEY IS WS-CHAVE-RELATIVA.

DATA DIVISION.
FILE SECTION.
FD  ARQUIVO-ALUNO.
01  REGISTRO-ALUNO.
    05 WS-MATRICULA      PIC 9(3).
    05 WS-NOME           PIC X(30).
    05 WS-IDADE          PIC 9(2).

WORKING-STORAGE SECTION.
01  OPCAO                PIC 9.
01  WS-CHAVE-RELATIVA    PIC 9(3).
01  WS-CHAVE-BUSCA       PIC 9(3).

PROCEDURE DIVISION.
INICIO.
    DISPLAY "----------------------------------------"
    DISPLAY "1 - Inserir Aluno"
    DISPLAY "2 - Buscar Aluno"
    DISPLAY "3 - Sair"
    DISPLAY "----------------------------------------"
    ACCEPT OPCAO.

  EVALUATE OPCAO
        WHEN 1
            PERFORM INSERIR-ALUNO
        WHEN 2
            PERFORM BUSCAR-ALUNO
        WHEN 3
            STOP RUN
        WHEN OTHER
            DISPLAY "Opcao invalida!"
            STOP RUN
    END-EVALUATE.

INSERIR-ALUNO.
    DISPLAY "----------------------------------------"
    DISPLAY "Matricula do Aluno: "
    ACCEPT WS-CHAVE-RELATIVA.
    
    DISPLAY "Nome do Aluno: "
    ACCEPT WS-NOME.

    DISPLAY "Idade do Aluno: "
    ACCEPT WS-IDADE.

    OPEN OUTPUT ARQUIVO-ALUNO.
    
    WRITE REGISTRO-ALUNO
        INVALID KEY
            DISPLAY "Erro ao gravar registro (chave existente ou invalida)."
        NOT INVALID KEY
            DISPLAY "Aluno Gravado Com Sucesso!"
    END-WRITE.

    CLOSE ARQUIVO-ALUNO.
    PERFORM INICIO.

BUSCAR-ALUNO.
    DISPLAY "----------------------------------------"
    DISPLAY "Buscar Aluno"
    DISPLAY "----------------------------------------"
    DISPLAY "Qual e a Matricula Do Aluno: "
    ACCEPT WS-CHAVE-BUSCA.

    OPEN INPUT ARQUIVO-ALUNO.
    
    MOVE WS-CHAVE-BUSCA TO WS-CHAVE-RELATIVA.
    
    READ ARQUIVO-ALUNO
        INVALID KEY
            DISPLAY "Registro nao encontrado"
        NOT INVALID KEY
            DISPLAY "----------------------------------------"
            DISPLAY "Aluno Encontrado"
            DISPLAY "Matricula: " WS-CHAVE-RELATIVA
            DISPLAY "Nome: " WS-NOME
            DISPLAY "Idade: " WS-IDADE
    END-READ.

    CLOSE ARQUIVO-ALUNO.
    PERFORM INICIO.
