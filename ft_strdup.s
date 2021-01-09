section .text
	global	ft_strdup
	extern	malloc			; including malloc, strlen and strcpy
	extern	ft_strlen
	extern	ft_strcpy

ft_strdup:					; strdup receives src string's address as rdi

	push	rdi				; saving the value of rdi to use later in strcpy
	call	ft_strlen		; strlen takes rdi and returns the length in rax
	inc		rax
	mov		rdi, rax
	call	malloc
	cmp		rax, 0
	je		fail
	mov		rdi, rax
	pop		rsi
	call	ft_strcpy
	ret

fail:
	mov		rax, 0
	ret
