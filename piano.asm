.8086
.model small
.stack 100h
.data
pianoUno	db 179,178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178,179, 0dh, 0ah, 24h
pianoDos 	db 179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,179,0dh, 0ah, 24h
pianoLow	db 179,178,24h, 'W'
pianoLow2	db 178,179,178,24h,'E'
pianoLow3	db 178,179,178,24h,'R'
pianoLow4	db 178,179,178,24h
pianoLow5	db 178,179,178,24h,'U'
pianoLow6	db 178,179,178,24h,'I'
pianoLow7	db 178,179, 178,24h, 'O'
pianoLow8	db 178,179,0dh, 0ah, 24h

;PIANO SIN LOS BORDES DEL COSTADO:
;piano	db 178, 178, 176,176, 176, 178, 176,176, 176, 178, 178, 179, 178, 178, 176,176, 176, 178, 176,176, 176, 178,176,176, 176, 178, 178, 0dh, 0ah, 24h
;piano2 	db 178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179,178,178,178,179, 178,178,178,0dh, 0ah, 24h

.code

public pGeneral

pGeneral proc


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

end