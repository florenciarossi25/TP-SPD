.8086
.model small
.stack 100h
.data
nota	db "Ingrese la nota:",0dh, 0ah
		db "1. DO", 0dh, 0ah, "2. RE", 0dh, 0ah, "3. MI", 0dh, 0ah, "4. FA", 0dh, 0ah, "5. SOL", 0dh, 0ah, "6. LA", 0dh, 0ah, "7. SI", 0dh, 0ah, 24h 
.code

public mayus
public ingresa

mayus proc
;Esta función retorna la letra en AL mayusculizada

mayusculizador:
	cmp al, 60h
	ja casiMinuscula
	cmp al, 160
	je cambiara
	cmp al, 130
	je cambiare
	cmp al, 161
	je cambiari
	cmp al, 162
	je cambiaro
	cmp al, 163
	je cambiaru
	jmp finMayus
casiMinuscula:
	cmp al, 7bh
	jb esMinuscula
	jmp finMayus
esMinuscula:
	sub al, 20h
	jmp finMayus
cambiara:
	mov al, 181
	jmp finMayus 
cambiare:
	mov al, 144
	jmp finMayus 
cambiari:
	mov al, 214
	jmp finMayus 
cambiaro:
	mov al, 224
	jmp finMayus 
cambiaru:
	mov al, 233
	jmp finMayus 
finMayus:

ret 
mayus endp

ingresa proc
;Recibe por STACK el offset de la variable dos variables (notas y tiempo) y las rellena con los valores correspondientes
	push bp
	mov bp, sp

	mov bx, ss:[bp+6]							;OFFSET NOTAS
	mov cx, ss:[bp+4]							;OFFSET TIEMPO

mov cx, 4
notas:
	mov ah, 0Fh
	int 10h
	mov ah, 0
	int 10h

	mov ah, 9
	lea dx, nota
	int 21h

	mov ah, 1
	int 21h

	cmp al, 1
	je esDo
	cmp al, 2
	je esRe
	cmp al, 3
	je esMi
	cmp al, 4
	je esFa
	cmp al, 5
	je esSol
	cmp al, 6
	je esLa
	cmp al, 7
	je esSi


esDo:
	mov [bx], 4560
	inc bx
	jmp tiempo
esRe:
	mov [bx], 4063
	inc bx
	jmp tiempo
esMi:
	mov [bx], 3619
	inc bx
	jmp tiempo
esFa:
	mov [bx], 3416
	inc bx
	jmp tiempo
esSol:
	mov [bx], 3043
	inc bx
	jmp tiempo
esLa:
	mov [bx], 2711
	inc bx
	jmp tiempo
esSi:
	mov [bx], 2415
	inc bx
	jmp tiempo


tiempo:
loop notas

pop bp	

ret 4
ingresa endp

end