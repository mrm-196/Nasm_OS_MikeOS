aboutCaller:
	pusha
	mov si, AboutNote
	call printString
	call CRLF
	popa
	ret
	
logOutCaller:
	pusha
	mov si, NULL_String
	mov di, current_user
	call setStr
	mov si, loggedOut
	call printString
	call CRLF
	call GetUser
	popa
	ret
	
setLoginCaller:
	pusha
	call GetUser
	popa
	ret
	
clearCaller:
	pusha
	mov cl, 24
.L1:
	dec cl
	call CRLF
	cmp cl, 0
	jne .L1
	mov ah, 03h
	int 10h
	sub dh, 24
	mov ah, 02h
	int 10h
	popa
	ret
	
timeCaller:
	pusha
	call TimeReader
	popa
	ret
	
calculatorCaller:
	pusha
	call GetExpression
	popa
	ret
	
Video_ModeCaller:
	pusha
	mov ah, 0
	int 10h
	popa
	ret

HelpCaller:
	pusha
	call HelpGeneral
	popa
	ret
	
PWDCaller:
	pusha
	mov si, current_user
	call printString
	call CRLF
	popa
	ret
	
resetCaller:
	call kernelMain
	ret
	
repeatCaller:
	pusha
	add di, 4
	call doRepeat
	popa
	ret
	
NoSuitable:
	pusha
	mov si, NO_CMD
	call printString
	call CRLF
	popa
	ret
