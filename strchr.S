[BITS 64]
	global my_strchr:function

	section .text
my_strchr:
	push rbp
	mov rbp, rsp

	mov rcx, rsi
	mov rax, rdi
.l1:
	cmp BYTE [rax], cl
	je .lend
	cmp BYTE [rax], 0
	je .nomatch
	inc rax
	jmp .l1

.nomatch:
	mov rax, 0
.lend:
	mov rsp, rbp
	pop rbp
	ret
