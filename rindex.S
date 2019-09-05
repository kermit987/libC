[BITS 64]
global myrindex:function
section .text

myrindex:
	push rbp
	mov rbp, rsp
	;; 
	mov rax, -1
	jmp until_end
until_end:
	inc rax
	cmp BYTE [rdi + rax], 0
	jne until_end
try_match:
	cmp rax, 0
	je my_error
	sub rax, 1
	mov bl, byte [rdi + rax]
	cmp si, bx
	jne try_match
	add rdi, rax
	mov rax, rdi
	;; 
	mov rsp, rbp
	pop rbp
	ret
my_error:
	mov rax, 0
	;; 
	mov rsp, rbp
	pop rbp
	ret
