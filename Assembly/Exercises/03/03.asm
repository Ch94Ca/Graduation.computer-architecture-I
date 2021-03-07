extern	printf

SECTION .data

	valueA dq 1
	valueB dq 5

	printfFormat db "a = %ld", 10, 0	; The printf format, "\n",'0'

SECTION .text

        global main

		main:
			
			mov rax, [valueA]
			mov rbx, [valueB]

			cmp rbx, rax

			ja printRBX

			jmp printRAX

			printRBX:
			mov rax, rbx

			printRAX:
			push rbp	

			mov	rdi, printfFormat 	; format for printf
			mov	rsi, rax     		; first parameter for printf
			mov	rax, 0				; no xmm registers

			call printf				; Call C function

			pop	rbp					; restore stack

			mov	rax,0				; normal, no error, return value
			ret						; return