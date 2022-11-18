.8086
.model small
.stack 100h
.data

marco   db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 0dh, 0ah, 24h
marco1  db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 176, 176, 176, 176, 176, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 0dh, 0ah, 24h
marco2  db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 223, 219, 219, 0dh, 0ah, 24h
marco3  db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 220, 219, 0dh, 0ah, 24h


pianoUno	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178, 178, 176, 176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDos 	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178,24h, 'E'
pianoLow2	db 178,179,178,24h,'R'
pianoLow3	db 178,179,178,24h,'T'
pianoLow4	db 178,179,178,24h, 'Y'
pianoLow5	db 178,179,178,24h,'U'
pianoLow6	db 178,179,178,24h,'I'
pianoLow7	db 178,179, 178,24h, 'O'
pianoLow8	db 178,179,0dh, 0ah, 24h

pianoUnoDO	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,177, 177, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosDO 	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,177,177,177,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLowDO	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,177,24h, 'E'
pianoLow2DO	db 177,179,178,24h,'R'

pianoUnoRE	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178, 178, 176,176, 176, 177, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosRE	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178,178,178,179,177,177,177,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow2RE	db 178,179,177,24h,'R'
pianoLow3RE	db 177,179,178,24h,'T'

pianoUnoMI	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178, 178, 176,176, 176, 178, 176,176, 176, 177, 177, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosMI 	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178,178,178,179,178,178,178,179,177,177,177,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow3MI	db 178,179,177,24h,'T'
pianoLow4MI	db 177,179,178,24h, 'Y'

pianoUnoFA	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 177, 177, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosFA	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178,178,178,179,178,178,178,179,178,178,178,179,177,177,177,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow4FA	db 178,179,177,24h, 'Y'
pianoLow5FA	db 177,179,178,24h,'U'

pianoUnoSOL 	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 177, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosSOL 	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,177,177,177,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow5SOL	db 178,179,177,24h,'U'
pianoLow6SOL	db 177,179,178,24h,'I'

pianoUnoLA	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 177,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDosLA 	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,177,177,177,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow6LA	db 178,179,177,24h,'I'
pianoLow7LA	db 177,179, 178,24h, 'O'

pianoUnoSI	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179, 178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 177, 177,179, 0dh, 0ah, 24h
pianoDosSI 	db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,179, 178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 177,177,177,179,0dh, 0ah, 24h
pianoLow7SI	db 178,179, 177,24h, 'O'
pianoLow8SI	db 177,179,0dh, 0ah, 24h

tecla db 219
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
mov bh,0  ;indico pagina
mov dh,0  ;me pongo en el renglon  // 0-24
mov dl,0  ;me pongo en la columna 5 // 0-79
mov ah,2  ;servicio
int 10h

mov ah,9h
mov al,tecla   ;caracter que quiero imprimir
mov bh,0       ;pantalla en la que quiero imprimir
mov bl,6       ;color que quiero
mov cx,80      ;cantidad de veces que quiero imprimir el caracter
int 10h

pGeneral proc

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

call pianoTop
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

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

call pianoBott
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

ret
pGeneral endp

;DO-----------------------------------------------------------------------------------------------------------------------------
pDo proc

push cx
push bx

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

call pianoTop
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

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

pop bx
pop cx

call pianoBott
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

ret
pDo endp

;RE-----------------------------------------------------------------------------------------------------------------------------
pRe proc

push cx
push bx

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

call pianoTop
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

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

pop bx
pop cx

call pianoBott
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

ret
pRe endp

;MI-----------------------------------------------------------------------------------------------------------------------------
pMi proc

push cx
push bx

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

call pianoTop
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

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

pop bx
pop cx

call pianoBott
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

ret
pMi endp

;FA-----------------------------------------------------------------------------------------------------------------------------
pFa proc

push cx
push bx

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

call pianoTop
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

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

pop bx
pop cx

call pianoBott
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

ret
pFa endp

;SOL----------------------------------------------------------------------------------------------------------------------------
pSol proc
push cx
push bx

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

call pianoTop
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

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

pop bx 
pop cx

call pianoBott
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

ret
pSol endp

;LA-----------------------------------------------------------------------------------------------------------------------------
pLa proc

push cx
push bx

mov ah, 0Fh
int 10h
mov ah, 0
int 10h

call pianoTop
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

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

pop bx 
pop cx

call pianoBott
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

ret
pLa endp

;SI-----------------------------------------------------------------------------------------------------------------------------
pSi proc

push cx
push bx
mov ah, 0Fh
int 10h
mov ah, 0
int 10h

call pianoTop
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

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

pop bx 
pop cx

call pianoBott
xor cx,cx
xor bx,bx
xor ax,ax
xor dx,dx

ret
pSi endp


pianoTop proc
	mov bh,0  ;indico pagina
	mov dh,0  ;me pongo en el renglon  // 0-24
	mov dl,0  ;me pongo en la columna 5 // 0-79
	mov ah,2  ;servicio
	int 10h

	mov ah,9h
	mov al,tecla   ;caracter que quiero imprimir
	mov bh,0       ;pantalla en la que quiero imprimir
	mov bl,6       ;color que quiero
	mov cx,80      ;cantidad de veces que quiero imprimir el caracter
	int 10h

	mov bh,0  
	mov dh,2  
	mov dl,0  
	mov ah,2  
	int 10h

	mov ah,9h
	mov bh,0       ;pantalla en la que quiero imprimir
	mov bl,8      ;color que quiero
	mov cx,55      ;cantidad de veces que quiero imprimir el caracter
	int 10h

	mov ah, 9
	lea dx, marco
	int 21h

	mov ah, 9
	lea dx, marco1
	int 21h

	mov ah, 9
	lea dx, marco2
	int 21h
	ret
pianoTop endp

pianoBott proc
	mov ah,9h
	mov bh,0       ;pantalla en la que quiero imprimir
	mov bl,8      ;color que quiero
	mov cx,55      ;cantidad de veces que quiero imprimir el caracter
	int 10h

	mov ah, 9
	lea dx, marco3
	int 21h

	mov bh,0 
	mov dh,17  
	mov dl,0  
	mov ah,2  
	int 10h

	mov ah,9h
	mov al,tecla   
	mov bh,0       
	mov bl,3       
	mov cx,80    
	int 10h

	ret
pianoBott endp

end