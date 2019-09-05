[BITS 64]
	global strdup:function
	extern malloc

	section .text
strdup:
	push rbp
	mov rbp, rsp

	mov rax, 0
.l1:
	cmp [rdi + rax], byte 0
	je .l1end
	inc rax
	jmp .l1
.l1end:
	inc rax
	push rdi
	mov rdi, rax
	call malloc WRT ..plt
	pop rdi

	mov rcx, 0
.l2:
	cmp [rdi + rcx], byte 0
	je .l2end
	mov dl, [rdi + rcx]
	mov BYTE [rax + rcx], dl
	inc rcx
	jmp .l2
.l2end:
	mov BYTE [rax + rcx], 0

	mov rsp, rbp
	pop rbp
	ret
