.8086
.model small
.stack 100h
.data

.code
extrn play: proc
public sampler
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
	je negra
	cmp byte ptr [si],63h ;c
	je corchea
sol:mov cx, 3043
	cmp byte ptr [si],78h ;x
	je redonda
	cmp byte ptr [si],62h ;b
	je blanca
	cmp byte ptr [si],6eh ;n
	je negra
	cmp byte ptr [si],63h ;c
	je corchea
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
 mov bx,500
 call play
 inc di
 inc si
 xor cx,cx
 xor bx,bx
 jmp leefrecuencia
blanca:
mov bx, 250
call play
 inc di
 inc si
 xor cx,cx
 xor bx,bx
 jmp leefrecuencia
negra:
mov bx, 125
call play
 inc di
 inc si
 xor cx,cx
 xor bx,bx
 jmp leefrecuencia
corchea:
mov bx,75
call play
 inc di
 inc si
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
end

