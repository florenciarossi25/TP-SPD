;La blanca es una figura musical, equivalente en la notación musical a la mitad del valor de una redonda, 2 negras, 4 corcheas
;redondo 1seg - blanca 1/2 seg - negra 1/4 seg - corcheas 1/8



;do ---> 4560
;re ---> 4063
;mi ---> 3619
;fa ---> 3416
;sol ---> 3043
;la ---> 2711
;si ---> 2415
;sil ---> 0000 

;r ---> 100
;b ---> 50
;n ---> 25
;c ---> 12


.8086
.model small
.stack 100h
.data
salto	db 0dh, 0ah, 24h
menusal	db "Para volver al menu presione 'M'", 0dh, 0ah, 24h
menuini	db "Bienvenido sea usted. 1 Para tocar piano - 2 Para usar sampler",0dh, 0ah
menuini2 db "3 Repro ult cancion - 0 Para Salir",0dh, 0ah,24h
compas1f db 10 dup (24h), 24h
compas1t db 10 dup (24h), 24h
compas2f db 10 dup (24h), 24h
compas2t db 10 dup (24h), 24h
compas3f db 10 dup (24h), 24h
compas3t db 10 dup (24h), 24h
compas4f db 10 dup (24h), 24h
compas4t db 10 dup (24h), 24h
ingresenc db "ingrese el proximo compas",0dh,0ah,24h


.code

extrn pGeneral:proc
extrn pDo:proc
extrn pRe:proc
extrn pMi:proc
extrn pFa:proc
extrn pSol:proc
extrn pLa:proc
extrn pSi:proc
extrn play:proc
extrn mayus:proc
extrn samplercarga:proc
extrn sampler:proc

main proc

	mov ax, @data
	mov ds, ax

menu:
	mov ah, 0Fh
	int 10h
	mov ah, 0
	int 10h
	mov ah,9
	lea dx, menuini
	int 21h

	mov ah,1
	int 21h

	cmp al, '1'
	je general
	cmp al, '2'
	je sampler1
	cmp al, '0'
	je fin1
	cmp al, '3'
	je reproduce
	jmp menu


	; leer 1
	; leer 2

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
	je esFa
	cmp bl, 'U'
	je esSol1
	cmp bl, 'I'
	je esLa1
	cmp bl, 'O'
	je esSi1
	cmp bl, 'M'
	je menu
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
sampler1:
jmp SAMP
fin1:
jmp fin
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
SAMP:
mov ah,9
lea dx, salto
int 21h
;-----------------------------primer compas--------------------------------------

lea bx, compas1f
lea cx, compas1t
push bx
push cx
call samplercarga
mov ah,9
lea dx,compas1f
int 21h
mov ah,9
lea dx, compas1t
int 21h
	mov ah,1
	int 21h

mov ah, 0Fh				;LIMPIA LA PANTALLA
	int 10h
	mov ah, 0
	int 10h

;--------------------------------segundo compas-------------------------------------------------

mov ah,9
lea dx, ingresenc
int 21h
mov ah,9
lea dx, salto
int 21h
lea bx, compas2f
lea cx, compas2t
push bx
push cx

call samplercarga
mov ah,9
lea dx, salto
int 21h
mov ah,9
lea dx,compas2f
int 21h
mov ah,9
lea dx, compas2t
int 21h
	mov ah,1
	int 21h

mov ah, 0Fh				;LIMPIA LA PANTALLA
	int 10h
	mov ah, 0
	int 10h
;--------------------------------tercer compas-------------------------------------------------------
mov ah,9
lea dx, ingresenc
int 21h
mov ah,9
lea dx, salto
int 21h
lea bx, compas3f
lea cx, compas3t
push bx
push cx

call samplercarga
mov ah,9
lea dx, salto
int 21h
mov ah,9
lea dx,compas3f
int 21h
mov ah,9
lea dx, compas3t
int 21h
	mov ah,1
	int 21h

mov ah, 0Fh				;LIMPIA LA PANTALLA
	int 10h
	mov ah, 0
	int 10h
;------------------------------cuarto compas-------------------------------------------------------
mov ah,9
lea dx, ingresenc
int 21h
mov ah,9
lea dx, salto
int 21h
lea bx, compas4f
lea cx, compas4t
push bx
push cx

call samplercarga
mov ah,9
lea dx, salto
int 21h
mov ah,9
lea dx,compas4f
int 21h
mov ah,9
lea dx, compas4t
int 21h
	mov ah,1
	int 21h

mov ah, 0Fh				;LIMPIA LA PANTALLA
	int 10h
	mov ah, 0
	int 10h
;---------------------------------------------------reproduce los 4 compases-----------------------------------
reproduce:
lea bx, compas1f
lea cx, compas1t
push bx
push cx
call sampler

lea bx, compas2f
lea cx, compas2t
push bx
push cx
call sampler

lea bx, compas3f
lea cx, compas3t
push bx
push cx
call sampler

lea bx, compas4f
lea cx, compas4t
push bx
push cx
call sampler
mov ah,9
lea dx, salto
int 21h
jmp menu




fin: 
mov ax, 4c00h
int 21h

main endp
end