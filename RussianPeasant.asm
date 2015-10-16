; Russian Peasant Algorithm
; Erik Vanlandingham

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
numX dword 128
numY dword 256
answer dword 0

.code
main proc
    mov eax, numX
    mov ebx, numY
    
.while:
    test eax, eax
    je .finished
    test ebx, ebx
    je .finished
    
    test eax, 00000001
    jz .MultDiv
    add answer, eax
    
.MultDiv:
    shr eax, 1
    shl ebx, 1
    jmp .while

.finished:

	invoke ExitProcess,0
main endp
end main