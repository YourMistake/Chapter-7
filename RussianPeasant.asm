; Russian Peasant Algorithm
; Erik Vanlandingham

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
numX dword 32
numY dword 21
answer dword 0

.code
main proc
    mov eax, numX
    mov ebx, numY
    
	L1:
		test eax, eax   ;x==0
		je finished   
		test ebx, ebx   ;y==0
		je finished
    
	    test ebx, 00000001
		jz Shifts
		add answer, eax
		jmp Shifts
		
    
	 loop L1
    
	Shifts:
		shr ebx, 1
		shl eax, 1
		jmp L1

	finished:

	invoke ExitProcess,0
main endp
end main