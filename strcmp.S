[BITS 64]
	global strcmp:function

	section .text
strcmp:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rcx, 0
.l1:
	mov al, BYTE [rdi]
	mov cl, BYTE [rsi]
	cmp al, cl
	jne .diff
	cmp al, 0
	je .equal
	inc rdi
	inc rsi
	jmp .l1

.equal:
	mov rax, 0
	jmp .lend
.diff:
	sub rax, rcx
.lend:
	mov rsp, rbp
	pop rbp
	ret
