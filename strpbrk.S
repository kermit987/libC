[BITS 64]
	global strpbrk:function

	;; rdi s
	;; rsi accept
	section .text
strpbrk:
	push rbp
	mov rbp, rsp

	mov rax, rdi
	mov rdx, 0
.l1:
	cmp BYTE [rax], 0
	je .badend

	mov rcx, 0
.l2:
	mov dl, BYTE [rsi + rcx]
	cmp dl, 0
	je .l2end
	cmp dl, BYTE [rax]
	je .lend
	inc rcx
	jmp .l2

.l2end:
	inc rax
	jmp .l1

.badend:
	mov rax, 0
.lend:
	mov rsp, rbp
	pop rbp
	ret
