; String Processing Procedures

; Gets offset of the string in si
; returns length of the null terminated string in al

strlen:

	pusha
	mov bl, 0
.loop1:
	mov al, [si]
	inc si
	cmp al, 0
	je .return
	inc bl
	jmp .loop1

.return:
	mov [temp_ret], bl
	popa
	mov al, [temp_ret]
	ret


; Gets offset of the first null-terminated string in esi
; Gets offset of the second null-terminated string in edi
; returns 1 if they were equal
; returns 0 if they were not equal
; returned value is in the al
strcmp:
	pusha
	call strlen
	mov cl, al
	xchg si, di
	call strlen
	xchg si, di
	
	cmp al, cl
	jne .NotEqual
	
	mov cl, 0
	mov al, 1
.L1:
	mov cl, [si]
	mov bl, [di]
	cmp cl, bl
	jne .NotEqual
	cmp cl, 0
	je .Done
	inc si
	inc di
	jmp .L1
	
.NotEqual:
	mov al, 0
.Done:
	mov [temp_ret], al
	popa
	mov al, [temp_ret]
	ret
	
	
; checks if the string starting in si, is the leading substring of the string starting in di
; returns al --> 1 if true , 0 if false
isSuggestion:
	pusha
	mov ax, 0
	mov cx, 0
	call strlen
	mov cl, al
	xchg si, di
	call strlen
	xchg si, di
	cmp al, cl
	jb .NO
	mov bx, 0
	mov dx, 0
.L1:
	mov bl, [si]
	mov dl, [di]
	cmp bl, dl
	jne .NO
	inc si
	inc di
	dec cl
	cmp cl, 0
	je .YES
	jmp .L1
.NO:
	popa
	mov al, 0
	jmp .Done
.YES:
	popa
	mov al, 1
.Done:
	ret


; copies the string in si, into the string in di
setStr:
	pusha
.L1:
	mov al, [si]
	mov [di], al
	cmp al, 0
	je .Done
	inc si
	inc di
	jmp .L1
.Done:
	popa
	ret

; reverses the string in di
reverse_string:
	pusha
	mov ax, 0
	xchg si, di
	call strlen
	xchg si, di
	mov bx, di
	add bx, ax
	dec bx
.L1:
	cmp di, bx
	jae .Done
	mov al, [bx]
	xchg al, [di]
	mov [bx], al
	inc di
	dec bx
	jmp .L1
.Done
	popa
	ret
	

; recieves a number in AL
; returns the string of decimal representation of that number in di	
to_string:
	mov di, Writable
	pusha
	mov ah, 0
	mov cx, 0
	mov bx, 10
.push:
	mov dx, 0
	div bx
	inc cx
	push dx
	cmp ax, 0
	jne .push
.pop:
	pop dx
	add dl, '0'
	mov [di], dl
	inc di
	dec cx
	jnz .pop
	mov byte [di], 0
	popa
	ret
	
; recieves string-formated decimal number starting in si
; returns the decimal number in AL
ParseInt:
	pusha
	call strlen
	mov bx, 0
	mov bl, al
	mov di, si
	dec bl
	add di, bx
	mov dx, 0
	mov bx, 0
.L1:
	mov al, 10
	call pow ; returned_value*([si] - '0')
	inc bl
	mov cl, [di]
	sub cl, '0'
	mul cl
	add dl, al
	dec di
	cmp di, si
	jb .Done
	jmp .L1
.Done:
	mov [temp_ret], dl
	popa
	mov al, [temp_ret]
	ret
	
; calculates pow(al, bl)
; answer will be returned in al
pow:
	pusha
	mov ah, 0
	mov cx, 1
.L1:
	cmp bl, 0
	je .Done
	dec bl
	push ax
	mul cl
	mov cl, al ; CL *= AL
	pop ax
	jmp .L1
.Done:
	mov [temp_ret], cl
	popa
	mov al, [temp_ret]
	ret
	
