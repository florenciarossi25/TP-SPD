.8086
.model small
.stack 100h
.data
pianoUno	db 179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDos 	db 179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow	db 179,178,24h, 'E'
pianoLow2	db 178,179,178,24h,'R'
pianoLow3	db 178,179,178,24h,'T'
pianoLow4	db 178,179,178,24h, 'Y'
pianoLow5	db 178,179,178,24h,'U'
pianoLow6	db 178,179,178,24h,'I'
pianoLow7	db 178,179, 178,24h, 'O'
pianoLow8	db 178,179,0dh, 0ah, 24h

pianoUnoDO	db 179,177, 177, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosDO 	db 179,177,177,177,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLowDO	db 179,177,24h, 'E'
pianoLow2DO	db 177,179,178,24h,'R'

pianoUnoRE	db 179,178, 178, 176,176, 176, 177, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosRE	db 179,178,178,178,179,177,177,177,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow2RE	db 178,179,177,24h,'R'
pianoLow3RE	db 177,179,178,24h,'T'

pianoUnoMI	db 179,178, 178, 176,176, 176, 178, 176,176, 176, 177, 177, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosMI 	db 179,178,178,178,179,178,178,178,179,177,177,177,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow3MI	db 178,179,177,24h,'T'
pianoLow4MI	db 177,179,178,24h, 'Y'

pianoUnoFA	db 179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 177, 177, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosFA	db 179,178,178,178,179,178,178,178,179,178,178,178,179,177,177,177,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow4FA	db 178,179,177,24h, 'Y'
pianoLow5FA	db 177,179,178,24h,'U'

pianoUnoSOL	db 179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 177, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosSOL 	db 179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,177,177,177,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow5SOL	db 178,179,177,24h,'U'
pianoLow6SOL	db 177,179,178,24h,'I'

pianoUnoLA	db 179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 177,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosLA 	db 179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,177,177,177,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow6LA	db 178,179,177,24h,'I'
pianoLow7LA	db 177,179, 178,24h, 'O'

pianoUnoSI	db 179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 177, 177,179, 0dh, 0ah, 24h
pianoDosSI 	db 179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 177,177,177,179,0dh, 0ah, 24h
pianoLow7SI	db 178,179, 177,24h, 'O'
pianoLow8SI	db 177,179,0dh, 0ah, 24h

.code

public pGeneral
public pDo
public pRe
public pMi
public pFa
public pSol
public pLa
public pSi

;GENERAL------------------------------------------------------------------------------------------------------------------------
pGeneral proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

mov cx, 5
piano1:
mov ah, 9
lea dx, pianoUno
int 21h
loop piano1

mov cx, 3
piano2:
mov ah, 9
lea dx, pianoDos
int 21h
loop piano2

mov ah, 9
lea dx, pianoLow
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'E'
int 21h

mov ah, 9
lea dx, pianoLow2
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'R'
int 21h

mov ah, 9
lea dx, pianoLow3
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'T'
int 21h

mov ah, 9
lea dx, pianoLow4
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'Y'
int 21h

mov ah, 9
lea dx, pianoLow5
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'U'
int 21h

mov ah, 9
lea dx, pianoLow6
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'I'
int 21h

mov ah, 9
lea dx, pianoLow7
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'O'
int 21h

mov ah, 9
lea dx, pianoLow8	
int 21h

mov ah, 9
lea dx, pianoDos
int 21h

ret
pGeneral endp

;DO-----------------------------------------------------------------------------------------------------------------------------
pDo proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

mov cx, 5
piano1DO:
mov ah, 9
lea dx, pianoUnoDO
int 21h
loop piano1DO

mov cx, 3
piano2DO:
mov ah, 9
lea dx, pianoDosDO
int 21h
loop piano2DO

mov ah, 9
lea dx, pianoLowDO
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'E'
int 21h

mov ah, 9
lea dx, pianoLow2DO
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'R'
int 21h

mov ah, 9
lea dx, pianoLow3
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'T'
int 21h

mov ah, 9
lea dx, pianoLow4
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'Y'
int 21h

mov ah, 9
lea dx, pianoLow5
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'U'
int 21h

mov ah, 9
lea dx, pianoLow6
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'I'
int 21h

mov ah, 9
lea dx, pianoLow7
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'O'
int 21h

mov ah, 9
lea dx, pianoLow8	
int 21h

mov ah, 9
lea dx, pianoDosDO
int 21h
ret
pDo endp

;RE-----------------------------------------------------------------------------------------------------------------------------
pRe proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

mov cx, 5
piano1RE:
mov ah, 9
lea dx, pianoUnoRE
int 21h
loop piano1RE

mov cx, 3
piano2RE:
mov ah, 9
lea dx, pianoDosRE
int 21h
loop piano2RE

mov ah, 9
lea dx, pianoLow
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'E'
int 21h

mov ah, 9
lea dx, pianoLow2RE
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'R'
int 21h

mov ah, 9
lea dx, pianoLow3RE
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'T'
int 21h

mov ah, 9
lea dx, pianoLow4
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'Y'
int 21h

mov ah, 9
lea dx, pianoLow5
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'U'
int 21h

mov ah, 9
lea dx, pianoLow6
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'I'
int 21h

mov ah, 9
lea dx, pianoLow7
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'O'
int 21h

mov ah, 9
lea dx, pianoLow8	
int 21h

mov ah, 9
lea dx, pianoDosRE
int 21h
ret
pRe endp

;MI-----------------------------------------------------------------------------------------------------------------------------
pMi proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

mov cx, 5
piano1MI:
mov ah, 9
lea dx, pianoUnoMI
int 21h
loop piano1MI

mov cx, 3
piano2MI:
mov ah, 9
lea dx, pianoDosMI
int 21h
loop piano2MI

mov ah, 9
lea dx, pianoLow
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'E'
int 21h

mov ah, 9
lea dx, pianoLow2
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'R'
int 21h

mov ah, 9
lea dx, pianoLow3MI
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'T'
int 21h

mov ah, 9
lea dx, pianoLow4MI
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'Y'
int 21h

mov ah, 9
lea dx, pianoLow5
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'U'
int 21h

mov ah, 9
lea dx, pianoLow6
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'I'
int 21h

mov ah, 9
lea dx, pianoLow7
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'O'
int 21h

mov ah, 9
lea dx, pianoLow8	
int 21h

mov ah, 9
lea dx, pianoDosMI
int 21h

ret
pMi endp

;FA-----------------------------------------------------------------------------------------------------------------------------
pFa proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

mov cx, 5
piano1FA:
mov ah, 9
lea dx, pianoUnoFA
int 21h
loop piano1FA

mov cx, 3
piano2FA:
mov ah, 9
lea dx, pianoDosFA
int 21h
loop piano2FA

mov ah, 9
lea dx, pianoLow
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'E'
int 21h

mov ah, 9
lea dx, pianoLow2
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'R'
int 21h

mov ah, 9
lea dx, pianoLow3
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'T'
int 21h

mov ah, 9
lea dx, pianoLow4FA
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'Y'
int 21h

mov ah, 9
lea dx, pianoLow5FA
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'U'
int 21h

mov ah, 9
lea dx, pianoLow6
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'I'
int 21h

mov ah, 9
lea dx, pianoLow7
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'O'
int 21h

mov ah, 9
lea dx, pianoLow8	
int 21h

mov ah, 9
lea dx, pianoDosFA
int 21h

ret
pFa endp

;SOL----------------------------------------------------------------------------------------------------------------------------
pSol proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

mov cx, 5
piano1SOL:
mov ah, 9
lea dx, pianoUnoSOL
int 21h
loop piano1SOL

mov cx, 3
piano2SOL:
mov ah, 9
lea dx, pianoDosSOL
int 21h
loop piano2SOL

mov ah, 9
lea dx, pianoLow
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'E'
int 21h

mov ah, 9
lea dx, pianoLow2
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'R'
int 21h

mov ah, 9
lea dx, pianoLow3
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'T'
int 21h

mov ah, 9
lea dx, pianoLow4
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'Y'
int 21h

mov ah, 9
lea dx, pianoLow5SOL
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'U'
int 21h

mov ah, 9
lea dx, pianoLow6SOL
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'I'
int 21h

mov ah, 9
lea dx, pianoLow7
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'O'
int 21h

mov ah, 9
lea dx, pianoLow8	
int 21h

mov ah, 9
lea dx, pianoDosSOL
int 21h

ret
pSol endp

;LA-----------------------------------------------------------------------------------------------------------------------------
pLa proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

mov cx, 5
piano1LA:
mov ah, 9
lea dx, pianoUnoLA
int 21h
loop piano1LA

mov cx, 3
piano2LA:
mov ah, 9
lea dx, pianoDosLA
int 21h
loop piano2LA

mov ah, 9
lea dx, pianoLow
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'E'
int 21h

mov ah, 9
lea dx, pianoLow2
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'R'
int 21h

mov ah, 9
lea dx, pianoLow3
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'T'
int 21h

mov ah, 9
lea dx, pianoLow4
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'Y'
int 21h

mov ah, 9
lea dx, pianoLow5
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'U'
int 21h

mov ah, 9
lea dx, pianoLow6LA
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'I'
int 21h

mov ah, 9
lea dx, pianoLow7LA
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'O'
int 21h

mov ah, 9
lea dx, pianoLow8	
int 21h

mov ah, 9
lea dx, pianoDosLA	
int 21h

ret
pLa endp

;SI-----------------------------------------------------------------------------------------------------------------------------
pSi proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

mov cx, 5
piano1SI:
mov ah, 9
lea dx, pianoUnoSI
int 21h
loop piano1SI

mov cx, 3
piano2SI:
mov ah, 9
lea dx, pianoDosSI
int 21h
loop piano2SI

mov ah, 9
lea dx, pianoLow
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'E'
int 21h

mov ah, 9
lea dx, pianoLow2
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'R'
int 21h

mov ah, 9
lea dx, pianoLow3
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'T'
int 21h

mov ah, 9
lea dx, pianoLow4
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'Y'
int 21h

mov ah, 9
lea dx, pianoLow5
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'U'
int 21h

mov ah, 9
lea dx, pianoLow6
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'I'
int 21h

mov ah, 9
lea dx, pianoLow7SI
int 21h
mov ah, 09
mov bl, 11
mov cx, 1
int 10h
mov ah, 2
mov dl, 'O'
int 21h

mov ah, 9
lea dx, pianoLow8SI
int 21h

mov ah, 9
lea dx, pianoDosSI
int 21h

ret
pSi endp

end