; The first line of code in this file is executed after bootloader
; You should write your main loop here or in some function that is called here

BITS 16

kernelMain:

    ; First we should set segments and stack
    ; Do not mess with these numbers!
    cli
    mov ax, 0
    mov ss, ax
    mov sp, 0FFFFh
    sti
    mov ax, 2000h
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
	
    ; Now we use our function to write an sample strings
	
	call clearCaller
    call GetUser
    call Identify
    .end:
    
    jmp exitOS

    ; Now we put cpu in halt state so the computer can be turned off
    cli
    hlt

; We must include our files in the end because this file in executed from first line
; so if we include them above the "kernelMain" all the codes in these files will be executed first

%INCLUDE "console_io.asm"
%INCLUDE "string_processor.asm"
%INCLUDE "login.asm"
%INCLUDE "command_reader.asm"
%INCLUDE "command_executer.asm"
%INCLUDE "time.asm"
%INCLUDE "help.asm"
%INCLUDE "repeat.asm"
%INCLUDE "calculator.asm"

test: db '27', 0

sampleMessage: db 'Hello World!', 0dh, 0ah, 0

loginMessage: db 'Pleas Enter Your Username: ', 0dh, 0ah, 0
PasswordRequest: db 'Pleas Enter Your Password: ', 0dh, 0ah, 0
UserNotFound: db 'Username Not Found! Try Again ', 0dh, 0ah, 0
IncorrectPassword: db 'Wrong Password! Try Again ', 0dh, 0ah, 0
WelcomeNote: db 'Welcome You Are Logged In. ', 0dh, 0ah, 0
dashN: db 'Please Enter Your New Username.', 0dh, 0ah, 0
dashP: db 'Please Enter Your New Password.', 0dh, 0ah, 0

NO_CMD: db 'No suitable command found!', 0
AboutNote: db 'This Program is developed by mrm_196 & Alireza Najafi.', 0
loggedOut: db 'Logged out.', 0 

User1: db 'mrm_196', 0
User1_Password: db '123456', 0
User2: db 'Alireza', 0
User2_Password: db 'khar magas', 0
User3: db 'Guest', 0
User3_Password: db '', 0

About: db 'about', 0
Help: db 'help', 0
Time: db 'time', 0
Clear: db 'clear', 0
PWD: db 'pwd', 0
SLogin1: db 'set login', 0
SLogin2: db 'set login -n', 0
SLogin3: db 'set login -p', 0
LogOut: db 'logout', 0
Repeat: db 'rep', 0
Reset: db 'reset', 0
Video_Mode: db 'runx', 0
Calculator: db 'cal', 0

AboutHelp: db 'This command gives you information about developers of this OS.', 0dh, 0ah, 0
TimeHelp: db 'This command presents Iranian local time.', 0dh, 0ah, 0
ClearHelp: db 'This command clears the screen.', 0dh, 0ah, 0
PWDHelp: db 'This command presents the current user.', 0dh, 0ah, 0
SLogin1Help: db 'This command allows you to switch user.', 0dh, 0ah, 0
SLogin2Help: db 'This command allows you change username for current user.', 0dh, 0ah, 0
SLogin3Help: db 'This command allows you change password for current user.', 0dh, 0ah, 0
LogOutHelp: db 'This command terminates current users session and lets you login again.', 0dh, 0ah, 0
RepeatHelp: db 'This command executes another command several times.', 0dh, 0ah, 0
ResetHelp: db 'This command restarts the OS.', 0dh, 0ah, 0
Video_ModeHelp: db 'This command starts the Graphical Mode session.', 0dh, 0ah, 0
CalculatorHelp: db 'This command runs a calculator for you.', 0dh, 0ah, 0


buffer: resb 200
current_user: resb 200
current_password: resb 200
Writable: resb 200
Expression: resb 200
NULL_String: resb 200
NeedsHelp: db 'help ', 0
NeedsRepeat: db 'rep ', 0
temp_ret: db '0'
exitOS:

