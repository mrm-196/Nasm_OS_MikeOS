GetUser:
	pusha
	mov si, loginMessage
    call printString

.Again:
    mov di, buffer
    call getString

    mov si, User1
    call strcmp
    cmp al, 1
    je .Done
    mov si, User2
    call strcmp
    cmp al, 1
    je .Done
    mov si, User3
    call strcmp
    cmp al, 1
    je .Done
    mov si, UserNotFound
    call printString
    jmp .Again
.Done:
	mov si, current_user
	xchg si, di
	call setStr
	xchg si, di
	popa
	call GetPassWord
	ret

GetPassWord:

	mov si, PasswordRequest
	call printString

.Again:
	mov di, buffer
    call getString

    mov si, User1_Password
    call strcmp
    cmp al, 1
    je .Done
    mov si, User2_Password
    call strcmp
    cmp al, 1
    je .Done
    mov si, User3_Password
    call strcmp
    cmp al, 1
    je .Done
    mov si, IncorrectPassword
    call printString
    jmp .Again
.Done:
	mov di, current_password
	call setStr
	mov si, WelcomeNote
	call printString
	ret

ChangeUser:
	pusha
	mov si, dashN
	call printString
	mov si, current_user
	mov di, User1
	call strcmp
	cmp al, 1
	je .UN1
	mov di, User2
	call strcmp
	cmp al, 1
	je .UN2
	mov di, User3
	call strcmp
	cmp al, 1
	je .UN3
	jmp .Done
.UN1:
	mov di, User1
	call getString
	xchg si, di
	call setStr
	jmp .Done
.UN2:
	mov di, User2
	call getString
	xchg si, di
	call setStr
	jmp .Done
.UN3:
	mov di, User3
	call getString
	xchg si, di
	call setStr
	jmp .Done
.Done:
	popa
	ret
	
ChangePassword:
	pusha
	mov si, dashP
	call printString
	mov si, current_password
	mov di, User1_Password
	call strcmp
	cmp al, 1
	je .UN1
	mov di, User2_Password
	call strcmp
	cmp al, 1
	je .UN2
	mov di, User3_Password
	call strcmp
	cmp al, 1
	je .UN3
	jmp .Done
.UN1:
	mov di, User1_Password
	call getString
	xchg si, di
	call setStr
	jmp .Done
.UN2:
	mov di, User2_Password
	call getString
	xchg si, di
	call setStr
	jmp .Done
.UN3:
	mov di, User3_Password
	call getString
	xchg si, di
	call setStr
	jmp .Done
.Done:
	popa
	ret
	
