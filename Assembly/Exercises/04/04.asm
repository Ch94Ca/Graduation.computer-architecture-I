extern	printf

SECTION .data

	valueA dq 27

	printfFormatEven db "%ld é PAR", 10, 0
	printfFormatOdd db "%ld é IMPAR", 10, 0

SECTION .text

        global main

		main:

			mov rdx, 0
			mov rax, [valueA]

			mov rbx, 2

			div rbx

			cmp rdx, 0

			je isEven

			jmp isOdd

			isEven:
			mov	rdi, printfFormatEven
			jmp print

			isOdd:
			mov	rdi, printfFormatOdd

			print:
			push rbp	

			mov	rsi, [valueA]    	; first parameter for printf
			mov	rax, 0				; no xmm registers

			call printf				; Call C function

			pop	rbp					; restore stack

			mov	rax,0				; normal, no error, return value
			ret						; return