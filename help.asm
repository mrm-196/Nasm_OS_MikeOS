;printing every command
HelpGeneral:
	push si
	
	;about
	mov si, About
	call printString
	call CRLF
	
	;calculator
	mov si, Calculator
	call printString
	call CRLF
	
	;clear
	mov si, Clear
	call printString
	call CRLF
	
	;logout
	mov si, LogOut
	call printString
	call CRLF
	
	;pwd
	mov si, PWD
	call printString
	call CRLF
	
	;rep
	mov si, Repeat
	call printString
	call CRLF
	
	;reset
	mov si, Reset
	call printString
	call CRLF
	
	;runx
	mov si, Video_Mode
	call printString
	call CRLF
	
	;set login
	mov si, SLogin1
	call printString
	call CRLF
	
	;set login -n
	mov si, SLogin2
	call printString
	call CRLF
	
	;set login -p
	mov si, SLogin3
	call printString
	call CRLF
	
	;time
	mov si, Time
	call printString
	call CRLF
	
	pop si
	ret

; checks whether the command is a candidate for FunctionalHelp
isHelp:
	call isSuggestion
	ret


; specific help
FunctionalHelp:
	pusha
	add di, 5
	
	;about
	mov si, About
	call strcmp
	cmp al, 1
	je .aboutSection
	
	;calculator
	mov si, Calculator
	call strcmp
	cmp al, 1
	je .calculatorSection
	
	;clear
	mov si, Clear
	call strcmp
	cmp al, 1
	je .clearSection
	
	;logout
	mov si, LogOut
	call strcmp
	cmp al, 1
	je .logoutSection
	
	;pwd
	mov si, PWD
	call strcmp
	cmp al, 1
	je .pwdSection
	
	;repeat
	mov si, Repeat
	call strcmp
	cmp al, 1
	je .repeatSection
	
	;reset
	mov si, Reset
	call strcmp
	cmp al, 1
	je .resetSection
	
	;runx
	mov si, Video_Mode
	call strcmp
	cmp al, 1
	je .runxSection
	
	;set login
	mov si, SLogin1
	call strcmp
	cmp al, 1
	je .SLogin1Section
	
	;set login -n
	mov si, SLogin2
	call strcmp
	cmp al, 1
	je .SLogin2Section
	
	;set login -p
	mov si, SLogin3
	call strcmp
	cmp al, 1
	je .SLogin3Section
	
	;time
	mov si, Time
	call strcmp
	cmp al, 1
	je .timeSection
	
	jmp .NotFoundSection
	
.aboutSection:
	mov si, AboutHelp
	call printString
	jmp .FoundSection
	
.calculatorSection:
	mov si, CalculatorHelp
	call printString
	jmp .FoundSection
	
.clearSection:
	mov si, ClearHelp
	call printString
	jmp .FoundSection
	
.logoutSection:
	mov si, LogOutHelp
	call printString
	jmp .FoundSection
	
.pwdSection:
	mov si, PWDHelp
	call printString
	jmp .FoundSection
	
.resetSection:
	mov si, ResetHelp
	call printString
	jmp .FoundSection
	
.runxSection:
	mov si, Video_ModeHelp
	call printString
	jmp .FoundSection

.repeatSection:
	mov si, RepeatHelp
	call printString
	jmp .FoundSection

.SLogin1Section:
	mov si, SLogin1Help
	call printString
	jmp .FoundSection
	
.SLogin2Section:
	mov si, SLogin2Help
	call printString
	jmp .FoundSection
	
.SLogin3Section:
	mov si, SLogin3Help
	call printString
	jmp .FoundSection
	
.timeSection:
	mov si, TimeHelp
	call printString
	jmp .FoundSection

.NotFoundSection:
	mov si, NO_CMD
	call printString
	jmp .FoundSection

.FoundSection:
	popa
	ret
