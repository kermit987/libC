[BITS 64]
global memset:function

section .text
memset:
	push rbp
	mov rbp, rsp
	xor rax, rax
	mov rax, -1
	;;
L20:
	inc rax
	mov rcx, rsi
	cmp rax, rdx
	je end
	;; mov bl, byte [rdi + rax]
	mov byte [rdi + rax], cl
	cmp rax, rdx
	jne L20
end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
