[BITS 64]
	global strcspn:function

	;; rdi s
	;; rsi reject
section .text
strcspn:
	push rbp
	mov rbp, rsp

	xor rax, rax
	xor rdx, rdx
.l1:
	cmp BYTE [rdi + rax], 0
	je .lend

	xor rcx, rcx
.l2:
	mov dl, BYTE [rsi + rcx]
	cmp dl, 0
	je .l2end
	cmp dl, BYTE [rdi + rax]
	je .lend
	inc rcx
	jmp .l2

.l2end:
	inc rax
	jmp .l1

.lend:
	mov rsp, rbp
	pop rbp
	ret
