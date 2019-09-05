[BITS 64]
	global memcpy:function

	section .text
memcpy:
	push rbp
	mov rbp, rsp
	mov rcx, 0
.l1:
	cmp rcx, rdx
	jge .l1end
	mov al, BYTE [rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	jmp .l1
.l1end:

	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
