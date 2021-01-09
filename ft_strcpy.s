section .text
	global ft_strcpy

ft_strcpy:              ; function gets rdi and rsi args (rdi = dest, rsi = src)
	push	rdi         ; Push rdi to the pile to get get back destination's inital address later
	xor		r8, r8

while:
	mov		r8b, [rsi]  ; Move rsi's value internally (using r8b because we only want to move only a byte of data)
	mov		[rdi], r8b  ; Move internal value to destination
	cmp		r8b, 0      ; Check if destination value was NULL
	je		return      ; If copied char was null, return
	inc		rdi         ; increment destination address
	inc		rsi         ; increment source address
	jmp		while	    ; do another while loop

return:
	pop		rax         ; before returning, we pop destination's inital address from the pile into rax
	ret                 ; returns rax