; Russian Peasant Algorithm, Ch 7 and Midterm
; Erik Vanlandingham
; CIS-361
; Last Modified 10-17-15

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
    
	L1:                         ; I went with a stantard loop from class, it was easier to use
                                ; Test if Either Value is 0
                                ; Testing does not modify the registers 
                                ; whereas the cmp function would 
		test eax, eax           ; x == 0
		je finished             ; If a value is equal to 0, we can jump out   
		test ebx, ebx           ; y == 0
		je finished             ; If a value is equal to 0, we can jump out   
    
	    test ebx, 00000001      ; Test if the dividing num is odd
		jz Shifts               ; If it isn't, Jump to the shifts and repeat the loop
		add answer, eax         ; Otherwise add to the Multiplier
		jmp Shifts              ; Then shift, and loop
	 loop L1
    
	Shifts:                     ; Creating a jump point for the shifting made life much easier
		shr ebx, 1              ; Divide Y
		shl eax, 1              ; Mult X
		jmp L1                  ; Jump back into checking for 0 values

	finished:                   ; Created a Jump Location to easily escape the loop
                                ; It just allows the program to terminate
	invoke ExitProcess,0
main endp
end main