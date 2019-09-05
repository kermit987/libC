[BITS 64]
	global strcasecmp:function

	;; rdi s1
	;; rsi s2
	section .text
strcasecmp:
	push rbp
	mov rbp, rsp

	mov rax, 0
	mov rcx, 0
.l1:
	cmp [rdi + rcx], BYTE 0
	je .lend
	cmp [rsi + rcx], BYTE 0
	je .lend

	mov al, BYTE [rdi + rcx]
	cmp al, 'a'
	jl .l11
	cmp al, 'z'
	jg .l11
	sub al, 'a' - 'A'

.l11:
	mov dl, BYTE [rsi + rcx]
	cmp dl, 'a'
	jl .lcmp
	cmp dl, 'z'
	jg .lcmp
	sub dl, 'a' - 'A'

.lcmp:
	sub rax, rdx
	cmp rax, 0
	jne .lend

	inc rcx
	jmp .l1

.lend:
	mov rbp, rsp
	pop rbp
	ret
