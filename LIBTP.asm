.8086
.model small
.stack 100h
.data
;nota	db "Ingrese la nota:",0dh, 0ah
;		db "1. DO", 0dh, 0ah, "2. RE", 0dh, 0ah, "3. MI", 0dh, 0ah, "4. FA", 0dh, 0ah, "5. SOL", 0dh, 0ah, "6. LA", 0dh, 0ah, "7. SI", 0dh, 0ah, 24h 
salto	db 0dh, 0ah, 24h
errorN	db "Ingrese una figura v", 160, "lida", 0dh, 0ah, 24h
sePaso	db "Se ha exedido!!! Porfavor ingrese las notas nuevamente", 0dh, 0ah, 24h
nota	db "Primero ingrese la nota (E=do, R=re, T=mi, Y=fa, U=sol, I=la, O=si", 0dh, 0ah, 24h
tiempo	db "Luego ingrese el tempo (Redonda=x,blanca=b,negra=n,corchea=c)", 0dh, 0ah, 24h
alertcompas db "cada compas no debe exeder de los 4 tiempos",0dh,0ah,24h
alertcompas2 db "(redonda=4,blanca=2,negra=1,corchea=1/2)",0dh,0ah,24h
.code

public mayus
public sampler
public samplercarga
public play

;MAYUS-----------------------------------------------------------------------------------------------------------------
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

;SAMPLER---------------------------------------------------------------------------------------------------------------

sampler proc
	push bp
    mov bp,sp
    push dx
    push cx
    push bx
  	mov di, ss:[bp+6] ;offstet compas frecuencias
  	mov si, ss:[bp+4] ;offset compas tempos

 leefrecuencia:
 	cmp byte ptr [di],24h
 	je finproc1
 	cmp byte ptr [si],24h
 	je finproc1
 	cmp byte ptr [di],65h
 	je do
 	cmp byte ptr [di],72h
 	je re
 	cmp byte ptr [di],74h
 	je mi
 	cmp byte ptr [di],79h
 	je fa
 	cmp byte ptr [di],75h
 	je sol
 	cmp byte ptr [di],69h
 	je la2
 	cmp byte ptr [di],6fh
 	je s2
 do: 
 	mov cx, 4560
 	cmp byte ptr [si],78h ;x
	je redonda2
	cmp byte ptr [si],62h ;b
	je blanca2
	cmp byte ptr [si],6eh ;n
	je negra2
	cmp byte ptr [si],63h ;c
	je corchea2
re: 
	mov cx, 4063
	cmp byte ptr [si],78h ;x
	je redonda2
	cmp byte ptr [si],62h ;b
	je blanca2
	cmp byte ptr [si],6eh ;n
	je negra2
	cmp byte ptr [si],63h ;c
	je corchea2
mi: 
	mov cx, 3619
	cmp byte ptr [si],78h ;x
	je redonda2
	cmp byte ptr [si],62h ;b
	je blanca2
	cmp byte ptr [si],6eh ;n
	je negra2
	cmp byte ptr [si],63h ;c
	je corchea2

;saltos auxiliares 
s2: 
jmp s1
redonda2:
jmp redonda
finproc1: 
jmp finproc
blanca2:
jmp blanca
negra2:
jmp negra
corchea2:
jmp corchea
la2:
jmp la
fa: mov cx, 3416
	cmp byte ptr [si],78h ;x
	je redonda
	cmp byte ptr [si],62h ;b
	je blanca
	cmp byte ptr [si],6eh ;n
	je negraaux
	cmp byte ptr [si],63h ;c
	je corcheaaux
sol:mov cx, 3043
	cmp byte ptr [si],78h ;x
	je redonda
	cmp byte ptr [si],62h ;b
	je blanca
	cmp byte ptr [si],6eh ;n
	je negraaux
	cmp byte ptr [si],63h ;c
	je corcheaaux
la: mov cx, 2711
	cmp byte ptr [si],78h ;x
	je redonda
	cmp byte ptr [si],62h ;b
	je blanca
	cmp byte ptr [si],6eh ;n
	je negra
	cmp byte ptr [si],63h ;c
	je corchea
s1:	mov cx, 2415
	cmp byte ptr [si],78h ;x
	je redonda
	cmp byte ptr [si],62h ;b
	je blanca
	cmp byte ptr [si],6eh ;n
	je negra
	cmp byte ptr [si],63h ;c
	je corchea
redonda:
 mov bx,1000
 call play
 inc di
 inc si
 xor cx,cx
 xor bx,bx
 mov cx,0
 mov bx,10
call play

 xor cx,cx
 xor bx,bx
 jmp leefrecuencia
negraaux:
jmp negra
corcheaaux:
jmp corchea
blanca:
mov bx, 500
call play
 inc di
 inc si
 xor cx,cx
 xor bx,bx
 mov cx,0
 mov bx,10
call play

 xor cx,cx
 xor bx,bx
 jmp leefrecuencia
negra:
mov bx, 250
call play
 inc di
 inc si
 xor cx,cx
 xor bx,bx
mov cx,0
 mov bx,10
call play

 xor cx,cx
 xor bx,bx
 jmp leefrecuencia
corchea:
mov bx,125
call play
 inc di
 inc si
 xor cx,cx
 xor bx,bx
 mov cx,0
 mov bx,10
call play

 xor cx,cx
 xor bx,bx
 jmp leefrecuencia

finproc:
pop bp
pop dx
pop cx
pop bx
ret 4
sampler endp

;SAMPLERCARGA----------------------------------------------------------------------------------------------------------
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
	mov ah, 9
	lea dx, nota
	int 21h
	mov ah, 9
	lea dx, salto
	int 21h
	mov ah, 9
	lea dx, tiempo
	int 21h
	mov ah, 9
	lea dx, salto
	int 21h
	mov ah, 9
	lea dx, alertcompas
	int 21h
	mov ah, 9
	lea dx, salto
	int 21h
	mov ah, 9
	lea dx, alertcompas2
	int 21h
frecuencia: 
	


    mov ah, 1 
    int 21h 
    mov byte ptr[bx],al
    inc bx
tempo:
	mov ah,1 				; redondaX=4,blancaB=2,negraN=1,corcheaC 0.5 compas=4 
	int 21h

	cmp al,78h ;x
	je esRedonda
	cmp al,62h ;b
	je esBlanca
	cmp al,6eh ;n
	je esNegra
	cmp al,63h ;c
	je esCorchea

	mov ah, 9
	lea dx, errorN
	int 21h 
	jmp tempo
SaveTempo:
	mov byte ptr[si],al
	inc si
	cmp cx,8
	je finCarga
	jmp frecuencia
esRedonda:
	add cx,8
	cmp cx,8
	ja borro
	
	jmp SaveTempo
esBlanca:
	add cx,4
	cmp cx,8
	ja borro
	
	jmp SaveTempo
esNegra:
	add cx,2
	cmp cx,8
	ja borro

	jmp SaveTempo
esCorchea:
	add cx,1
	cmp cx,8
	ja borro
	
	jmp SaveTempo

	
borro:
	mov ah, 0Fh				;LIMPIA LA PANTALLA
	int 10h
	mov ah, 0
	int 10h

	mov ah, 9
	lea dx, sePaso
	int 21h

	mov bx, ss:[bp+6] ;offstet compas frecuencias
  	mov si, ss:[bp+4] ;offset compas tempos
  	mov cx, 8
borro2:	
	mov byte ptr[bx],24h
	mov byte ptr[si],24h
	loop borro2
	jmp inicio


finCarga:
pop bx
pop cx
pop ax
pop bp
ret 4
samplercarga endp

;PLAY------------------------------------------------------------------------------------------------------------------
play proc

play:
    push ax
    push cx
    push bx
    mov     ax, cx

    out     42h, al
    mov     al, ah
    out     42h, al
    in      al, 61h

    or      al, 00000011b
    out     61h, al

    pause1:
        mov cx, 65535

    pause2:
        dec cx
        jne pause2
        dec bx
        jne pause1

        in  al, 61h
        and al, 11111100b
        out 61h, al
        
    pop bx
    pop cx
    pop ax

    ret
play endp

end