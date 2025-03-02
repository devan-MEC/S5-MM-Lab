DATA SEGMENT
    MSG1 DB 'It is a palindrome $'
    MSG2 DB 'It is not a palindrome $'
    STRING1 DB 'malayalam'
    PAL DB 00H
DATA ENDS

EXTRA SEGMENT
    STRING2 DB 07H DUP (?)
EXTRA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA, ES:EXTRA
    START: MOV AX, DATA
           MOV DS, AX
           MOV AX, EXTRA
           MOV ES, AX
           
           LEA SI, STRING1
           LEA DI, STRING2
           MOV CX, 0007H
           ADD DI, 0006H
           
     BACK: CLD
           LODSB
           STD
           STOSB
           LOOP BACK
           
           LEA SI, STRING1
           LEA DI, STRING2
           MOV CX, 0007H
           
           CLD
           REPE CMPSB
           JNZ SKIP1
           MOV AH, 09H
           LEA DX, MSG1
           INT 21H
           INC PAL
           JMP SKIP2
    SKIP1: MOV AH, 09H
           LEA DX, MSG2
           INT 21H
    SKIP2: MOV AH, 4CH
           MOV AL, 00H
           INT 21H
CODE ENDS
END