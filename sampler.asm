.8086
.model small
.stack 100h
.data

.code


public samplercarga 
proc samplercarga
	push bp
    mov bp,sp
    push ax
    push cx
    push bx
  	mov bx, ss:[bp+6] ;offstet compas frecuencias
  	mov si, ss:[bp+4] ;offset compas tempos

inicio:
    mov cx,0
frecuencia:    
    mov ah, 1 
    int 21h 
    mov byte ptr[bx],al
    inc bx
tempo:
	mov ah,1 				; redondaX=4,blancaB=2,negraN=1,corcheaC 0.5 compas=4 
	int 21h
	cmp si,78h ;x
	je redonda
	cmp si,62h ;b
	je blanca
	cmp si,6eh ;n
	je negra
	cmp si,63h ;c
	je corchea
SaveTempo:
	mov byte ptr[si],al
	inc si
	jmp frecuencia
redonda:
	add cx,4
	cmp cx,4
	ja borro
	cmp cx,4
	je finCarga
	jmp SaveTempo
blanca:
	add cx,2
	cmp cx,4
	ja borro
	cmp cx,4
	je finCarga
	jmp SaveTempo
negra:
	add cx,1
	cmp cx,4
	ja borro
	cmp cx,4
	je finCarga
	jmp SaveTempo
corchea:
	add cx, 1
	cmp cx,4
	ja borro
	cmp cx,4
	je finCarga
	jmp SaveTempo

	
borro:
	mov si,8
	mov bx,8
borro2:	

	mov byte ptr[bx],24h
	mov byte ptr[si],24h
	cmp si,0
	je inicio
	sub si,1
	sub bx,1
	jmp borro2
finCarga:
pop bx
pop cx
pop ax
pop bp
ret 4
samplercarga endp



end




 