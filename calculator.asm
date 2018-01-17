GetExpression:
	pusha
	mov di, Expression
	call getString
	call ExpressionParser
	popa
	ret

; recieves the string in di
; dl --> operation character
; si --> first oprand
; di --> second oprand
ExpressionParser:
	push cx
	push bx
	mov si, di
	mov cl, 0
	mov bl, 0
	mov ch, ' '
	dec si
.loop1:
	inc si
	cmp [si], ch
	jne .loop1
	inc bl
	cmp bl, 2
	jb .loop1
	dec si
	mov dl, [si]
	dec si
	mov [si], cl
	add si, 3
	pop bx
	pop cx
	call Evaluate
	ret
	
	
; calculates the answer
; first oprand in si, second in di, operator in dl
; prints answer
Evaluate:
	pusha
	mov bx, 0
	mov cx, 0
	mov ax, 0
	call ParseInt
	mov bl, al
	xchg si, di
	call ParseInt
	mov cl, al
	cmp dl, '+'
	je .Addition
	cmp dl, '-'
	je .Subtraction
	cmp dl, '*'
	je .Multiplication
	cmp dl, '/'
	je .Division
	cmp dl, '^'
	je .Power
	mov al, -1
	jmp .Done
	
	
.Addition:
	mov al, bl
	add al, cl
	jmp .Done

.Subtraction:
	mov al, bl
	sub al, cl
	jmp .Done
	
.Multiplication:
	mov al, bl
	mul cl
	jmp .Done
	
.Division:
	mov al, cl
	div bl
	jmp .Done
	
.Power:
	mov al, bl
	mov bl, cl
	xchg al, bl
	call pow
	jmp .Done
	
.Done:
	call WriteInt
	call CRLF
	popa
	ret
	
