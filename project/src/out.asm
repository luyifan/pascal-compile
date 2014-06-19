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
szInput         db  '%d',  0
szInput_real    db  '%f', 0
szFormat        db  '%d',  0ah, 0dh , 0
szFormat_real   db  '%lf', 0ah, 0dh , 0
tmp			 db 0, 0, 0, 0, 0, 0, 0, 0
    .const
    .code 
start:  
mov esi, ebp
push ebp
mov ebp, esp
call yu
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
output_real:
   sub esp, 8
   fst qword ptr [esp]
   push offset szFormat_real
   call printf
   pop eax
   add esp, 8
   ret
input:
   invoke crt_scanf, addr szInput, addr tmp
   mov eax, dword ptr tmp
   ret
input_real:
   invoke crt_scanf, addr szInput_real, addr tmp
   fld dword ptr tmp
   ret
yu:
push ebp
mov ebp, esp
mov esi, ss:[ebp+0]
sub esp, 16		;Allocate Varable space

call input
mov edi, -4
mov ss:[ebp+edi], eax


call input
mov edi, -8
mov ss:[ebp+edi], eax


mov eax, 1

mov ecx, eax 		;ecx = for1
mov edi, -16
mov eax, 5

mov edx, eax 		;edx = for2
inc edx
mov ss:[ebp+edi], ecx
__CG__label0:
 cmp ecx, edx
 je __CG__label1		;for end
push edx		;save for2
push ecx		;save for1
mov edi, -4
mov eax, ss:[ebp+edi] 
push eax
mov edi, -16
mov eax, ss:[ebp+edi] 
push eax
mov eax, 2
mov ebx, eax
pop eax
xor edx, edx
mul ebx
mov ebx, eax
pop eax
mov eax, ebx
mov edi, -4
mov ss:[ebp+edi], eax

mov edi, -4
mov eax, ss:[ebp+edi] 
push eax
call output
pop  eax


pop ecx		;restore for1
pop edx		;restore for2
inc ecx
mov edi, -16
mov ss:[ebp+edi], ecx
jmp __CG__label0
 __CG__label1:


add esp, 16
pop ebp
ret
end    start
