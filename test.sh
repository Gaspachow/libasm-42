rm test.o libasm.a 
nasm -f elf64 test.s          
ar rcs libasm.a test.o        
clang main.c -o test -L. -lasm && ./test