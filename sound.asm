
; ------------------------------------------------------------------
; http://muruganad.com/8086/8086-assembly-language-program-to-play-sound-using-pc-speaker.html
; os_play_sound -- Play a single tone using the pc speaker
; IN: CX = tone, BX = duration


; 1segundo= 100

;EN EL MAIN

;mov cx, 9121
;mov bx, 25
;call play

.8086
.model small
.stack 100h
.data

.code

public play


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