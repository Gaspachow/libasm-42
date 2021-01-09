section .text
	global ft_strlen			        ; must be declared for linker (gcc)

ft_strlen:							    ; entry point of function, it receives rdi as argument (address of the string's first character)
	xor     rax, rax					; set rax to zero with xor bit manipulation (fastest way to put register to zero)

while:
	cmp	    BYTE [rdi + rax], 0	 		; comparing address + len with NULL value
	je	    return				 		; if the previous line triggered the zero flag (meaning the two values were equal), it returns.
	inc	    rax                         ; increment rax
	jmp	    while                       ; go back to beginning of while loop

return:
	ret                                 ; return rax