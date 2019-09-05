[BITS 64]
	global my_strstr:function

	;; rdi haystack
	;; rsi needle
	section .text
my_strstr:
	push rbp
	mov rbp, rsp

	;; needle is an empty string
	mov rax, rdi
	cmp BYTE [rsi], 0
	je .rtn

	mov rax, 0
	mov rcx, 0
	mov rdx, 0
.l1:
	;; end of haystack
	cmp BYTE [rdi], 0
	je .end

	;; Check if reach end of needle
	mov dl, BYTE [rsi + rcx]
	cmp dl, 0
	je .end
	;; Comparing haystack and needle
	cmp dl, BYTE [rdi]
	jne .reset
	inc rcx
	jmp .cnt

.reset:
	;; Reset counter of needle
	mov rcx, 0
.cnt:
	inc rdi
	jmp .l1

.end:
	;; Check that needle is at end of haystack
	cmp rcx, 0
	je .rtn
	sub rdi, rcx
	mov rax, rdi

.rtn:
	mov rsp, rbp
	pop rbp
	ret
