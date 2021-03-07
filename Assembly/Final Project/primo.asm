; Programa: Verifica se número é primo
; Solicita ao usuário um número inteiro e verifica se é um número primo
; Autor: Carlos Henrique Silva Correia de Araújo
; Aluno de Engenharia de Computacao - UFPB

; montagem: 'make' no terminal linux (makefile em anexo)

extern	scanf, printf

SECTION .bss

	user_input_value resq 1 ; Variável que irá armazenar a entrada do usuário

SECTION .data

	; Variáveis que armazenam os formatos de saida para a função printf
	printf_request_format db 0AH, "Digite o número inteiro: ", 0H
	printf_result_prime_format db 0AH, "%ld é um número primo.", 0AH, 0H
	printf_result_not_prime_format db 0AH, "%ld não é um número primo.", 0AH, 0H
	printf_ask_user_restart_format db 0AH, "Deseja verificar um novo número? Sim(1) / Não(0): ", 0H
	
	; Variável que armazena o formato de entrada para a função scanf
	input_format db "%ld", 0H

SECTION .text

        global main

		; Início da função main
		main:

			; Solicita ao usuário que informe um número inteiro,
			; e realiza a leitura através da função scanf
			push rbp	
			mov	rdi, printf_request_format
			xor rax, rax							
			call printf
			
			mov	rsi, user_input_value
			mov rdi, input_format
			xor rax, rax							
			call scanf
			pop	rbp		

			mov rdi, [user_input_value] ; Move o parâmetro da função para RDI
			call is_prime 				; Realiza a chamada da função is_prime

			cmp rax, 0         ; Verifica o retorno da função is_prime
			je print_not_prime ; Desvia a execução para a label print_not_prime se o retorno for 0
			jmp print_prime	   ; Desvia a execução para a label print_prime se o retorno for 1

			; Imprime menssagem informando que o número é primo e desvia
			; a execução para a label ask_user_restart
			print_prime:
				push rbp	
				mov	rdi, printf_result_prime_format
				mov	rsi, [user_input_value] 						
				mov	rax, 0							
				call printf							
				pop	rbp
				jmp ask_user_restart

			; Imprime menssagem informando que o número não é primo e desvia
			; a execução para a label ask_user_restart
			print_not_prime:
				push rbp	
				mov	rdi, printf_result_not_prime_format
				mov	rsi, [user_input_value] 						
				mov	rax, 0							
				call printf							
				pop	rbp
				jmp ask_user_restart	

			; Imprime menssagem e pergunta se o usuário deseja verificar outro número
			; Se a entrada do usuário for 0 (não), desvia a execução para a label 
			; end_execution (encerra o programa).
			; Se a entrada do usuário for 1 (sim), desvia a execução para a label
			; main (inicio do programa / reinicia a execução).
			ask_user_restart:
				push rbp	
				mov	rdi, printf_ask_user_restart_format
				xor rax, rax							
				call printf							

				mov	rsi, user_input_value
				mov rdi, input_format
				xor rax, rax							
				call scanf
				pop	rbp	

				mov rax, [user_input_value]

				cmp rax, 0
				je end_execution
				jmp main

			end_execution:
				xor rax, rax ; Armazena 0 em RAX, valor de retorno para a função main			
				ret			 ; retorno da função main, fim da execução						

		; Função is_prime
		; Parâmetro: um número inteiro
		; Retorno: 0 se o número não for primo
		;		   1 se o número for primo
		is_prime:

			; Prólogo da função
			push rbp
			mov rbp, rsp
			
			cmp rdi, 2		; Verifica se o parâmetro recebido é o número 2 (único número primo par)
			je return_prime	; se for, retorna que o número é primo.

			mov rbx, 2 		; Valor inicial para as sucessivas divisões do loop
			
			; Loop que verifica se o número é primo
			; Um número primo só pode ser divisível por 1 e ele mesmo
			; O loop inicia dividindo por 2(já elimina números pares),
			; e incrementa o valor de RBX enquanto ele for menor que o parâmetro 
			; passado para a função.
			; Caso encontre um divisor (resto 0 em RDX), desvia
			; a execução para a label return_not_prime
			; Caso não encontre nenhum divisor entre 2 e parâmetro-1, desvia
			; a execução para a label return_prime
			start_function_loop:
				xor rdx, rdx
				mov rax, rdi
				div rbx
				cmp rdx, 0			
				je return_not_prime
				inc rbx
				cmp rbx, rdi
				jb start_function_loop
				jmp return_prime

			return_prime: ; valor de retorno 1 em RAX caso o número seja primo
				mov rax, 1
				jmp end_function

			return_not_prime: ; valor de retorno 0 em RAX caso o número seja primo
				mov rax, 0
			
			; Epílogo da função
			end_function:
				mov rsp, rbp
				pop rbp
				ret