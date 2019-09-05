[BITS 64]
	global strncmp:function

	section .text
strncmp:
	push rbp
	mov rbp, rsp

	xor rax, rax
	xor rcx, rcx
.l1:
	cmp rdx, 0
	jle .lend
	mov al, BYTE [rdi]
	mov cl, BYTE [rsi]
	sub rax, rcx
	inc rdi
	inc rsi
	dec rdx
	cmp rax, 0
	je .l1

.lend:
	mov rsp, rbp
	pop rbp
	ret
