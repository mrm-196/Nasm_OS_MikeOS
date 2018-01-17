TimeReader:
	pusha
	mov ah, 02h
	int 1ah
	call setGMT
	call printTime
	popa
	ret
	
setGMT:
	push bx
	add cl, 30h
	cmp cl, 60h
	jb .MinuteSet
	sub cl, 60h
	inc ch
.MinuteSet:
	add ch, 04h
	mov bl, ch
	AND bl, 0Fh
	cmp bl, 9
	jbe .HourSet
	sub ch, 10
	add ch, 10h
.HourSet:
	cmp ch, 24h
	jb .Done
	sub ch, 24h
.Done:
	pop bx
	ret
	
printTime:
	pusha
	
	;hours
	mov al, ch
	AND al, 0F0h
	shr al, 4
	call WriteDigit
	mov al, ch
	AND al, 0Fh
	call WriteDigit
	mov al, ':'
	call putchar
	
	; minutes
	mov al, cl
	AND al, 0F0h
	shr al, 4
	call WriteDigit
	mov al, cl
	AND al, 0Fh
	call WriteDigit
	mov al, ':'
	call putchar
	
	; seconds
	mov al, dh
	AND al, 0F0h
	shr al, 4
	call WriteDigit
	mov al, dh
	AND al, 0Fh
	call WriteDigit
	
	call CRLF
	
	popa
	ret
	
