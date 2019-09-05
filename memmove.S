[BITS 64]
	global memmove:function

	section .text
memmove:
	push rbp
	mov rbp, rsp

	cmp rdx, 0
	je .end
	cmp rdi, rsi
	je .end
	jg .move2

	mov rcx, 0
.l1:
	cmp rcx, rdx
	jge .end
	mov al, BYTE [rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	jmp .l1

.move2:
	mov rcx, rdx
.l2:
	cmp rcx, 0
	jle .end
	mov al, BYTE [rsi + rcx - 1]
	mov [rdi + rcx - 1], al
	dec rcx
	jmp .l2

.end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
