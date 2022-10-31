;-------------------------------------
; pseudo.nasm
; Leita o README.md para detalhes
;-------------------------------------
; if ( RAM[0] < 2 && RAM[1] == 0 ):
;     RAM[5] = RAM[5] + 1
; else
;     RAM5[5] = RAM[5] - 1
;-------------------------------------

if:
    leaw $0, %A
    movw (%A), %D       ;%D = RAM[0]
    leaw $2, %A
    subw %D, %A, %D     ;%D = RAM[0] - 2
    leaw $else
    jg                  ;if ( RAM[0] < 2 ) goto else
    nop


    leaw $1, %A
    movw (%A), %D 
    leaw $else  
    jne
    nop

    leaw $5, %A
    movw (%A), %D       ;%D = RAM[5]
    incw %D             ;%D = RAM[5] + 1
    movw %D, (%A)       ;RAM[5] = RAM[5] + 1
    leaw $end, %A
    jmp
    nop


else:
    leaw $5, %A
    movw (%A), %D       ;RAM[5] = %D
    decw %D             ;%D = RAM[5] - 1
    movw %D, (%A)       ;%D = RAM[5]
    leaw $end, %A

end: