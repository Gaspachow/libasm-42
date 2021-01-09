section .text
	global ft_read
	extern __errno_location	; includes ___error but for linux

ft_read:
	mov		rax, 0			; rax = 1
	syscall					; syscall(rax = calls index, also takes rdi, rsi and rdx as arguments)
	test 	rax, rax		; bitwise "AND" operation, triggers the SF flag if it's signed (negative)
	js		fail			; if SF = 1 -> rax is negative -> syscall returned an error
	ret						; return

fail:
	neg		rax				; changes rax to positive, the positive error num is needed
	push	rax				; pushing rax to pile to preserve the error value
	call __errno_location	; __errno_location puts the address location we need in rax
	pop		QWORD [rax]		; we pop the value stored earlier into the errno address (as a 64-bit qword)
	mov		rax, -1			; we change rax to -1 so that ft_read returns it failed
	ret						; returns rax
