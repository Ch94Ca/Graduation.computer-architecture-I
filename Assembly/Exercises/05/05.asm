extern	printf

SECTION .data

	finalValue dq 1999
	currentValue dq 1000

	printfFormat db "%ld % 11 = 5", 10, 0

SECTION .text

        global main

		main:
			
			startLoop:

			mov rdx, 0
			mov rax, [currentValue]
			mov rbx, 11
			div rbx
			cmp rdx, 5
			je printValue

			incAndSaveCurrentValue:
			mov rax, [currentValue]
			inc rax
			mov [currentValue], rax
			cmp rax, [finalValue]
			je endExecution
			jmp startLoop

			printValue:
			push rbp	
			mov	rdi, printfFormat
			mov	rsi, [currentValue] ; first parameter for printf
			mov	rax, 0				; no xmm registers
			call printf				; Call C function
			pop	rbp					; restore stack

			jmp incAndSaveCurrentValue

			endExecution:
			mov	rax,0				; normal, no error, return value
			ret						; return