isRepeat:
	pusha
	mov cl, [di + 4]
	mov dl, 0
	mov [di + 4], dl
	call strcmp
	mov [di + 4], cl
	mov [temp_ret], al
	popa
	mov al, [temp_ret]
	ret

doRepeat:
	pusha
	push ax
	mov ah, 0
	xchg si, di
	call strlen
	xchg si, di
	add di, ax
	dec di
	mov cl, [di]
	dec di
	mov [di], ah
	inc di
	sub cl, '0'
	inc di
	sub di, ax
	pop ax
.begin:
	mov si, NeedsHelp
	call isHelp
	cmp al, 1
	je .FunctionalHelpSection
	
	mov si, About
	call strcmp
	cmp al, 1
	je .aboutSection
	
	mov si, LogOut
	call strcmp
	cmp al, 1
	je .logoutSection
	
	mov si, SLogin1
	call strcmp
	cmp al, 1
	je .setLoginSection
	
	mov si, Clear
	call strcmp
	cmp al, 1
	je .clearSection
	
	mov si, Calculator
	call strcmp
	cmp al, 1
	je .calculatorSection
	
	mov si, Time
	call strcmp
	cmp al, 1
	je .timeSection
	
	mov si, Video_Mode
	call strcmp
	cmp al, 1
	je .Video_ModeSection
	
	mov si, Help
	call strcmp
	cmp al, 1
	je .HelpSection
	
	mov si, PWD
	call strcmp
	cmp al, 1
	je .PWDSection
	
	mov si, Reset
	call strcmp
	cmp al, 1
	je .resetSection
	
	jmp .Done
	
.aboutSection:
	call aboutCaller
	jmp .Found

.logoutSection:
	call logOutCaller
	mov cl, 1
	jmp .Found
	
.setLoginSection:
	call setLoginCaller
	mov cl, 1
	jmp .Found
	
.clearSection:
	call clearCaller
	mov cl, 1
	jmp .Found
	
.calculatorSection:
	call calculatorCaller
	jmp .Found

.timeSection:
	call timeCaller
	jmp .Found
	
.Video_ModeSection:
	call Video_ModeCaller
	mov cl, 1
	jmp .Found
	
.HelpSection:
	call HelpCaller
	jmp .Found

.PWDSection:
	call PWDCaller
	jmp .Found
	
.resetSection:
	call resetCaller
	mov cl, 1
	jmp .Found
	
.FunctionalHelpSection:
	call FunctionalHelp
	jmp .Found
	
	jmp .Done
.Done:
	call NoSuitable
	jmp .Found
.Found:
	dec cl
	cmp cl, 0
	jne .begin
	popa
	ret
	
