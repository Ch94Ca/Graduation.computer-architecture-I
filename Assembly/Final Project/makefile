SRC := $(wildcard *.asm)
OBJ := $(patsubst %.asm, %.o, $(SRC))
EXE := $(patsubst %.asm, %, $(SRC))

make:
	nasm -f elf64 $(SRC)
	gcc -no-pie $(OBJ) -o exe
	clear
	@echo ----------------------------------
	@echo --- Verifica se número é primo ---
	@echo ----------------------------------
	@echo ----------------------------------
	@echo --- Exemplo de números primos: ---
	@echo ----------------------------------
	@echo --- 2 dígitos: 19,23,31,41,43 ----
	@echo ----------------------------------
	@echo --- 3 dígitos: 139,149,173,199 ---
	@echo ----------------------------------
	@echo --- 5 dígitos: 64019,66653,38069 -
	@echo ----------------------------------
	@echo --- 10 dígitos: 5915587277 -------
	@echo ----------------------------------
	@echo ----------------------------------
	@echo ------ ./exe para executar -------
	@echo ----------------------------------
	
clean:
	rm -rf exe
	rm -rf *.o