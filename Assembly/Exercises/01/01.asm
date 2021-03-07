extern	printf

SECTION .data

	printfFormat db "a = %ld", 10, 0	; The printf format, "\n",'0'


SECTION .text

        global main

		main:
			
			mov	rax, 0 				; 0 to rax register
			mov rbx, 0 				; 0 to rbx register

			startLoop:			

			inc rbx					; increment rbx
			add rax, rbx			; sum rax value to rbx value
			cmp rbx, 100			; comapre if rbx value is equal to 100
			jb startLoop			; restart loop if not 

			push rbp	

			mov	rdi, printfFormat 	; format for printf
			mov	rsi, rax     		; first parameter for printf
			mov	rax, 0				; no xmm registers

			call printf				; Call C function

			pop	rbp					; restore stack

			mov	rax,0				; normal, no error, return value
			ret						; return