.8086
.model small
.stack 100h
.data
	tecla db 219
	tex2 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 32, 32, 32, 32, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 219, 24h 	
	tex3 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 24h
	tex4 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 32, 219, 32, 219, 32, 219, 219, 219, 32, 219, 219, 32, 32, 219, 219, 219, 32, 32, 32, 32, 219, 219, 219, 32, 219, 219, 219, 32, 219, 32, 32, 219, 32, 219, 223, 219, 32, 219, 32, 32, 32, 219, 219, 219, 32, 219, 219, 219, 24h
	tex5 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 32, 219, 32, 219, 32, 219, 32, 219, 32, 219, 223, 32, 32, 219, 32, 219, 32, 32, 32, 32, 32, 32, 219, 32, 219, 220, 219, 32, 219, 92, 47, 219, 32, 219, 220, 219, 32, 219, 32, 32, 32, 219, 220, 32, 32, 219, 32, 219, 24h 
	tex6 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 32, 219, 32, 219, 32, 219, 219, 32, 32,219, 219, 219, 32, 219, 32, 219, 32, 32, 32, 32, 32, 32, 219, 32, 219, 223, 219, 32, 219, 32, 32, 219, 32, 219, 32, 32, 32, 219, 32, 32, 32, 219, 223, 32, 32, 219, 219, 24h
	tex7 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 32, 219, 219, 219, 32, 219, 32, 219, 32, 219, 219, 219, 32, 219, 219, 219, 32, 32, 32, 32, 219, 219, 219, 32, 219, 32, 219, 32, 219, 32, 32, 219, 32, 219, 32, 32, 32, 219, 219, 219, 32, 219, 219, 219, 32, 219, 32, 219, 24h  

	tex10 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 219, 24h
	tex11 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 32, 219, 24h
	tex12 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 219, 219, 32, 219, 32, 219, 219, 219, 32, 219, 32, 219, 32, 219, 219, 219, 24h
	tex13 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 32, 32, 32, 219, 32, 219, 32, 219, 32, 219, 92, 219, 32, 219, 32, 219, 24h
	tex14 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 32, 32, 32, 219, 32, 219, 219, 219, 32, 219, 32, 219, 32, 219, 32, 219, 24h
	tex15 db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 219, 32, 32, 32, 219, 32, 219, 32, 219, 32, 219, 32, 219, 32, 219, 219, 219, 24h



	.code

	public titles
	
	titles proc
		mov ax, @data
		mov ds, ax

		mov ah,0fh  ;limpio la pantalla
		int 10h
		mov ah,0
		int 10h

		mov bh,0  ;indico pagina
		mov dh,0  ;me pongo en el renglon  // 0-24
		mov dl,0  ;me pongo en la columna 5 // 0-79
		mov ah,2  ;servicio
		int 10h

		mov ah,9h
		mov al,tecla   ;caracter que quiero imprimir
		mov bh,0       ;pantalla en la que quiero imprimir
		mov bl,6       ;color que quiero
		mov cx,80      ;cantidad de veces que quiero imprimir el caracter
		int 10h

;TurboSampler----------------------------------------------------

		mov bh,0   
		mov dh,2  
		mov dl,3   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex2
		int 21h     

	;----------------
		mov bh,0   
		mov dh,3  
		mov dl,3   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex3
		int 21h 
		
	;----------------
		mov bh,0   
		mov dh,4  
		mov dl,3   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex4
		int 21h      

	;----------------
		mov bh,0   
		mov dh,5 
		mov dl,3   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex5
		int 21h  

	;----------------
		mov bh,0   
		mov dh,6 
		mov dl,3   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex6
		int 21h  

	;----------------
		mov bh,0   
		mov dh,7 
		mov dl,3   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex7
		int 21h 
;FinTurboSampler----------------------------------------------------

;Piano--------------------------------------------------------------

		mov bh,0   
		mov dh,10  
		mov dl,14   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex10
		int 21h     

	;----------------
		
		mov bh,0   
		mov dh,11  
		mov dl,14   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex11
		int 21h 

	;----------------
		
		mov bh,0   
		mov dh,12
		mov dl,14   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex12
		int 21h 
	
	;----------------
		
		mov bh,0   
		mov dh,13
		mov dl,14   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex13
		int 21h 

	;----------------
		
		mov bh,0   
		mov dh,14
		mov dl,14   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex14
		int 21h 

	;----------------
		
		mov bh,0   
		mov dh,15  
		mov dl,14   
		mov ah,2   
		int 10h

		mov ah, 9
		lea dx, tex15
		int 21h 
;------------------------------------------------------

		mov bh,0  ;indico pagina
		mov dh,17  ;me pongo en el renglon  // 0-24
		mov dl,0  ;me pongo en la columna 5 // 0-79
		mov ah,2  ;servicio
		int 10h

		mov ah,9h
		mov al,tecla   
		mov bh,0       
		mov bl,3       
		mov cx,80    
		int 10h

		mov bh,0  ;indico pagina
		mov dh,18  ;me pongo en el renglon  // 0-24
		mov dl,0  ;me pongo en la columna 5 // 0-79
		mov ah,2  ;servicio
		int 10h

		mov ah,9h
		mov al,tecla   
		mov bh,0       
		mov bl,10       
		mov cx,21    
		int 10h

	ret
	titles endp
end