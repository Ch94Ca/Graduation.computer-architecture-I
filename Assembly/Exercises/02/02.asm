extern	printf

SECTION .data

	valueA dq 0
	valueB dq 5
	valueC dq 7

	printfFormat db "a = %ld", 10, 0	; The printf format, "\n",'0'

SECTION .text

        global main

		main:
			
			mov rax, [valueB]
			mov rbx, [valueC]
			add rax, rbx
			add rax, 100
			mov [valueA], rax

			push rbp	

			mov	rdi, printfFormat 	; format for printf
			mov	rsi, [valueA]     	; first parameter for printf
			mov	rax, 0				; no xmm registers

			call printf				; Call C function

			pop	rbp					; restore stack

			mov	rax,0				; normal, no error, return value
			ret						; return