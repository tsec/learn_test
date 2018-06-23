	.file	"limits.c"
	.text
	.globl	print_bin
	.type	print_bin, @function
print_bin:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	movl	$0, -4(%rbp)
	movl	$7, -4(%rbp)
	jmp	.L2
.L5:
	movzbl	-20(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L3
	movl	$49, %edi
	call	putchar
	jmp	.L4
.L3:
	movl	$48, %edi
	call	putchar
.L4:
	subl	$1, -4(%rbp)
.L2:
	cmpl	$0, -4(%rbp)
	jns	.L5
	movl	$10, %edi
	call	putchar
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print_bin, .-print_bin
	.section	.rodata
.LC2:
	.string	"float:%lf\n"
.LC3:
	.string	"float:%d\n"
.LC5:
	.string	"the FLOAT_MIN number is : %f\n"
.LC7:
	.string	"the FLOAT_MAX number is : %f\n"
.LC8:
	.string	"the INT_MAX number is : %d\n"
.LC9:
	.string	"char: %d\n"
.LC10:
	.string	"int: %d\n"
.LC11:
	.string	"short: %d\n"
.LC12:
	.string	"float: %d\n"
.LC13:
	.string	"double: %d\n"
.LC14:
	.string	"long: %d\n"
.LC15:
	.string	"long long: %d\n"
.LC16:
	.string	"the LONG_MAX number is : %ld\n"
	.align 8
.LC17:
	.string	"the LLONG_MAX number is : %lld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movabsq	$4741671816366391296, %rax
	movq	%rax, -24(%rbp)
	movabsq	$4741671816374779904, %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
	leaq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	print_bin
	movq	-8(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	print_bin
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	print_bin
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %edi
	call	print_bin
	movl	$4, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movabsq	$4039728865751334912, %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	movabsq	$5183643170566569984, %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
	movl	$2147483647, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %esi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	movl	$4, %esi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	movl	$2, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	movl	$4, %esi
	movl	$.LC12, %edi
	movl	$0, %eax
	call	printf
	movl	$8, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	movl	$8, %esi
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
	movl	$8, %esi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	movabsq	$9223372036854775807, %rsi
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	movabsq	$9223372036854775807, %rsi
	movl	$.LC17, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
