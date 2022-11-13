.8086
.model small
.stack 100h
.data
.code

public mayus

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

end