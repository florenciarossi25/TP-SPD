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
salto db 0dh, 0ah, 24h

menuini db "Bienvenido sea usted.", 0dh, 0ah
        db "1) Para tocar piano", 0dh, 0ah
        db "2) Para usar sampler",0dh, 0ah
        db "3) Reproducir la ", 163, "ltima canci", 162, "n guardada", 0dh, 0ah
        db "4) reproducir tetris"
        db " 5) reproducir TuTurrito", 0dh,0ah
        db "0) Para Salir",0dh, 0ah,24h
compas1f db 10 dup (24h), 24h
compas1t db 10 dup (24h), 24h
compas2f db 10 dup (24h), 24h
compas2t db 10 dup (24h), 24h
compas3f db 10 dup (24h), 24h
compas3t db 10 dup (24h), 24h
compas4f db 10 dup (24h), 24h
compas4t db 10 dup (24h), 24h
tetrisf  db "AEFGFEDDFAGFEEFGAFDD",24h
tetrist  db "bnnbnnbnnbnnbnbbbbbb",24h
turrof  db "CDEFEDEFAGGGGGGGFEDCGGGGGFEDCCDEFDDDDAGGGGGGGGFEDCGGGGGFEEEEE",24h
turrot  db "rrrbbrrrbrbnnnnnbnbbnnnnnbnbrrrrbbrrrbrnnnnnnnbnbbnnnnnbnbbbb",24h
ingrese db  "Ingrese el",24h
ingrese1 db " primer compas",0dh,0ah,24h
ingrese2 db " segundo compas",0dh,0ah,24h
ingrese3 db " tercer compas",0dh,0ah,24h
ingrese4 db " cuarto compas",0dh,0ah,24h
seguro  db 0dh, 0ah
        db "Desea guardar el compas y continuar?", 0dh, 0ah
        db "1 - Guardar / 2 - Regrabar : ",24h

suena   db "Su grabaci", 163, "n suena as",161, " :)", 0dh, 0ah, 24h
.code

extrn pianoPlay:proc
extrn play:proc
extrn mayus:proc
extrn samplercarga:proc
extrn sampler:proc
extrn muestraC:proc
extrn titles:proc
main proc

  mov ax, @data
  mov ds, ax

menu:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  call titles
   
  mov ah,9
  lea dx, menuini
  int 21h

  mov ah,1
  int 21h

  cmp al, '1'
  je piano
  cmp al, '2'
  je samp
  cmp al, '3'
  je reproduce1
  cmp al, '4'
  je  tetris
  cmp al, '5'
  je turro
  cmp al, '0'
  je fin1

  jmp menu

turro:
  lea bx, turrof
  push bx
  lea cx, turrot
  push cx
  call sampler
  jmp menu

piano:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  call pianoPlay
  jmp menu
tetris:
  lea bx, tetrisf
  push bx
  lea cx, tetrist
  push cx
  call sampler
  jmp menu


fin1:
  jmp fin 
reproduce1:
  jmp reproduce

samp:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  mov ah,9
  lea dx, salto
  int 21h
;-----------------------------primer compas--------------------------------------
comp1:
  mov ah, 9
  lea dx, ingrese
  int 21h
  mov ah, 09
  mov bl, 11
  mov cx, 14
  int 10h
  mov ah, 9
  lea dx, ingrese1
  int 21h

  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  lea bx, compas1f
  push bx
  lea cx, compas1t
  push cx
  call samplercarga

  lea bx, compas1f
  push bx
  lea cx, compas1t
  push cx
  call muestraC

seg1:
  mov ah, 9
  lea dx, seguro
  int 21h
  mov ah, 1
  int 21h
  cmp al, '1'
  je comp2
  cmp al, '2'
  mov ah,9
  lea dx, salto
  int 21h
  je comp1
  jmp seg1
;--------------------------------segundo compas-------------------------------------------------
comp2:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  mov ah,9
  lea dx, ingrese
  int 21h
  mov ah, 09
  mov bl, 11
  mov cx, 15
  int 10h 
  mov ah, 9
  lea dx, ingrese2
  int 21h
  lea bx, compas2f
  lea cx, compas2t
  push bx
  push cx
  call samplercarga

  lea bx, compas2f
  push bx
  lea cx, compas2t
  push cx
  call muestraC

seg2:
  mov ah, 9
  lea dx, seguro
  int 21h
  mov ah, 1
  int 21h
  cmp al, '1'
  je comp3
  cmp al, '2'
  je comp2
  jmp seg2

;--------------------------------tercer compas-------------------------------------------------------
comp3:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  mov ah,9
  lea dx, ingrese
  int 21h
  mov ah, 09
  mov bl, 11
  mov cx, 14
  int 10h  
  mov ah,9
  lea dx, ingrese3
  int 21h


  lea bx, compas3f
  lea cx, compas3t
  push bx
  push cx
  call samplercarga

  lea bx, compas3f
  push bx
  lea cx, compas3t
  push cx
  call muestraC

seg3:
  mov ah, 9
  lea dx, seguro
  int 21h
  mov ah, 1
  int 21h
  cmp al, '1'
  je comp4
  cmp al, '2'
  je comp3
  jmp seg3
;------------------------------cuarto compas-------------------------------------------------------
comp4:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  mov ah,9
  lea dx, ingrese
  int 21h
  mov ah, 09
  mov bl, 11
  mov cx, 14
  int 10h
  mov ah,9
  lea dx, ingrese4
  int 21h
  mov ah,9
  lea dx, salto
  int 21h

  lea bx, compas4f
  lea cx, compas4t
  push bx
  push cx
  call samplercarga

  lea bx, compas4f
  push bx
  lea cx, compas4t
  push cx
  call muestraC

seg4:
  mov ah, 9
  lea dx, seguro
  int 21h
  mov ah, 1
  int 21h
  cmp al, '1'
  je reproduce
  cmp al, '2'
  je comp4
  jmp seg4

;---------------------------------------------------reproduce los 4 compases-----------------------------------
reproduce:
  mov ah, 0Fh
  int 10h
  mov ah, 0
  int 10h

  mov ah, 9
  lea dx, suena
  int 21h

  lea bx, compas1f
  push bx
  lea cx, compas1t
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
