[BITS 64]
	global strlen:function

	section .text
strlen:
	push rbp
	mov rbp, rsp

	xor rax, rax
	xor rcx, rcx
.loop:
	mov cl, BYTE [rdi + rax]
	cmp cl, 0
	je end
	inc rax
	jmp .loop

end:
	mov rsp, rbp
	pop rbp
	ret
