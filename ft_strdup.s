section .text
	global	ft_strdup
	extern	malloc			; including malloc, strlen and strcpy
	extern	ft_strlen
	extern	ft_strcpy

ft_strdup:					; strdup receives src string's address as rdi

	push	rdi				; saving the value of rdi to use later in strcpy
	call	ft_strlen		; strlen takes rdi and returns the length in rax
	inc		rax				; increase rax by one to account for the '/0'
	mov		rdi, rax		; move rax to rdi
	call	malloc			; malloc takes rdi as argument for the size to allocate
	cmp		rax, 0			; compare the rax (returned value of malloc) with NULL
	je		fail			; if equal, malloc returned NULL and there was a fail
	mov		rdi, rax		; we move the allocated memory address to rdi (first arg)
	pop		rsi				; we pop the saved src address from the pile into rsi (second arg)
	call	ft_strcpy		; ft_strcpy takes rdi and rsi as arguments and copies rsi in rdi
	ret						; returns rax (which still has the destination address)

fail:
	mov		rax, 0			; if fail, strdup returns NULL so we move 0 in rax
	ret						; returns rax (0)
