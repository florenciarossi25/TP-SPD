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
    push ax
    push cx
    push bx
  	mov ax, ss:[bp+6] ;offstet compas frecuencias
  	mov si, ss:[bp+4] ;offset compas tempos
 leefrecuencia:
 	cmp ax,24h
 	je finproc1
 	cmp ax,65h
 	je do
 	cmp ax,72h
 	je re
 	cmp ax,74h
 	je mi
 	cmp ax,79h
 	je fa
 	cmp ax,75h
 	je sol
 	cmp ax,69h
 	je la2
 	cmp ax,6fh
 	je s2
 do: mov cx, 4560
 	cmp si,78h ;x
	je redonda2
	cmp si,62h ;b
	je blanca2
	cmp si,6eh ;n
	je negra2
	cmp si,63h ;c
	je corchea2
re: mov cx, 4063
	cmp si,78h ;x
	je redonda2
	cmp si,62h ;b
	je blanca2
	cmp si,6eh ;n
	je negra2
	cmp si,63h ;c
	je corchea2
mi: mov cx, 3619
	cmp si,78h ;x
	je redonda2
	cmp si,62h ;b
	je blanca2
	cmp si,6eh ;n
	je negra2
	cmp si,63h ;c
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
	cmp si,78h ;x
	je redonda
	cmp si,62h ;b
	je blanca
	cmp si,6eh ;n
	je negra
	cmp si,63h ;c
	je corchea
sol:mov cx, 3043
	cmp si,78h ;x
	je redonda
	cmp si,62h ;b
	je blanca
	cmp si,6eh ;n
	je negra
	cmp si,63h ;c
	je corchea
la: mov cx, 2711
	cmp si,78h ;x
	je redonda
	cmp si,62h ;b
	je blanca
	cmp si,6eh ;n
	je negra
	cmp si,63h ;c
	je corchea
s1:	mov cx, 2415
	cmp si,78h ;x
	je redonda
	cmp si,62h ;b
	je blanca
	cmp si,6eh ;n
	je negra
	cmp si,63h ;c
	je corchea
redonda:
 mov bx,200
 call play
 inc ax
 inc si
 jmp leefrecuencia
blanca:
mov bx, 100
call play
 inc ax
 inc si
 jmp leefrecuencia
negra:
mov bx, 50
call play
 inc ax
 inc si
 jmp leefrecuencia
corchea:
mov bx,25
call play
 inc ax
 inc si
 jmp leefrecuencia

finproc:
pop bp
pop ax
pop cx
pop bx
ret 4
sampler endp 
end

