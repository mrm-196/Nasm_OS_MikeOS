; Console input and output procedures


; This porcedure displays null terminated string
; arguments: si -> Address of null terminated string
; returns: N/A

printString:
	pusha
	mov ah, 0eh

.loop1:
	lodsb
	cmp al, 0
	je .return

	int 10h
	jmp .loop1

.return:
	popa
	ret

; Write the rest of functions you need for console_io here
; you may also create other ".asm" files for rest of functions you need
; just do NOT forget to include them in "kernel.asm"


;prints value in AL
putchar:
	pusha
	mov ah, 0eh
	;lodsb
	int 10h
	popa
	ret


getString:
	pusha
.loop1:
	mov ah , 0
	int 016h
	call putchar
	cmp al, 0dh
	je .return
	cmp al, 08h
	je .back
	stosb
	jmp .loop1

.back:
	mov al, 20h
	call putchar
	mov ah, 03h
	int 10h
	dec dl
	mov ah, 02h
	int 10h	
	dec di
	mov al,0
	lodsb
	jmp .loop1

.return:
	mov al, 0
	stosb
	mov al, 0dh
	call putchar
	mov al, 0ah
	call putchar
	popa
	ret
	
CRLF:
	pusha
	mov al, 0dh
	call putchar
	mov al, 0ah
	call putchar
	popa
	ret
	
; recieves and prints the digit in AL
WriteDigit:
	pusha
	add al, 48
	call putchar
	popa
	ret
	
WriteInt:
	pusha
	call to_string
	mov si, di
	call printString
	popa
	ret
	
