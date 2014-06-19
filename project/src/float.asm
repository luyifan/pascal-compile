.386
.model flat,stdcall
option casemap:none

include    masm32\include\windows.inc
include    masm32\include\kernel32.inc
include    masm32\include\msvcrt.inc
includelib masm32\lib\msvcrt.lib
includelib masm32\lib\kernel32.lib
include    masm32\include\user32.inc
includelib masm32\lib\user32.lib
includelib masm32\lib\kernel32.lib
includelib masm32\lib\msvcrt.lib
printf PROTO C :ptr sbyte, :vararg
	.data
szInput        	db  '%f', 0
szFormat    	db    '%d',0ah, 0dh , 0
szFormat_real   db    '%lf',0ah, 0dh , 0
tmp				db 0, 0, 0, 0, 0, 0, 0, 0
num1        	dd 123.0
    .const
    .code 
start:  
	push ebp
	mov ebp, esp
	push ebp
	call yu
	pop eax		; pop the access link
	
pop ebp

    invoke    ExitProcess,NULL

output:
	push    ebp
    mov     ebp, esp
    push    eax
    mov     ebx, offset szFormat
    push    ebx
    call    printf

	pop		ebx
	pop		ebx

    pop     ebp
    ret
	ret
input:
	invoke crt_scanf, addr szInput, addr tmp
	fld dword ptr tmp
	ret

output_real:
		sub esp, 8
		push qword ptr [esp]
		push offset szFormat_real
		call printf
		pop eax
		add esp, 8
		ret 
yu:
push ebp
mov ebp, esp
fld dword ptr [num1]
fld dword _float32_(2.33)
fst dword ptr [esp-20]
fld dword ptr [esp-20]
sub esp, 8
fst qword ptr [esp]
push offset szFormat
call printf
pop eax
add esp, 8

;;
call input 
sub esp, 8
fst qword ptr [esp]
push offset szFormat
call printf
pop eax
add esp, 8
;;;;;
fmul 
sub esp, 8
fst qword ptr [esp]
push offset szFormat
call printf
pop eax
add esp, 8


pop ebp
ret
end    start

