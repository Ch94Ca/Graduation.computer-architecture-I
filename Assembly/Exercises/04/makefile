SRC := $(wildcard *.asm)
OBJ := $(patsubst %.asm, %.o, $(SRC))
EXE := $(patsubst %.asm, %, $(SRC))

make:
	nasm -f elf64 $(SRC)
	gcc -no-pie $(OBJ) -o exe
	
clean:
	rm -rf exe
	rm -rf *.o