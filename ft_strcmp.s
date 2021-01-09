section .text
	global ft_strcmp

ft_strcmp:
	xor	rax, rax			; set value to zero with xor bit manipulation (fastest way to put register to zero)
	xor	r8, r8				; set value to zero with xor bit manipulation (fastest way to put register to zero)

while:
	mov	al, BYTE [rdi]		; move rdi and rsi's byte value (not address) in al and r8b (al and r8b are the first bytes of rax and r8)
	mov r8b, BYTE [rsi]
	cmp al, r8b				; check if they're equal
	jne	return				; if not equal, return
	cmp al, 0				; check if al's char is null
	je	return				; if equal, return
	cmp	r8b, 0				; check if r8b's char is null
	je	return				; if equal, return
	inc	rdi					; increase rdi address
	inc	rsi					; increase rsi address
	jmp while				; start while loop again

return:
	sub rax, r8				; {rax = rax - r8]} substract the character's values
	ret						; returns rax (which is all zero except his first byte that we modified by calling al)

