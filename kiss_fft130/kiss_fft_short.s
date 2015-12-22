	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_0:
	.quad	-4604611780675359464    ## double -6.2831853071795862
LCPI0_2:
	.quad	4674736138332667904     ## double 32767
LCPI0_3:
	.quad	4602678819172646912     ## double 0.5
	.section	__TEXT,__const
	.align	4
LCPI0_1:
	.quad	-9223372036854775808    ## double -0.000000e+00
	.quad	-9223372036854775808    ## double -0.000000e+00
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kiss_fft_alloc
	.align	4, 0x90
_kiss_fft_alloc:                        ## @kiss_fft_alloc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%r15
Ltmp7:
	.cfi_def_cfa_offset 24
	pushq	%r14
Ltmp8:
	.cfi_def_cfa_offset 32
	pushq	%r12
Ltmp9:
	.cfi_def_cfa_offset 40
	pushq	%rbx
Ltmp10:
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
Ltmp11:
	.cfi_def_cfa_offset 80
Ltmp12:
	.cfi_offset %rbx, -48
Ltmp13:
	.cfi_offset %r12, -40
Ltmp14:
	.cfi_offset %r14, -32
Ltmp15:
	.cfi_offset %r15, -24
Ltmp16:
	.cfi_offset %rbp, -16
	movl	%esi, %r12d
	movl	%edi, %ebx
	leal	-1(%rbx), %r15d
	movslq	%r15d, %rax
	leaq	268(,%rax,4), %rdi
	testq	%rcx, %rcx
	je	LBB0_1
## BB#2:
	xorl	%r14d, %r14d
	testq	%rdx, %rdx
	je	LBB0_5
## BB#3:
	xorl	%r14d, %r14d
	cmpq	%rdi, (%rcx)
	jb	LBB0_5
## BB#4:
	movq	%rdx, %r14
LBB0_5:
	movq	%rdi, (%rcx)
	jmp	LBB0_6
LBB0_1:
	callq	_malloc
	movq	%rax, %r14
LBB0_6:
	testq	%r14, %r14
	je	LBB0_21
## BB#7:
	movl	%ebx, (%r14)
	movl	%r12d, 4(%r14)
	cvtsi2sdl	%ebx, %xmm0
	movsd	%xmm0, 16(%rsp)         ## 8-byte Spill
	testl	%ebx, %ebx
	jle	LBB0_13
## BB#8:                                ## %.lr.ph.preheader
	xorl	%ebp, %ebp
	jmp	LBB0_9
	.align	4, 0x90
LBB0_12:                                ## %._crit_edge2
                                        ##   in Loop: Header=BB0_9 Depth=1
	incq	%rbp
	movl	4(%r14), %r12d
LBB0_9:                                 ## %.lr.ph
                                        ## =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%ebp, %xmm0
	mulsd	LCPI0_0(%rip), %xmm0
	divsd	16(%rsp), %xmm0         ## 8-byte Folded Reload
	testl	%r12d, %r12d
	je	LBB0_11
## BB#10:                               ##   in Loop: Header=BB0_9 Depth=1
	xorpd	LCPI0_1(%rip), %xmm0
LBB0_11:                                ##   in Loop: Header=BB0_9 Depth=1
	callq	___sincos_stret
	movsd	%xmm0, 24(%rsp)         ## 8-byte Spill
	movsd	LCPI0_2(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	LCPI0_3(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	callq	_floor
	cvttsd2si	%xmm0, %eax
	movw	%ax, 264(%r14,%rbp,4)
	movsd	24(%rsp), %xmm0         ## 8-byte Reload
	mulsd	LCPI0_2(%rip), %xmm0
	addsd	LCPI0_3(%rip), %xmm0
	callq	_floor
	cvttsd2si	%xmm0, %eax
	movw	%ax, 266(%r14,%rbp,4)
	cmpl	%ebp, %r15d
	jne	LBB0_12
LBB0_13:                                ## %._crit_edge
	leaq	8(%r14), %rbp
	sqrtsd	16(%rsp), %xmm0         ## 8-byte Folded Reload
	callq	_floor
	movl	$4, %ecx
	.align	4, 0x90
LBB0_14:                                ## %.outer.i
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_15 Depth 2
	movl	%ebx, %eax
	cltd
	idivl	%ecx
	testl	%edx, %edx
	je	LBB0_20
	.align	4, 0x90
LBB0_15:                                ## %.lr.ph.i
                                        ##   Parent Loop BB0_14 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$2, %esi
	cmpl	$4, %ecx
	je	LBB0_19
## BB#16:                               ## %.lr.ph.i
                                        ##   in Loop: Header=BB0_15 Depth=2
	cmpl	$2, %ecx
	jne	LBB0_18
## BB#17:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	$3, %esi
	jmp	LBB0_19
	.align	4, 0x90
LBB0_18:                                ##   in Loop: Header=BB0_15 Depth=2
	addl	$2, %ecx
	movl	%ecx, %esi
LBB0_19:                                ## %.backedge.i
                                        ##   in Loop: Header=BB0_15 Depth=2
	cvtsi2sdl	%esi, %xmm1
	ucomisd	%xmm0, %xmm1
	cmoval	%ebx, %esi
	movl	%ebx, %eax
	cltd
	idivl	%esi
	testl	%edx, %edx
	movl	%esi, %ecx
	jne	LBB0_15
LBB0_20:                                ## %._crit_edge.i
                                        ##   in Loop: Header=BB0_14 Depth=1
	movl	%ebx, %eax
	cltd
	idivl	%ecx
	movl	%ecx, (%rbp)
	movl	%eax, %ebx
	movl	%ebx, 4(%rbp)
	addq	$8, %rbp
	cmpl	$1, %ebx
	jg	LBB0_14
LBB0_21:                                ## %kf_factor.exit
	movq	%r14, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_kiss_fft_stride
	.align	4, 0x90
_kiss_fft_stride:                       ## @kiss_fft_stride
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp22:
	.cfi_def_cfa_offset 16
	pushq	%r15
Ltmp23:
	.cfi_def_cfa_offset 24
	pushq	%r14
Ltmp24:
	.cfi_def_cfa_offset 32
	pushq	%rbx
Ltmp25:
	.cfi_def_cfa_offset 40
	pushq	%rax
Ltmp26:
	.cfi_def_cfa_offset 48
Ltmp27:
	.cfi_offset %rbx, -40
Ltmp28:
	.cfi_offset %r14, -32
Ltmp29:
	.cfi_offset %r15, -24
Ltmp30:
	.cfi_offset %rbp, -16
	movl	%ecx, %ebp
	movq	%rdx, %rax
	movq	%rsi, %r14
	movq	%rdi, %rbx
	cmpq	%rax, %r14
	je	LBB1_1
## BB#2:
	leaq	8(%rbx), %r8
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	%ebp, %ecx
	movq	%rbx, %r9
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_kf_work                ## TAILCALL
LBB1_1:
	movslq	(%rbx), %rdi
	shlq	$2, %rdi
	callq	_malloc
	movq	%rax, %r15
	leaq	8(%rbx), %r8
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%ebp, %ecx
	movq	%rbx, %r9
	callq	_kf_work
	movslq	(%rbx), %rdx
	shlq	$2, %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_memcpy
	movq	%r15, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_free                   ## TAILCALL
	.cfi_endproc

	.align	4, 0x90
_kf_work:                               ## @kf_work
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp38:
	.cfi_def_cfa_offset 16
	pushq	%r15
Ltmp39:
	.cfi_def_cfa_offset 24
	pushq	%r14
Ltmp40:
	.cfi_def_cfa_offset 32
	pushq	%r13
Ltmp41:
	.cfi_def_cfa_offset 40
	pushq	%r12
Ltmp42:
	.cfi_def_cfa_offset 48
	pushq	%rbx
Ltmp43:
	.cfi_def_cfa_offset 56
	subq	$152, %rsp
Ltmp44:
	.cfi_def_cfa_offset 208
Ltmp45:
	.cfi_offset %rbx, -56
Ltmp46:
	.cfi_offset %r12, -48
Ltmp47:
	.cfi_offset %r13, -40
Ltmp48:
	.cfi_offset %r14, -32
Ltmp49:
	.cfi_offset %r15, -24
Ltmp50:
	.cfi_offset %rbp, -16
	movq	%r9, 88(%rsp)           ## 8-byte Spill
	movq	%r8, 104(%rsp)          ## 8-byte Spill
	movl	%ecx, 144(%rsp)         ## 4-byte Spill
	movq	%rsi, %r13
	movl	(%r8), %esi
	movslq	%esi, %rax
	movslq	4(%r8), %r14
	movq	%r14, 112(%rsp)         ## 8-byte Spill
	cmpq	$1, %r14
	jne	LBB2_1
## BB#3:                                ## %.preheader29
	movq	%rax, 80(%rsp)          ## 8-byte Spill
	movslq	144(%rsp), %rax         ## 4-byte Folded Reload
	imulq	%rdx, %rax
	movq	%rdx, 120(%rsp)         ## 8-byte Spill
	shlq	$2, %rax
	movl	%r14d, %ecx
	imull	%esi, %ecx
	movq	%rsi, 136(%rsp)         ## 8-byte Spill
	movslq	%ecx, %rcx
	shlq	$2, %rcx
	movq	%rdi, %rdx
	movq	%rdi, 128(%rsp)         ## 8-byte Spill
	.align	4, 0x90
LBB2_4:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%r13), %esi
	movl	%esi, (%rdx)
	addq	$4, %rdx
	addq	%rax, %r13
	addq	$-4, %rcx
	jne	LBB2_4
	jmp	LBB2_5
LBB2_1:                                 ## %.preheader30
	movq	%rdi, 128(%rsp)         ## 8-byte Spill
	addq	$8, 104(%rsp)           ## 8-byte Folded Spill
	movq	%rax, %rcx
	movq	%rax, 80(%rsp)          ## 8-byte Spill
	imulq	%rdx, %rcx
	movq	%rcx, %r15
	movslq	144(%rsp), %r12         ## 4-byte Folded Reload
	imulq	%rdx, %r12
	movq	%rdx, 120(%rsp)         ## 8-byte Spill
	shlq	$2, %r12
	movl	%r14d, %eax
	imull	%esi, %eax
	movq	%rsi, 136(%rsp)         ## 8-byte Spill
	movslq	%eax, %rbp
	shlq	$2, %rbp
	leaq	(,%r14,4), %rax
	movq	%rax, 96(%rsp)          ## 8-byte Spill
	xorl	%ebx, %ebx
	.align	4, 0x90
LBB2_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	128(%rsp), %rax         ## 8-byte Reload
	leaq	(%rax,%rbx), %rdi
	movq	%r13, %rsi
	movq	%r15, %rdx
	movl	144(%rsp), %ecx         ## 4-byte Reload
	movq	104(%rsp), %r8          ## 8-byte Reload
	movq	88(%rsp), %r9           ## 8-byte Reload
	callq	_kf_work
	addq	%r12, %r13
	addq	96(%rsp), %rbx          ## 8-byte Folded Reload
	cmpq	%rbx, %rbp
	jne	LBB2_2
LBB2_5:                                 ## %.loopexit
	movq	136(%rsp), %rax         ## 8-byte Reload
	leal	-2(%rax), %eax
	cmpl	$3, %eax
	jbe	LBB2_6
## BB#20:
	movq	88(%rsp), %rax          ## 8-byte Reload
	movl	(%rax), %r15d
	movq	%rax, %r13
	movq	80(%rsp), %rdi          ## 8-byte Reload
	shlq	$2, %rdi
	callq	_malloc
	movq	%rax, %rbx
	testl	%r14d, %r14d
	movq	128(%rsp), %rcx         ## 8-byte Reload
	movq	136(%rsp), %rsi         ## 8-byte Reload
	jle	LBB2_28
## BB#21:                               ## %.preheader.lr.ph.i
	leaq	(,%r14,4), %r8
	movq	%r8, 96(%rsp)           ## 8-byte Spill
	xorl	%ebp, %ebp
	movq	%rcx, 72(%rsp)          ## 8-byte Spill
	xorl	%eax, %eax
	.align	4, 0x90
LBB2_22:                                ## %.preheader.i
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_24 Depth 2
                                        ##     Child Loop BB2_26 Depth 2
                                        ##     Child Loop BB2_31 Depth 2
                                        ##       Child Loop BB2_29 Depth 3
	movq	%rax, 80(%rsp)          ## 8-byte Spill
	testl	%esi, %esi
	jle	LBB2_27
## BB#23:                               ## %.lr.ph.i
                                        ##   in Loop: Header=BB2_22 Depth=1
	movl	$32767, %eax            ## imm = 0x7FFF
	xorl	%edx, %edx
	idivl	%esi
	movq	%rcx, %r9
	xorl	%edx, %edx
	movq	80(%rsp), %r10          ## 8-byte Reload
	.align	4, 0x90
LBB2_24:                                ##   Parent Loop BB2_22 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r9,%r10,4), %edi
	movl	%edi, (%rbx,%rdx,4)
	movswl	%di, %edi
	imull	%eax, %edi
	addl	$16384, %edi            ## imm = 0x4000
	shrl	$15, %edi
	movw	%di, (%rbx,%rdx,4)
	movswl	2(%rbx,%rdx,4), %edi
	imull	%eax, %edi
	addl	$16384, %edi            ## imm = 0x4000
	shrl	$15, %edi
	movw	%di, 2(%rbx,%rdx,4)
	incq	%rdx
	addq	%r8, %r9
	cmpl	%edx, %esi
	jne	LBB2_24
## BB#25:                               ## %.lr.ph8.i
                                        ##   in Loop: Header=BB2_22 Depth=1
	xorl	%edi, %edi
	cmpl	$1, %esi
	movl	(%rbx), %r9d
	movl	%r9d, 104(%rsp)         ## 4-byte Spill
	movq	%r10, %r12
	movl	%esi, %eax
	movq	72(%rsp), %rdx          ## 8-byte Reload
	jle	LBB2_26
	.align	4, 0x90
LBB2_31:                                ## %.lr.ph5.us.i
                                        ##   Parent Loop BB2_22 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB2_29 Depth 3
	movl	%edi, 128(%rsp)         ## 4-byte Spill
	movl	%r9d, (%rcx,%r12,4)
	movq	%r12, %rax
	imulq	120(%rsp), %rax         ## 8-byte Folded Reload
	movq	%rax, 144(%rsp)         ## 8-byte Spill
	movzwl	2(%rcx,%r12,4), %edx
	movl	%r9d, %edi
	movl	$1, %r8d
	xorl	%r9d, %r9d
	movq	%r13, %r14
	movq	%rbx, %r11
	.align	4, 0x90
LBB2_29:                                ##   Parent Loop BB2_22 Depth=1
                                        ##     Parent Loop BB2_31 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	144(%rsp), %rax         ## 8-byte Reload
	movl	%eax, %r10d
	addl	%r9d, %r10d
	cmpl	%r15d, %r10d
	movl	%r15d, %ebx
	cmovll	%ebp, %ebx
	subl	%ebx, %r10d
	movswl	(%r11,%r8,4), %r9d
	movslq	%r10d, %rbp
	movswl	264(%r14,%rbp,4), %eax
	movl	%r15d, %r13d
	movq	%rcx, %r15
	movl	%eax, %ecx
	imull	%r9d, %ecx
	movswl	2(%r11,%r8,4), %esi
	movswl	266(%r14,%rbp,4), %ebp
	movl	%ebp, %ebx
	imull	%esi, %ebx
	addl	$16384, %ecx            ## imm = 0x4000
	subl	%ebx, %ecx
	imull	%r9d, %ebp
	imull	%eax, %esi
	leal	16384(%rsi,%rbp), %eax
	shrl	$15, %ecx
	movzwl	%di, %edi
	addl	%ecx, %edi
	movq	%r15, %rcx
	movl	%r13d, %r15d
	movq	136(%rsp), %rsi         ## 8-byte Reload
	xorl	%ebp, %ebp
	shrl	$15, %eax
	addl	%eax, %edx
	movw	%di, (%rcx,%r12,4)
	movw	%dx, 2(%rcx,%r12,4)
	incq	%r8
	cmpl	%r8d, %esi
	movl	%r10d, %r9d
	jne	LBB2_29
## BB#30:                               ##   in Loop: Header=BB2_31 Depth=2
	movq	%r11, %rbx
	movq	%r14, %r13
	movl	128(%rsp), %edi         ## 4-byte Reload
	incl	%edi
	movq	112(%rsp), %r14         ## 8-byte Reload
	addq	%r14, %r12
	cmpl	%esi, %edi
	movq	96(%rsp), %r8           ## 8-byte Reload
	movl	104(%rsp), %r9d         ## 4-byte Reload
	jne	LBB2_31
	jmp	LBB2_27
	.align	4, 0x90
LBB2_26:                                ## %.preheader
                                        ##   Parent Loop BB2_22 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%r9d, (%rdx)
	addq	%r8, %rdx
	decl	%eax
	jne	LBB2_26
LBB2_27:                                ## %._crit_edge9.i
                                        ##   in Loop: Header=BB2_22 Depth=1
	movq	80(%rsp), %rax          ## 8-byte Reload
	incq	%rax
	addq	$4, 72(%rsp)            ## 8-byte Folded Spill
	cmpl	%r14d, %eax
	jne	LBB2_22
LBB2_28:                                ## %kf_bfly_generic.exit
	movq	%rbx, %rdi
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_free                   ## TAILCALL
LBB2_6:                                 ## %.loopexit
	leaq	LJTI2_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB2_7:
	movq	128(%rsp), %rax         ## 8-byte Reload
	addq	$2, %rax
	addq	$266, 88(%rsp)          ## 8-byte Folded Spill
                                        ## imm = 0x10A
	movq	120(%rsp), %r8          ## 8-byte Reload
	shlq	$2, %r8
	movl	%r14d, %r9d
	movq	%r14, %r10
	.align	4, 0x90
LBB2_8:                                 ## =>This Inner Loop Header: Depth=1
	movswl	-2(%rax), %ecx
	imull	$16383, %ecx, %ecx      ## imm = 0x3FFF
	addl	$16384, %ecx            ## imm = 0x4000
	shrl	$15, %ecx
	movw	%cx, -2(%rax)
	movswl	(%rax), %ecx
	imull	$16383, %ecx, %ecx      ## imm = 0x3FFF
	addl	$16384, %ecx            ## imm = 0x4000
	shrl	$15, %ecx
	movw	%cx, (%rax)
	movswl	-2(%rax,%r10,4), %ecx
	imull	$16383, %ecx, %ecx      ## imm = 0x3FFF
	addl	$16384, %ecx            ## imm = 0x4000
	shrl	$15, %ecx
	movw	%cx, -2(%rax,%r10,4)
	movswl	(%rax,%r10,4), %edx
	imull	$16383, %edx, %edx      ## imm = 0x3FFF
	addl	$16384, %edx            ## imm = 0x4000
	shrl	$15, %edx
	movw	%dx, (%rax,%r10,4)
	movswl	%cx, %ecx
	movq	88(%rsp), %r11          ## 8-byte Reload
	movswl	-2(%r11), %esi
	movl	%ecx, %edi
	imull	%esi, %edi
	movswl	%dx, %edx
	movswl	(%r11), %ebp
	movl	%edx, %ebx
	imull	%ebp, %ebx
	subl	%ebx, %edi
	imull	%ebp, %ecx
	imull	%esi, %edx
	addl	%ecx, %edx
	movzwl	-2(%rax), %ecx
	leal	32768(%rdi,%rdi), %esi
	sarl	$16, %esi
	subl	%esi, %ecx
	movw	%cx, -2(%rax,%r10,4)
	movzwl	(%rax), %ecx
	leal	32768(%rdx,%rdx), %edx
	sarl	$16, %edx
	subl	%edx, %ecx
	movw	%cx, (%rax,%r10,4)
	movzwl	-2(%rax), %ecx
	addl	%esi, %ecx
	movw	%cx, -2(%rax)
	movzwl	(%rax), %ecx
	addl	%edx, %ecx
	movw	%cx, (%rax)
	addq	$4, %rax
	addq	%r8, %r11
	movq	%r11, 88(%rsp)          ## 8-byte Spill
	decl	%r9d
	jne	LBB2_8
	jmp	LBB2_19
LBB2_9:
	movq	%r14, %rax
	movq	%r14, %r13
	movq	120(%rsp), %rcx         ## 8-byte Reload
	imulq	%rcx, %rax
	movq	88(%rsp), %r15          ## 8-byte Reload
	movswl	266(%r15,%rax,4), %r9d
	addl	%r9d, %r9d
	addq	$266, %r15              ## imm = 0x10A
	leaq	(,%rcx,8), %rax
	movq	%rax, 144(%rsp)         ## 8-byte Spill
	shlq	$2, %rcx
	movq	%r13, %r10
	negq	%r10
	movq	128(%rsp), %r8          ## 8-byte Reload
	movq	%rcx, %r12
	addq	$2, %r8
	movq	%r15, %r11
	.align	4, 0x90
LBB2_10:                                ## =>This Inner Loop Header: Depth=1
	movswl	-2(%r8), %eax
	imull	$10922, %eax, %eax      ## imm = 0x2AAA
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%r8)
	movswl	(%r8), %eax
	imull	$10922, %eax, %eax      ## imm = 0x2AAA
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r8)
	movswl	-2(%r8,%r13,4), %eax
	imull	$10922, %eax, %eax      ## imm = 0x2AAA
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%r8,%r13,4)
	movswl	(%r8,%r13,4), %eax
	imull	$10922, %eax, %eax      ## imm = 0x2AAA
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r8,%r13,4)
	movswl	-2(%r8,%r13,8), %eax
	imull	$10922, %eax, %eax      ## imm = 0x2AAA
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%r8,%r13,8)
	movswl	(%r8,%r13,8), %ecx
	imull	$10922, %ecx, %edi      ## imm = 0x2AAA
	addl	$16384, %edi            ## imm = 0x4000
	shrl	$15, %edi
	movw	%di, (%r8,%r13,8)
	movswl	-2(%r8,%r13,4), %ebx
	movswl	-2(%r15), %r14d
	movl	%r14d, %ecx
	imull	%ebx, %ecx
	movswl	(%r8,%r13,4), %ebp
	movswl	(%r15), %edx
	movl	%edx, %esi
	imull	%ebp, %esi
	subl	%esi, %ecx
	imull	%ebx, %edx
	imull	%r14d, %ebp
	addl	%edx, %ebp
	movswl	%ax, %r14d
	movswl	-2(%r11), %eax
	movl	%eax, %esi
	imull	%r14d, %esi
	movswl	%di, %edi
	movswl	(%r11), %edx
	movl	%edx, %ebx
	imull	%edi, %ebx
	subl	%ebx, %esi
	imull	%r14d, %edx
	imull	%edi, %eax
	addl	%edx, %eax
	leal	32768(%rcx,%rcx), %edi
	sarl	$16, %edi
	leal	32768(%rsi,%rsi), %edx
	sarl	$16, %edx
	leal	(%rdx,%rdi), %ebx
	leal	32768(%rbp,%rbp), %ebp
	sarl	$16, %ebp
	leal	32768(%rax,%rax), %eax
	sarl	$16, %eax
	leal	(%rax,%rbp), %ecx
	subl	%edx, %edi
	subl	%eax, %ebp
	movzwl	-2(%r8), %eax
	movl	%ebx, %edx
	shll	$16, %edx
	sarl	$17, %edx
	subl	%edx, %eax
	movw	%ax, -2(%r8,%r13,4)
	movzwl	(%r8), %eax
	movl	%ecx, %edx
	shll	$16, %edx
	sarl	$17, %edx
	subl	%edx, %eax
	movw	%ax, (%r8,%r13,4)
	movzwl	-2(%r8), %eax
	addl	%ebx, %eax
	movw	%ax, -2(%r8)
	movzwl	(%r8), %eax
	addl	%ecx, %eax
	movswl	%di, %ecx
	movswl	%bp, %edx
	movw	%ax, (%r8)
	movzwl	-2(%r8,%r13,4), %eax
	imull	%r9d, %edx
	addl	$32768, %edx            ## imm = 0x8000
	sarl	$16, %edx
	addl	%edx, %eax
	movw	%ax, -2(%r8,%r13,8)
	movzwl	(%r8,%r13,4), %eax
	imull	%r9d, %ecx
	addl	$32768, %ecx            ## imm = 0x8000
	sarl	$16, %ecx
	subl	%ecx, %eax
	movw	%ax, (%r8,%r13,8)
	movzwl	-2(%r8,%r13,4), %eax
	subl	%edx, %eax
	movw	%ax, -2(%r8,%r13,4)
	movzwl	(%r8,%r13,4), %eax
	addl	%ecx, %eax
	movw	%ax, (%r8,%r13,4)
	addq	144(%rsp), %r11         ## 8-byte Folded Reload
	addq	%r12, %r15
	addq	$4, %r8
	incq	%r10
	jne	LBB2_10
	jmp	LBB2_19
LBB2_11:
	movq	88(%rsp), %rax          ## 8-byte Reload
	cmpl	$0, 4(%rax)
	movq	120(%rsp), %rdx         ## 8-byte Reload
	movq	128(%rsp), %r11         ## 8-byte Reload
	je	LBB2_14
## BB#12:                               ## %.preheader26.preheader
	movq	88(%rsp), %r15          ## 8-byte Reload
	addq	$266, %r15              ## imm = 0x10A
	leaq	(,%rdx,4), %rax
	movq	%rax, 104(%rsp)         ## 8-byte Spill
	leaq	(%rax,%rax,2), %rax
	movq	%rax, 96(%rsp)          ## 8-byte Spill
	shlq	$3, %rdx
	movq	%rdx, 120(%rsp)         ## 8-byte Spill
	movq	%r14, %r12
	movq	%r12, 112(%rsp)         ## 8-byte Spill
	leaq	(%r12,%r12,2), %rax
	leaq	2(%r11,%rax,4), %rdx
	movq	%rdx, 80(%rsp)          ## 8-byte Spill
	leaq	2(%r11,%r12,8), %r9
	leaq	2(%r11,%r12,4), %r12
	xorl	%ebp, %ebp
	movq	%r15, %rcx
	movq	%r15, %r13
	movq	%r15, %rdi
	.align	4, 0x90
LBB2_13:                                ## %.preheader26
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rdi, 88(%rsp)          ## 8-byte Spill
	movq	%r13, 136(%rsp)         ## 8-byte Spill
	movq	%rcx, 144(%rsp)         ## 8-byte Spill
	movswl	(%r11,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r11,%rbp,4)
	movswl	2(%r11,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, 2(%r11,%rbp,4)
	movswl	-2(%r12,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%r12,%rbp,4)
	movswl	(%r12,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r12,%rbp,4)
	movq	%r9, %r15
	movswl	-2(%r15,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%r15,%rbp,4)
	movswl	(%r15,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r15,%rbp,4)
	movswl	-2(%rdx,%rbp,4), %eax
	imull	$8191, %eax, %r14d      ## imm = 0x1FFF
	addl	$16384, %r14d           ## imm = 0x4000
	shrl	$15, %r14d
	movw	%r14w, -2(%rdx,%rbp,4)
	movswl	(%rdx,%rbp,4), %eax
	imull	$8191, %eax, %esi       ## imm = 0x1FFF
	addl	$16384, %esi            ## imm = 0x4000
	shrl	$15, %esi
	movw	%si, (%rdx,%rbp,4)
	movswl	-2(%r12,%rbp,4), %eax
	movswl	-2(%rdi), %r8d
	movl	%r8d, %r10d
	imull	%eax, %r10d
	movswl	(%r12,%rbp,4), %ebx
	movswl	(%rdi), %edx
	movl	%edx, %edi
	imull	%ebx, %edi
	subl	%edi, %r10d
	imull	%eax, %edx
	imull	%r8d, %ebx
	addl	%edx, %ebx
	movswl	-2(%r15,%rbp,4), %r9d
	movswl	-2(%rcx), %r8d
	movl	%r8d, %edx
	imull	%r9d, %edx
	movswl	(%r15,%rbp,4), %edi
	movq	144(%rsp), %rax         ## 8-byte Reload
	movswl	(%rax), %ecx
	movl	%ecx, %eax
	imull	%edi, %eax
	subl	%eax, %edx
	imull	%r9d, %ecx
	imull	%r8d, %edi
	addl	%ecx, %edi
	movswl	%r14w, %r9d
	movswl	-2(%r13), %r8d
	movl	%r8d, %eax
	imull	%r9d, %eax
	movswl	%si, %r14d
	movswl	(%r13), %esi
	movl	%esi, %ecx
	imull	%r14d, %ecx
	subl	%ecx, %eax
	imull	%r9d, %esi
	imull	%r14d, %r8d
	addl	%esi, %r8d
	movswl	(%r11,%rbp,4), %ecx
	leal	32768(%rdx,%rdx), %r9d
	sarl	$16, %r9d
	movl	%ecx, %r13d
	subl	%r9d, %r13d
	leal	32768(%rdi,%rdi), %edi
	sarl	$16, %edi
	addl	%ecx, %r9d
	movzwl	2(%r11,%rbp,4), %ecx
	movw	%r9w, (%r11,%rbp,4)
	leal	(%rdi,%rcx), %r14d
	movw	%r14w, 2(%r11,%rbp,4)
	leal	32768(%r10,%r10), %edx
	sarl	$16, %edx
	leal	32768(%rax,%rax), %r10d
	sarl	$16, %r10d
	leal	32768(%rbx,%rbx), %eax
	sarl	$16, %eax
	leal	32768(%r8,%r8), %ebx
	sarl	$16, %ebx
	leal	(%rbx,%rax), %r8d
	subl	%ebx, %eax
	leal	(%r10,%rdx), %ebx
	movswl	%bx, %ebx
	subl	%ebx, %r9d
	movw	%r9w, -2(%r15,%rbp,4)
	movswl	%r8w, %r8d
	subl	%r8d, %r14d
	movw	%r14w, (%r15,%rbp,4)
	movq	%r15, %r9
	movzwl	(%r11,%rbp,4), %esi
	addl	%ebx, %esi
	movw	%si, (%r11,%rbp,4)
	movzwl	2(%r11,%rbp,4), %esi
	addl	%r8d, %esi
	movw	%si, 2(%r11,%rbp,4)
	subl	%r10d, %edx
	movswl	%r13w, %esi
	movq	136(%rsp), %r13         ## 8-byte Reload
	movq	120(%rsp), %rbx         ## 8-byte Reload
	cwtl
	subl	%edi, %ecx
	movl	%esi, %edi
	subl	%eax, %edi
	movw	%di, -2(%r12,%rbp,4)
	movswl	%cx, %ecx
	movswl	%dx, %edx
	leal	(%rdx,%rcx), %edi
	movw	%di, (%r12,%rbp,4)
	addl	%esi, %eax
	movq	80(%rsp), %rsi          ## 8-byte Reload
	movw	%ax, -2(%rsi,%rbp,4)
	subl	%edx, %ecx
	movw	%cx, (%rsi,%rbp,4)
	movq	%rsi, %rdx
	movq	144(%rsp), %rcx         ## 8-byte Reload
	addq	96(%rsp), %r13          ## 8-byte Folded Reload
	addq	%rbx, %rcx
	incq	%rbp
	movq	88(%rsp), %rax          ## 8-byte Reload
	addq	104(%rsp), %rax         ## 8-byte Folded Reload
	movq	%rax, %rdi
	cmpq	%rbp, 112(%rsp)         ## 8-byte Folded Reload
	jne	LBB2_13
	jmp	LBB2_19
LBB2_16:
	testl	%r14d, %r14d
	movq	120(%rsp), %rax         ## 8-byte Reload
	movq	%r14, %r9
	movq	128(%rsp), %r12         ## 8-byte Reload
	jle	LBB2_19
## BB#17:                               ## %.lr.ph.i14
	movq	%rax, %rdi
                                        ## kill: RAX<def> RDI<kill>
	imulq	%r9, %rax
	movq	%r12, %rdx
	leaq	(%rax,%rax), %rcx
	movq	88(%rsp), %r15          ## 8-byte Reload
	movswl	264(%r15,%rax,4), %esi
	movl	%esi, 144(%rsp)         ## 4-byte Spill
	movswl	264(%r15,%rcx,4), %esi
	movl	%esi, 136(%rsp)         ## 4-byte Spill
	movswl	266(%r15,%rax,4), %eax
	movl	%eax, 104(%rsp)         ## 4-byte Spill
	movswl	266(%r15,%rcx,4), %eax
	movl	%eax, 96(%rsp)          ## 4-byte Spill
	leaq	266(%r15), %rcx
	leaq	(,%rdi,4), %rax
	movq	%rdi, %r15
	movq	%rax, 24(%rsp)          ## 8-byte Spill
	leaq	2(%rdx), %rax
	movq	%rax, 80(%rsp)          ## 8-byte Spill
	leaq	2(%rdx,%r9,4), %rax
	movq	%rax, 72(%rsp)          ## 8-byte Spill
	leal	(%r9,%r9), %eax
	cltq
	leaq	2(%rdx,%rax,4), %r8
	movq	%r8, 16(%rsp)           ## 8-byte Spill
	leal	(%r9,%r9,2), %eax
	cltq
	leaq	2(%rdx,%rax,4), %rsi
	movq	%rsi, 8(%rsp)           ## 8-byte Spill
	leal	(,%r9,4), %eax
	cltq
	leaq	2(%rdx,%rax,4), %rax
	movq	%rax, 128(%rsp)         ## 8-byte Spill
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	.align	4, 0x90
LBB2_18:                                ## =>This Inner Loop Header: Depth=1
	movq	%r13, 48(%rsp)          ## 8-byte Spill
	movq	%rcx, 64(%rsp)          ## 8-byte Spill
	movq	%r9, 112(%rsp)          ## 8-byte Spill
	movq	80(%rsp), %rdx          ## 8-byte Reload
	movswl	-2(%rdx,%r14), %eax
	imull	$6553, %eax, %eax       ## imm = 0x1999
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%rdx,%r14)
	movswl	(%rdx,%r14), %eax
	imull	$6553, %eax, %eax       ## imm = 0x1999
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%rdx,%r14)
	movq	72(%rsp), %r9           ## 8-byte Reload
	movswl	-2(%r9,%r14), %eax
	imull	$6553, %eax, %eax       ## imm = 0x1999
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%r9,%r14)
	movswl	(%r9,%r14), %eax
	imull	$6553, %eax, %eax       ## imm = 0x1999
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r9,%r14)
	movq	%r8, %rdi
	movswl	-2(%rdi,%r14), %eax
	imull	$6553, %eax, %eax       ## imm = 0x1999
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%rdi,%r14)
	movswl	(%rdi,%r14), %eax
	imull	$6553, %eax, %eax       ## imm = 0x1999
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%rdi,%r14)
                                        ## kill: R8<def> RDI<kill>
	movswl	-2(%rsi,%r14), %eax
	imull	$6553, %eax, %eax       ## imm = 0x1999
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%rsi,%r14)
	movswl	(%rsi,%r14), %eax
	imull	$6553, %eax, %eax       ## imm = 0x1999
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%rsi,%r14)
	movq	128(%rsp), %rdx         ## 8-byte Reload
	movswl	-2(%rdx,%r14), %eax
	imull	$6553, %eax, %r12d      ## imm = 0x1999
	addl	$16384, %r12d           ## imm = 0x4000
	shrl	$15, %r12d
	movw	%r12w, -2(%rdx,%r14)
	movswl	(%rdx,%r14), %eax
	imull	$6553, %eax, %r10d      ## imm = 0x1999
	addl	$16384, %r10d           ## imm = 0x4000
	shrl	$15, %r10d
	movw	%r10w, (%rdx,%r14)
	movq	%r9, %rax
	movswl	-2(%rax,%r14), %edx
	movswl	-2(%rcx), %edi
	movl	%edi, %r9d
	imull	%edx, %r9d
	movswl	(%rax,%r14), %r11d
	movswl	(%rcx), %eax
	movl	%eax, %ebp
	imull	%r11d, %ebp
	subl	%ebp, %r9d
	imull	%edx, %eax
	imull	%edi, %r11d
	addl	%eax, %r11d
	movq	%r8, %rcx
	movswl	-2(%rcx,%r14), %eax
	movslq	%ebx, %rbx
	movq	%rbx, 56(%rsp)          ## 8-byte Spill
	movq	%rbx, %rdi
	imulq	%r15, %rdi
	movq	88(%rsp), %rbx          ## 8-byte Reload
	movswl	264(%rbx,%rdi,4), %ebp
	movl	%ebp, %r8d
	imull	%eax, %r8d
	movswl	(%rcx,%r14), %r15d
	movswl	266(%rbx,%rdi,4), %edx
	movl	%edx, %edi
	imull	%r15d, %edi
	subl	%edi, %r8d
	imull	%eax, %edx
	imull	%ebp, %r15d
	addl	%edx, %r15d
	movswl	-2(%rsi,%r14), %eax
	movq	%r13, %rdx
	sarq	$32, %rdx
	movq	120(%rsp), %r13         ## 8-byte Reload
	imulq	%r13, %rdx
	movswl	264(%rbx,%rdx,4), %ecx
	movl	%ecx, %edi
	imull	%eax, %edi
	movswl	(%rsi,%r14), %ebp
	movswl	266(%rbx,%rdx,4), %esi
	movl	%esi, %edx
	imull	%ebp, %edx
	subl	%edx, %edi
	imull	%eax, %esi
	imull	%ecx, %ebp
	addl	%esi, %ebp
	movswl	%r12w, %r12d
	movslq	%r14d, %rcx
	imulq	%r13, %rcx
	movswl	264(%rbx,%rcx,4), %esi
	movl	%esi, %edx
	imull	%r12d, %edx
	movswl	%r10w, %r10d
	movswl	266(%rbx,%rcx,4), %eax
	movl	%eax, %ecx
	imull	%r10d, %ecx
	subl	%ecx, %edx
	imull	%r12d, %eax
	imull	%r10d, %esi
	addl	%eax, %esi
	leal	32768(%r9,%r9), %r12d
	sarl	$16, %r12d
	leal	32768(%rdx,%rdx), %ecx
	sarl	$16, %ecx
	leal	(%rcx,%r12), %r10d
	leal	32768(%r11,%r11), %eax
	sarl	$16, %eax
	leal	32768(%rsi,%rsi), %edx
	sarl	$16, %edx
	leal	(%rdx,%rax), %ebx
	subl	%ecx, %r12d
	subl	%edx, %eax
	leal	32768(%r8,%r8), %ecx
	sarl	$16, %ecx
	leal	32768(%rdi,%rdi), %edx
	sarl	$16, %edx
	leal	(%rdx,%rcx), %esi
	leal	32768(%r15,%r15), %edi
	sarl	$16, %edi
	leal	32768(%rbp,%rbp), %ebp
	sarl	$16, %ebp
	leal	(%rbp,%rdi), %r13d
	subl	%edx, %ecx
	subl	%ebp, %edi
	movswl	%r10w, %r15d
	movswl	%si, %r11d
	movq	80(%rsp), %rsi          ## 8-byte Reload
	movswl	-2(%rsi,%r14), %ebp
	movq	%rbp, 32(%rsp)          ## 8-byte Spill
	leal	(%r11,%rbp), %edx
	movq	%rbp, %r9
	addl	%r15d, %edx
	movswl	(%rsi,%r14), %r8d
	movl	%r8d, 40(%rsp)          ## 4-byte Spill
	movw	%dx, -2(%rsi,%r14)
	movswl	%bx, %ebp
	movl	%ebp, 44(%rsp)          ## 4-byte Spill
	movswl	%r13w, %r10d
	movzwl	(%rsi,%r14), %edx
	addl	%r10d, %edx
	addl	%ebp, %edx
	movl	%ebp, %r13d
	movw	%dx, (%rsi,%r14)
	movl	%r15d, %edx
	movl	144(%rsp), %esi         ## 4-byte Reload
	imull	%esi, %edx
	movl	%esi, %ebx
	addl	$16384, %edx            ## imm = 0x4000
	shrl	$15, %edx
	movl	%r11d, %ebp
	movl	136(%rsp), %esi         ## 4-byte Reload
	imull	%esi, %ebp
	addl	$16384, %ebp            ## imm = 0x4000
	shrl	$15, %ebp
	addl	%r9d, %ebp
	addl	%edx, %ebp
	movl	%r13d, %edx
	imull	%ebx, %edx
	addl	$16384, %edx            ## imm = 0x4000
	shrl	$15, %edx
	movl	%r10d, %r9d
	imull	%esi, %r9d
	addl	$16384, %r9d            ## imm = 0x4000
	shrl	$15, %r9d
	addl	%r8d, %r9d
	addl	%edx, %r9d
	movswl	%ax, %r13d
	movl	%r13d, %eax
	movl	104(%rsp), %edx         ## 4-byte Reload
	imull	%edx, %eax
	movl	%edx, %ebx
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movswl	%di, %esi
	movl	%esi, %edi
	movl	96(%rsp), %edx          ## 4-byte Reload
	imull	%edx, %edi
	addl	$16384, %edi            ## imm = 0x4000
	shrl	$15, %edi
	addl	%eax, %edi
	movswl	%r12w, %r12d
	movl	%r12d, %eax
	imull	%ebx, %eax
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movswl	%cx, %r8d
	movl	%r8d, %ecx
	imull	%edx, %ecx
	addl	$16384, %ecx            ## imm = 0x4000
	shrl	$15, %ecx
	addl	%eax, %ecx
	negl	%ecx
	movswl	%bp, %eax
	movswl	%di, %edi
	movl	%eax, %ebp
	subl	%edi, %ebp
	movq	72(%rsp), %rdx          ## 8-byte Reload
	movw	%bp, -2(%rdx,%r14)
	movswl	%r9w, %ebx
	movswl	%cx, %ecx
	movl	%ebx, %ebp
	subl	%ecx, %ebp
	movw	%bp, (%rdx,%r14)
	movq	112(%rsp), %r9          ## 8-byte Reload
	addl	%edi, %eax
	movq	128(%rsp), %rdi         ## 8-byte Reload
	movw	%ax, -2(%rdi,%r14)
	addl	%ecx, %ebx
	movw	%bx, (%rdi,%r14)
	movl	144(%rsp), %eax         ## 4-byte Reload
	imull	%eax, %r11d
	addl	$16384, %r11d           ## imm = 0x4000
	shrl	$15, %r11d
	movq	32(%rsp), %rcx          ## 8-byte Reload
	addl	%ecx, %r11d
	movl	136(%rsp), %ecx         ## 4-byte Reload
	imull	%ecx, %r15d
	addl	$16384, %r15d           ## imm = 0x4000
	shrl	$15, %r15d
	addl	%r15d, %r11d
	imull	%eax, %r10d
	addl	$16384, %r10d           ## imm = 0x4000
	shrl	$15, %r10d
	addl	40(%rsp), %r10d         ## 4-byte Folded Reload
	movl	44(%rsp), %eax          ## 4-byte Reload
	imull	%ecx, %eax
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	addl	%eax, %r10d
	movl	96(%rsp), %ecx          ## 4-byte Reload
	imull	%ecx, %r13d
	addl	$16384, %r13d           ## imm = 0x4000
	shrl	$15, %r13d
	movl	104(%rsp), %eax         ## 4-byte Reload
	imull	%eax, %esi
	addl	$16384, %esi            ## imm = 0x4000
	shrl	$15, %esi
	subl	%r13d, %esi
	movq	120(%rsp), %r15         ## 8-byte Reload
	imull	%ecx, %r12d
	addl	$16384, %r12d           ## imm = 0x4000
	shrl	$15, %r12d
	imull	%eax, %r8d
	addl	$16384, %r8d            ## imm = 0x4000
	shrl	$15, %r8d
	subl	%r8d, %r12d
	movswl	%r11w, %eax
	movq	56(%rsp), %rbx          ## 8-byte Reload
	movswl	%si, %ecx
	leal	(%rax,%rcx), %edx
	movq	16(%rsp), %rbp          ## 8-byte Reload
	movw	%dx, -2(%rbp,%r14)
	movswl	%r10w, %edx
	movswl	%r12w, %esi
	leal	(%rdx,%rsi), %edi
	movw	%di, (%rbp,%r14)
	movq	%rbp, %r8
	subl	%ecx, %eax
	movq	64(%rsp), %rcx          ## 8-byte Reload
	movq	8(%rsp), %rdi           ## 8-byte Reload
	movw	%ax, -2(%rdi,%r14)
	subl	%esi, %edx
	movw	%dx, (%rdi,%r14)
	movq	%rdi, %rsi
	movabsq	$12884901888, %rax      ## imm = 0x300000000
	movq	48(%rsp), %rdx          ## 8-byte Reload
	addq	%rax, %rdx
	movq	%rdx, %r13
	addq	$4, %r14
	addl	$2, %ebx
	addq	24(%rsp), %rcx          ## 8-byte Folded Reload
	decl	%r9d
	jne	LBB2_18
	jmp	LBB2_19
LBB2_14:                                ## %.preheader24.preheader
	movq	88(%rsp), %r15          ## 8-byte Reload
	addq	$266, %r15              ## imm = 0x10A
	leaq	(,%rdx,4), %rax
	movq	%rax, 104(%rsp)         ## 8-byte Spill
	leaq	(%rax,%rax,2), %rax
	movq	%rax, 96(%rsp)          ## 8-byte Spill
	shlq	$3, %rdx
	movq	%rdx, 120(%rsp)         ## 8-byte Spill
	movq	%r14, %r12
	movq	%r12, 112(%rsp)         ## 8-byte Spill
	leaq	(%r12,%r12,2), %rax
	leaq	2(%r11,%rax,4), %rdx
	movq	%rdx, 80(%rsp)          ## 8-byte Spill
	leaq	2(%r11,%r12,8), %r9
	leaq	2(%r11,%r12,4), %r12
	xorl	%ebp, %ebp
	movq	%r15, %rcx
	movq	%r15, %r13
	movq	%r15, %rdi
	.align	4, 0x90
LBB2_15:                                ## %.preheader24
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rdi, 88(%rsp)          ## 8-byte Spill
	movq	%r13, 136(%rsp)         ## 8-byte Spill
	movq	%rcx, 144(%rsp)         ## 8-byte Spill
	movswl	(%r11,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r11,%rbp,4)
	movswl	2(%r11,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, 2(%r11,%rbp,4)
	movswl	-2(%r12,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%r12,%rbp,4)
	movswl	(%r12,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r12,%rbp,4)
	movq	%r9, %r15
	movswl	-2(%r15,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, -2(%r15,%rbp,4)
	movswl	(%r15,%rbp,4), %eax
	imull	$8191, %eax, %eax       ## imm = 0x1FFF
	addl	$16384, %eax            ## imm = 0x4000
	shrl	$15, %eax
	movw	%ax, (%r15,%rbp,4)
	movswl	-2(%rdx,%rbp,4), %eax
	imull	$8191, %eax, %r14d      ## imm = 0x1FFF
	addl	$16384, %r14d           ## imm = 0x4000
	shrl	$15, %r14d
	movw	%r14w, -2(%rdx,%rbp,4)
	movswl	(%rdx,%rbp,4), %eax
	imull	$8191, %eax, %esi       ## imm = 0x1FFF
	addl	$16384, %esi            ## imm = 0x4000
	shrl	$15, %esi
	movw	%si, (%rdx,%rbp,4)
	movswl	-2(%r12,%rbp,4), %eax
	movswl	-2(%rdi), %r8d
	movl	%r8d, %r10d
	imull	%eax, %r10d
	movswl	(%r12,%rbp,4), %ebx
	movswl	(%rdi), %edx
	movl	%edx, %edi
	imull	%ebx, %edi
	subl	%edi, %r10d
	imull	%eax, %edx
	imull	%r8d, %ebx
	addl	%edx, %ebx
	movswl	-2(%r15,%rbp,4), %r9d
	movswl	-2(%rcx), %r8d
	movl	%r8d, %edx
	imull	%r9d, %edx
	movswl	(%r15,%rbp,4), %edi
	movq	144(%rsp), %rax         ## 8-byte Reload
	movswl	(%rax), %ecx
	movl	%ecx, %eax
	imull	%edi, %eax
	subl	%eax, %edx
	imull	%r9d, %ecx
	imull	%r8d, %edi
	addl	%ecx, %edi
	movswl	%r14w, %r9d
	movswl	-2(%r13), %r8d
	movl	%r8d, %eax
	imull	%r9d, %eax
	movswl	%si, %r14d
	movswl	(%r13), %esi
	movl	%esi, %ecx
	imull	%r14d, %ecx
	subl	%ecx, %eax
	imull	%r9d, %esi
	imull	%r14d, %r8d
	addl	%esi, %r8d
	movswl	(%r11,%rbp,4), %r14d
	leal	32768(%rdx,%rdx), %r9d
	sarl	$16, %r9d
	movl	%r14d, %r13d
	subl	%r9d, %r13d
	leal	32768(%rdi,%rdi), %ecx
	sarl	$16, %ecx
	addl	%r14d, %r9d
	movzwl	2(%r11,%rbp,4), %edi
	movw	%r9w, (%r11,%rbp,4)
	leal	(%rcx,%rdi), %r14d
	movw	%r14w, 2(%r11,%rbp,4)
	leal	32768(%r10,%r10), %edx
	sarl	$16, %edx
	leal	32768(%rax,%rax), %r10d
	sarl	$16, %r10d
	leal	32768(%rbx,%rbx), %eax
	sarl	$16, %eax
	leal	32768(%r8,%r8), %ebx
	sarl	$16, %ebx
	leal	(%rbx,%rax), %r8d
	subl	%ebx, %eax
	leal	(%r10,%rdx), %ebx
	movswl	%bx, %ebx
	subl	%ebx, %r9d
	movw	%r9w, -2(%r15,%rbp,4)
	movswl	%r8w, %r8d
	subl	%r8d, %r14d
	movw	%r14w, (%r15,%rbp,4)
	movq	%r15, %r9
	movzwl	(%r11,%rbp,4), %esi
	addl	%ebx, %esi
	movw	%si, (%r11,%rbp,4)
	movzwl	2(%r11,%rbp,4), %esi
	addl	%r8d, %esi
	movw	%si, 2(%r11,%rbp,4)
	subl	%r10d, %edx
	movswl	%r13w, %esi
	movq	136(%rsp), %r13         ## 8-byte Reload
	movq	120(%rsp), %rbx         ## 8-byte Reload
	cwtl
	subl	%ecx, %edi
	leal	(%rax,%rsi), %ecx
	movw	%cx, -2(%r12,%rbp,4)
	movswl	%di, %ecx
	movswl	%dx, %edx
	movl	%ecx, %edi
	subl	%edx, %edi
	movw	%di, (%r12,%rbp,4)
	subl	%eax, %esi
	movq	80(%rsp), %rax          ## 8-byte Reload
	movw	%si, -2(%rax,%rbp,4)
	addl	%edx, %ecx
	movw	%cx, (%rax,%rbp,4)
	movq	144(%rsp), %rcx         ## 8-byte Reload
	movq	%rax, %rdx
	addq	96(%rsp), %r13          ## 8-byte Folded Reload
	addq	%rbx, %rcx
	incq	%rbp
	movq	88(%rsp), %rax          ## 8-byte Reload
	addq	104(%rsp), %rax         ## 8-byte Folded Reload
	movq	%rax, %rdi
	cmpq	%rbp, 112(%rsp)         ## 8-byte Folded Reload
	jne	LBB2_15
LBB2_19:                                ## %kf_bfly2.exit
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
	.align	2, 0x90
L2_0_set_7 = LBB2_7-LJTI2_0
L2_0_set_9 = LBB2_9-LJTI2_0
L2_0_set_11 = LBB2_11-LJTI2_0
L2_0_set_16 = LBB2_16-LJTI2_0
LJTI2_0:
	.long	L2_0_set_7
	.long	L2_0_set_9
	.long	L2_0_set_11
	.long	L2_0_set_16

	.globl	_kiss_fft
	.align	4, 0x90
_kiss_fft:                              ## @kiss_fft
	.cfi_startproc
## BB#0:
	pushq	%r15
Ltmp55:
	.cfi_def_cfa_offset 16
	pushq	%r14
Ltmp56:
	.cfi_def_cfa_offset 24
	pushq	%rbx
Ltmp57:
	.cfi_def_cfa_offset 32
Ltmp58:
	.cfi_offset %rbx, -32
Ltmp59:
	.cfi_offset %r14, -24
Ltmp60:
	.cfi_offset %r15, -16
	movq	%rdx, %rax
	movq	%rsi, %r14
	movq	%rdi, %rbx
	cmpq	%rax, %r14
	je	LBB3_1
## BB#2:
	leaq	8(%rbx), %r8
	movl	$1, %edx
	movl	$1, %ecx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%rbx, %r9
	popq	%rbx
	popq	%r14
	popq	%r15
	jmp	_kf_work                ## TAILCALL
LBB3_1:
	movslq	(%rbx), %rdi
	shlq	$2, %rdi
	callq	_malloc
	movq	%rax, %r15
	leaq	8(%rbx), %r8
	movl	$1, %edx
	movl	$1, %ecx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %r9
	callq	_kf_work
	movslq	(%rbx), %rdx
	shlq	$2, %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_memcpy
	movq	%r15, %rdi
	popq	%rbx
	popq	%r14
	popq	%r15
	jmp	_free                   ## TAILCALL
	.cfi_endproc

	.globl	_kiss_fft_cleanup
	.align	4, 0x90
_kiss_fft_cleanup:                      ## @kiss_fft_cleanup
	.cfi_startproc
## BB#0:
	retq
	.cfi_endproc

	.globl	_kiss_fft_next_fast_size
	.align	4, 0x90
_kiss_fft_next_fast_size:               ## @kiss_fft_next_fast_size
	.cfi_startproc
## BB#0:
	.align	4, 0x90
LBB5_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB5_2 Depth 2
                                        ##     Child Loop BB5_4 Depth 2
                                        ##     Child Loop BB5_7 Depth 2
	movl	%edi, %eax
	testb	$1, %al
	movl	%eax, %ecx
	jne	LBB5_4
	.align	4, 0x90
LBB5_2:                                 ## %.lr.ph
                                        ##   Parent Loop BB5_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%ecx, %edx
	shrl	$31, %edx
	addl	%ecx, %edx
	sarl	%edx
	testb	$1, %dl
	movl	%edx, %ecx
	je	LBB5_2
	jmp	LBB5_4
	.align	4, 0x90
LBB5_3:                                 ## %.lr.ph4
                                        ##   in Loop: Header=BB5_4 Depth=2
	movslq	%ecx, %rcx
	imulq	$1431655766, %rcx, %rcx ## imm = 0x55555556
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
LBB5_4:                                 ## %.lr.ph4
                                        ##   Parent Loop BB5_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	%ecx, %rdx
	imulq	$1431655766, %rdx, %rsi ## imm = 0x55555556
	movq	%rsi, %rdi
	shrq	$63, %rdi
	shrq	$32, %rsi
	addl	%edi, %esi
	leal	(%rsi,%rsi,2), %esi
	cmpl	%esi, %edx
	je	LBB5_3
## BB#5:                                ## %.loopexit2
                                        ##   in Loop: Header=BB5_1 Depth=1
	movslq	%ecx, %rdx
	imulq	$1717986919, %rdx, %rsi ## imm = 0x66666667
	movq	%rsi, %rdi
	shrq	$63, %rdi
	sarq	$33, %rsi
	addl	%edi, %esi
	leal	(%rsi,%rsi,4), %esi
	jmp	LBB5_7
	.align	4, 0x90
LBB5_6:                                 ## %.lr.ph7
                                        ##   in Loop: Header=BB5_7 Depth=2
	movslq	%ecx, %rcx
	imulq	$1717986919, %rcx, %rcx ## imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$33, %rcx
	addl	%edx, %ecx
	movslq	%ecx, %rdx
	imulq	$1717986919, %rdx, %rsi ## imm = 0x66666667
	sarq	$33, %rsi
	movl	%esi, %edi
	shrl	$31, %edi
	addl	%esi, %edi
	leal	(%rdi,%rdi,4), %esi
LBB5_7:                                 ## %.lr.ph7
                                        ##   Parent Loop BB5_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	%esi, %edx
	je	LBB5_6
## BB#8:                                ## %._crit_edge
                                        ##   in Loop: Header=BB5_1 Depth=1
	leal	1(%rax), %edi
	cmpl	$1, %ecx
	jg	LBB5_1
## BB#9:
                                        ## kill: EAX<def> EAX<kill> RAX<kill>
	retq
	.cfi_endproc


.subsections_via_symbols
