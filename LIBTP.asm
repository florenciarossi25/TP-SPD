.8086
.model small
.stack 100h
.data
salto	db 0dh, 0ah, 24h
error1	db 32,32,32,32,32,32
				db "ERROR! Ingrese una nota v", 160, "lida", 24h
error2	db 32,32,32,32
				db "ERROR! Ingrese un tiempo v", 160, "lido", 0dh, 0ah, 0dh, 0ah, 24h
sePaso	db "Se ha exedido!!! Porfavor ingrese las notas nuevamente", 0dh, 0ah, 24h

ref		db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32 
			db "   Cada compas no debe exceder de los 4 tiempos!",0dh,0ah
			db 32,32,32,32,32,32,32,32,32,32,32,32,32 
			db "        4           2           1           1/2 ",0dh,0ah
			db 32,32,32,32,32,32,32,32,32,32,32,32,32 
			db " R = Redonda ", 179
			db " B = Blanca ", 179
			db " N = Negra ", 179
			db " C = Corchea ", 0dh, 0ah, 0dh, 0ah
			db 32,32,32,32,32,32,32,32
			db " C = Do ", 179
			db " D = Re ", 179
			db " E = Mi ", 179 
			db " F = Fa ", 179 
			db " G = Sol ", 179 
			db " A = La ", 179 
			db " B = Si ", 0dh, 0ah, 0dh, 0ah, 24h

nota  	db 0dh,0ah,0dh,0ah
				db "Ingrese la nota: ", 24h
tiempo 	db "Ingrese el tiempo: ", 24h

menusal db "Para volver al menu presione 'M'", 0dh, 0ah, 24h

msg0		db 0dh,0ah,0dh,0ah,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32 
				db "/ Estructura del compas /", 0dh, 0ah, 24h

msg1		db "Nota(s): ", 24h
notaDo	db "Do ", 24h
notaRe	db "Re ", 24h
notaMi	db "Mi ", 24h
notaFa	db "Fa ", 24h
notaSol	db "Sol ", 24h
notaLa	db "La ", 24h
notaSi	db "Si ", 24h
msg2	db "Tiempo: ", 24h
frecRed	db "Redonda ", 24h
frecBla	db "Blanca ", 24h
frecNe	db "Negra ", 24h
frecCor	db "Corchea ", 24h

.code

public mayus
public sampler
public samplercarga
public play
public pianoPlay
public muestraC

extrn pGeneral:proc
extrn pDo:proc
extrn pRe:proc
extrn pMi:proc
extrn pFa:proc
extrn pSol:proc
extrn pLa:proc
extrn pSi:proc

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
 	cmp byte ptr [di],'C'
 	je do
 	cmp byte ptr [di],'D'
 	je re
 	cmp byte ptr [di],'E'
 	je mi
 	cmp byte ptr [di],'F'
 	je fa1
 	cmp byte ptr [di],'G'
 	je sol1
 	cmp byte ptr [di],'A'
 	je la2
 	cmp byte ptr [di],'B'
 	je s2
fa1:
jmp fa
sol1:
jmp sol
finproc1: 
jmp finproc
la2:
jmp la
s2: 
jmp s1
do: 
	call pDo
	xor cx,cx
	xor bx,bx
	mov cx, 4560
	cmp byte ptr [si],72h ;r
	je redonda2
	cmp byte ptr [si],62h ;b
	je blanca2
	cmp byte ptr [si],6eh ;n
	je negra2
	cmp byte ptr [si],63h ;c
	je corchea2
re: 
	call pRe
	xor cx,cx
	xor bx,bx
	mov cx, 4063
	cmp byte ptr [si],72h ;r
	je redonda2
	cmp byte ptr [si],62h ;b
	je blanca2
	cmp byte ptr [si],6eh ;n
	je negra2
	cmp byte ptr [si],63h ;c
	je corchea2
mi: 
	call pMi
	xor cx,cx
 	xor bx,bx
	mov cx, 3619
	cmp byte ptr [si],72h ;r
	je redonda2
	cmp byte ptr [si],62h ;b
	je blanca2
	cmp byte ptr [si],6eh ;n
	je negra2
	cmp byte ptr [si],63h ;c
	je corchea2

;saltos auxiliares 
redonda2:
jmp redonda
blanca2:
jmp blanca
negra2:
jmp negra
corchea2:
jmp corchea
fa: 
	call pFa
	xor cx,cx
 	xor bx,bx
	mov cx, 3416
	cmp byte ptr [si],72h ;r
	je redonda2
	cmp byte ptr [si],62h ;b
	je blanca2
	cmp byte ptr [si],6eh ;n
	je negraaux
	cmp byte ptr [si],63h ;c
	je corcheaaux
sol:
	call pSol
	xor cx,cx
 	xor bx,bx
	mov cx, 3043
	cmp byte ptr [si],72h ;r
	je redonda
	cmp byte ptr [si],62h ;b
	je blanca
	cmp byte ptr [si],6eh ;n
	je negraaux
	cmp byte ptr [si],63h ;c
	je corcheaaux
la: 
	call pLa
	xor cx,cx
 	xor bx,bx
	mov cx, 2711
	cmp byte ptr [si],72h ;r
	je redonda
	cmp byte ptr [si],62h ;b
	je blanca
	cmp byte ptr [si],6eh ;n
	je negra
	cmp byte ptr [si],63h ;c
	je corchea
s1:	
	call pSi
	xor cx,cx
	xor bx,bx
	mov cx, 2415
	cmp byte ptr [si],72h ;r
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
negra:
mov bx, 120
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
mov bx,60
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

pop bx
pop cx
pop dx
pop bp
ret 4
sampler endp

;SAMPLERCARGA----------------------------------------------------------------------------------------------------------
proc samplercarga
	push bp
   	mov bp,sp
    push ax
    push cx
    push bx

 jmp limpio

inicio:
		mov bx, ss:[bp+6] ;offstet compas frecuencias
  	mov si, ss:[bp+4] ;offset compas tempos
    mov cx,0

    mov ah, 9
		lea dx, ref
		int 21h
frecuencia: 
	mov ah, 9
	lea dx, nota
	int 21h

    mov ah, 1 
    int 21h 
    call mayus
    cmp al, 'C'
    je cargo
    cmp al, 'D'
    je cargo
    cmp al, 'E'
    je cargo
    cmp al, 'F'
    je cargo
    cmp al, 'G'
    je cargo
    cmp al, 'A'
    je cargo
    cmp al, 'B'
    je cargo

    mov ah, 9
	lea dx, error1
	int 21h
	jmp frecuencia
 cargo:
    mov ah, 9
	lea dx, salto
	int 21h

    mov byte ptr[bx],al
    inc bx
tempo:
	mov ah, 9
	lea dx, tiempo
	int 21h

	mov ah,1 				; redondaX=4,blancaB=2,negraN=1,corcheaC 0.5 compas=4 
	int 21h

	cmp al,72h ;r
	je esRedonda
	cmp al,62h ;b
	je esBlanca
	cmp al,6eh ;n
	je esNegra
	cmp al,63h ;c
	je esCorchea

	mov ah, 9
	lea dx, error2
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

	mov ah, 09
	mov bl, 12
	mov cx, 16
	int 10h

	mov ah, 9
	lea dx, sePaso
	int 21h
limpio:
	mov bx, ss:[bp+6] ;offstet compas frecuencias
  mov si, ss:[bp+4] ;offset compas tempos
  mov cx, 10
borro2:	
	mov byte ptr[bx],24h
	mov byte ptr[si],24h
	inc bx
	inc si
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

;PIANOPLAY------------------------------------------------------------------------------------------------------------------

pianoPlay proc

general:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h
  call pGeneral

  mov ah, 9
  lea dx, menusal
  int 21h
  
tecla:
  mov ah, 1
  int 21h
  call mayus
  mov bl, al

  mov ah, 9
  lea dx, salto
  int 21h

  cmp bl, 'E'
  je esDo
  cmp bl, 'R'
  je esRe
  cmp bl, 'T'
  je esMi
  cmp bl, 'Y'
  je esFa1
  cmp bl, 'U'
  je esSol1
  cmp bl, 'I'
  je esLa1
  cmp bl, 'O'
  je esSi1
  cmp bl, 'M'
  je menu1
  jmp general

esDo:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  call pDo
  mov ah, 9
  lea dx, menusal
  int 21h

  mov cx, 4560
  mov bx, 50
  call play

  jmp vuelta
esFa1:
jmp esFa
menu1:
jmp menu
esRe:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  call pRe
  mov ah, 9
  lea dx, menusal
  int 21h

  mov cx, 4063
  mov bx, 50
  call play

  jmp vuelta
esMi:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  call pMi
  mov ah, 9
  lea dx, menusal
  int 21h

  mov cx, 3619
  mov bx, 50
  call play

  jmp vuelta
esSol1:
jmp esSol
esSi1:
jmp esSi
esLa1:
jmp esLa

esFa:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h
  call pFa
  mov ah, 9
  lea dx, menusal
  int 21h

  mov cx, 3416
  mov bx, 50
  call play

  jmp vuelta
esSol:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h
  call pSol
  mov ah, 9
  lea dx, menusal
  int 21h

  mov cx, 3043
  mov bx, 50
  call play

  jmp vuelta
esLa:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h
  call pLa
  mov ah, 9
  lea dx, menusal
  int 21h

  mov cx, 2711
  mov bx, 50
  call play

  jmp vuelta
esSi:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h
  call pSi
  mov ah, 9
  lea dx, menusal
  int 21h

  mov cx, 2415
  mov bx, 50
  call play

  jmp vuelta
vuelta:
  jmp tecla
 menu:
 ret

 pianoPlay endp

;MUESTRACOMPAS--------------------------------------------------------------------------------------------------------------
muestraC proc
;Recibe el offset de compas1f y compas1t,  mustra por pantalla el compas
push bp
mov bp, sp

	mov bx, ss:[bp+6]		;offset compas1f

	mov ah, 9
	lea dx, msg0
	int 21h

	mov ah, 9
	lea dx, msg1
	int 21h

notaM:
	cmp byte ptr[bx], 'C'
	je doN
	cmp byte ptr[bx], 'D'
	je reN
	cmp byte ptr[bx], 'E'
	je miN
	cmp byte ptr[bx], 'F'
	je faN
	cmp byte ptr[bx], 'G'
	je solN
	cmp byte ptr[bx], 'A'
	je laN
	cmp byte ptr[bx], 'B'
	je siN
	jmp sigo
doN:
	mov ah, 9
	lea dx, notaDo
	int 21h
	jmp incr
reN:
	mov ah, 9
	lea dx, notaRe
	int 21h
	jmp incr

miN:
	mov ah, 9
	lea dx, notaMi
	int 21h
	jmp incr
faN:
	mov ah, 9
	lea dx, notaFa
	int 21h
	jmp incr
solN:
	mov ah, 9
	lea dx, notaSol
	int 21h
	jmp incr
laN:
	mov ah, 9
	lea dx, notaLa
	int 21h
	jmp incr
siN:
	mov ah, 9
	lea dx, notaSi
	int 21h
	jmp incr

incr:
	inc bx
	jmp notaM

sigo:
	mov bx, ss:[bp+4]		;offset compas1f

	mov ah, 9
	lea dx, salto
	int 21h

	mov ah, 9
	lea dx, msg2
	int 21h

frec:
	cmp byte ptr[bx], 'r'
	je red
	cmp byte ptr[bx], 'b'
	je bla
	cmp byte ptr[bx], 'n'
	je negr
	cmp byte ptr[bx], 'c'
	je cor
	jmp fin
red:
	mov ah, 9
	lea dx, frecRed
	int 21h
	jmp incf
bla:
	mov ah, 9
	lea dx, frecBla
	int 21h
	jmp incf
negr:
	mov ah, 9
	lea dx, frecNe
	int 21h
	jmp incf
cor:
	mov ah, 9
	lea dx, frecCor
	int 21h
	jmp incf

incf:
	inc bx
	jmp frec

fin:

pop bp
ret 4
muestraC endp
end