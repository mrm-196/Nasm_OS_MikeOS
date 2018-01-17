Identify:
.again:
	

	mov di, buffer
	call getString
	
	mov si, NeedsHelp
	call isHelp
	cmp al, 1
	je .FunctionalHelpSection
	
	mov si, NeedsRepeat
	call isRepeat
	cmp al, 1
	je .repeatSection
	
	
	mov si, About
	call strcmp
	cmp al, 1
	je .aboutSection
	
	mov si, LogOut
	call strcmp
	cmp al, 1
	je .logoutSection
	
	mov si, Calculator
	call strcmp
	cmp al, 1
	je .calculatorSection
	
	mov si, SLogin1
	call strcmp
	cmp al, 1
	je .setLogin1Section
	
	mov si, SLogin2
	call strcmp
	cmp al, 1
	je .setLogin2Section
	
	mov si, SLogin3
	call strcmp
	cmp al, 1
	je .setLogin3Section
	
	mov si, Clear
	call strcmp
	cmp al, 1
	je .clearSection
	
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
	jmp .again

.logoutSection:
	call logOutCaller
	jmp .again
	
.setLogin1Section:
	call setLoginCaller
	jmp .again
	
.setLogin2Section:
	call ChangeUser
	jmp .again
	
.setLogin3Section:
	call ChangePassword
	jmp .again
	
.clearSection:
	call clearCaller
	jmp .again
	
.calculatorSection:
	call calculatorCaller
	jmp .again
	
.repeatSection:
	call repeatCaller
	jmp .again

.timeSection:
	call timeCaller
	jmp .again
	
.Video_ModeSection:
	call Video_ModeCaller
	jmp .again
	
.HelpSection:
	call HelpCaller
	jmp .again

.PWDSection:
	call PWDCaller
	jmp .again
	
.resetSection:
	call resetCaller
	jmp .again
	
.FunctionalHelpSection:
	call FunctionalHelp
	jmp .again
	
	jmp .Done
.Done:
	call NoSuitable
	jmp .again
	ret
	
