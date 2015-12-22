	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_0:
	.quad	-4604611780675359464    ## double -6.2831853071795862
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
	subq	$16, %rsp
Ltmp11:
	.cfi_def_cfa_offset 64
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
	leaq	272(,%rax,8), %rdi
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
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
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
	divsd	8(%rsp), %xmm0          ## 8-byte Folded Reload
	testl	%r12d, %r12d
	je	LBB0_11
## BB#10:                               ##   in Loop: Header=BB0_9 Depth=1
	xorpd	LCPI0_1(%rip), %xmm0
LBB0_11:                                ##   in Loop: Header=BB0_9 Depth=1
	callq	___sincos_stret
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, 264(%r14,%rbp,8)
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 268(%r14,%rbp,8)
	cmpl	%ebp, %r15d
	jne	LBB0_12
LBB0_13:                                ## %._crit_edge
	leaq	8(%r14), %rbp
	sqrtsd	8(%rsp), %xmm0          ## 8-byte Folded Reload
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
	addq	$16, %rsp
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
	shlq	$3, %rdi
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
	shlq	$3, %rdx
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

	.section	__TEXT,__const
	.align	4
LCPI2_0:
	.long	2147483648              ## float -0.000000e+00
	.long	2147483648              ## float -0.000000e+00
	.long	2147483648              ## float -0.000000e+00
	.long	2147483648              ## float -0.000000e+00
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI2_1:
	.quad	4602678819172646912     ## double 0.5
	.section	__TEXT,__text,regular,pure_instructions
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
	subq	$72, %rsp
Ltmp44:
	.cfi_def_cfa_offset 128
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
	movq	%r9, 64(%rsp)           ## 8-byte Spill
	movq	%r8, 32(%rsp)           ## 8-byte Spill
	movl	%ecx, 40(%rsp)          ## 4-byte Spill
	movq	%rsi, %r13
	movq	%rdi, %rbx
	movl	(%r8), %r12d
	movslq	%r12d, %rax
	movslq	4(%r8), %rsi
	cmpq	$1, %rsi
	jne	LBB2_1
## BB#3:                                ## %.preheader19
	movq	%rax, 8(%rsp)           ## 8-byte Spill
	movslq	40(%rsp), %rax          ## 4-byte Folded Reload
	imulq	%rdx, %rax
	movq	%rdx, 48(%rsp)          ## 8-byte Spill
	shlq	$3, %rax
	movl	%esi, %ecx
	movq	%rsi, 56(%rsp)          ## 8-byte Spill
	imull	%r12d, %ecx
	movslq	%ecx, %rcx
	shlq	$3, %rcx
	movq	%rbx, %rdx
	.align	4, 0x90
LBB2_4:                                 ## =>This Inner Loop Header: Depth=1
	movq	(%r13), %rsi
	movq	%rsi, (%rdx)
	addq	$8, %rdx
	addq	%rax, %r13
	addq	$-8, %rcx
	jne	LBB2_4
	jmp	LBB2_5
LBB2_1:                                 ## %.preheader20
	addq	$8, 32(%rsp)            ## 8-byte Folded Spill
	movq	%rax, %rcx
	movq	%rax, 8(%rsp)           ## 8-byte Spill
	imulq	%rdx, %rcx
	movq	%rcx, 24(%rsp)          ## 8-byte Spill
	movslq	40(%rsp), %r15          ## 4-byte Folded Reload
	imulq	%rdx, %r15
	movq	%rdx, 48(%rsp)          ## 8-byte Spill
	shlq	$3, %r15
	movl	%esi, %eax
	imull	%r12d, %eax
	movslq	%eax, %r14
	shlq	$3, %r14
	leaq	(,%rsi,8), %rax
	movq	%rax, 16(%rsp)          ## 8-byte Spill
	movq	%rsi, 56(%rsp)          ## 8-byte Spill
	xorl	%ebp, %ebp
	.align	4, 0x90
LBB2_2:                                 ## =>This Inner Loop Header: Depth=1
	leaq	(%rbx,%rbp), %rdi
	movq	%r13, %rsi
	movq	24(%rsp), %rdx          ## 8-byte Reload
	movl	40(%rsp), %ecx          ## 4-byte Reload
	movq	32(%rsp), %r8           ## 8-byte Reload
	movq	64(%rsp), %r9           ## 8-byte Reload
	callq	_kf_work
	addq	%r15, %r13
	addq	16(%rsp), %rbp          ## 8-byte Folded Reload
	cmpq	%rbp, %r14
	jne	LBB2_2
LBB2_5:                                 ## %.loopexit
	leal	-2(%r12), %eax
	cmpl	$3, %eax
	jbe	LBB2_6
## BB#20:
	movq	64(%rsp), %rax          ## 8-byte Reload
	movl	(%rax), %r15d
	movq	8(%rsp), %rdi           ## 8-byte Reload
	shlq	$3, %rdi
	callq	_malloc
	movq	56(%rsp), %rcx          ## 8-byte Reload
	testl	%ecx, %ecx
	jle	LBB2_31
## BB#21:                               ## %.preheader.lr.ph.i
	movq	56(%rsp), %rcx          ## 8-byte Reload
	leaq	(,%rcx,8), %rbp
	movq	%rbp, 40(%rsp)          ## 8-byte Spill
	xorl	%r13d, %r13d
	movq	%rbx, 32(%rsp)          ## 8-byte Spill
	xorl	%r11d, %r11d
	movq	64(%rsp), %r9           ## 8-byte Reload
	.align	4, 0x90
LBB2_22:                                ## %.preheader.i
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_23 Depth 2
                                        ##     Child Loop BB2_29 Depth 2
                                        ##     Child Loop BB2_28 Depth 2
                                        ##       Child Loop BB2_26 Depth 3
	testl	%r12d, %r12d
	movq	%rbx, %rcx
	movl	$0, %edx
	jle	LBB2_30
	.align	4, 0x90
LBB2_23:                                ## %.lr.ph.i
                                        ##   Parent Loop BB2_22 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	(%rcx,%r11,8), %rsi
	movq	%rsi, (%rax,%rdx,8)
	incq	%rdx
	addq	%rbp, %rcx
	cmpl	%edx, %r12d
	jne	LBB2_23
## BB#24:                               ## %.lr.ph8.i
                                        ##   in Loop: Header=BB2_22 Depth=1
	movq	(%rax), %r10
	cmpl	$2, %r12d
	movl	%r12d, %ecx
	movq	32(%rsp), %rdx          ## 8-byte Reload
	jl	LBB2_29
## BB#25:                               ## %.lr.ph5.us.i.preheader
                                        ##   in Loop: Header=BB2_22 Depth=1
	movd	%r10d, %xmm0
	xorl	%r14d, %r14d
	movq	%r11, %rdi
	.align	4, 0x90
LBB2_28:                                ## %.lr.ph5.us.i
                                        ##   Parent Loop BB2_22 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB2_26 Depth 3
	movq	%r10, (%rbx,%rdi,8)
	movq	%rdi, %rcx
	imulq	48(%rsp), %rcx          ## 8-byte Folded Reload
	movss	4(%rbx,%rdi,8), %xmm1
	movaps	%xmm0, %xmm2
	movl	$1, %esi
	xorl	%r8d, %r8d
	.align	4, 0x90
LBB2_26:                                ##   Parent Loop BB2_22 Depth=1
                                        ##     Parent Loop BB2_28 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	%ecx, %edx
	addl	%r8d, %edx
	cmpl	%r15d, %edx
	movl	%r15d, %ebp
	cmovll	%r13d, %ebp
	subl	%ebp, %edx
	movslq	%edx, %rbp
	movq	(%rax,%rsi,8), %xmm3
	movq	264(%r9,%rbp,8), %xmm4
	movaps	%xmm3, %xmm5
	mulps	%xmm4, %xmm5
	pshufd	$1, %xmm5, %xmm6        ## xmm6 = xmm5[1,0,0,0]
	subss	%xmm6, %xmm5
	pshufd	$1, %xmm4, %xmm6        ## xmm6 = xmm4[1,0,0,0]
	mulss	%xmm3, %xmm6
	pshufd	$1, %xmm3, %xmm3        ## xmm3 = xmm3[1,0,0,0]
	mulss	%xmm4, %xmm3
	addss	%xmm6, %xmm3
	addss	%xmm5, %xmm2
	movss	%xmm2, (%rbx,%rdi,8)
	addss	%xmm3, %xmm1
	movss	%xmm1, 4(%rbx,%rdi,8)
	incq	%rsi
	cmpl	%esi, %r12d
	movl	%edx, %r8d
	jne	LBB2_26
## BB#27:                               ##   in Loop: Header=BB2_28 Depth=2
	incl	%r14d
	addq	56(%rsp), %rdi          ## 8-byte Folded Reload
	cmpl	%r12d, %r14d
	movq	40(%rsp), %rbp          ## 8-byte Reload
	jne	LBB2_28
	jmp	LBB2_30
	.align	4, 0x90
LBB2_29:                                ## %.preheader
                                        ##   Parent Loop BB2_22 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	%r10, (%rdx)
	addq	%rbp, %rdx
	decl	%ecx
	jne	LBB2_29
LBB2_30:                                ## %._crit_edge9.i
                                        ##   in Loop: Header=BB2_22 Depth=1
	incq	%r11
	addq	$8, 32(%rsp)            ## 8-byte Folded Spill
	movq	56(%rsp), %rcx          ## 8-byte Reload
	cmpl	%ecx, %r11d
	jne	LBB2_22
LBB2_31:                                ## %kf_bfly_generic.exit
	movq	%rax, %rdi
	addq	$72, %rsp
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
	movq	56(%rsp), %r15          ## 8-byte Reload
	movq	64(%rsp), %rbp          ## 8-byte Reload
	jmpq	*%rax
LBB2_7:
	addq	$4, %rbx
	addq	$268, %rbp              ## imm = 0x10C
	movq	48(%rsp), %rcx          ## 8-byte Reload
	shlq	$3, %rcx
	movl	%r15d, %eax
	.align	4, 0x90
LBB2_8:                                 ## =>This Inner Loop Header: Depth=1
	movss	-4(%rbx,%r15,8), %xmm0
	movss	-4(%rbp), %xmm1
	movss	(%rbp), %xmm2
	movaps	%xmm0, %xmm3
	mulss	%xmm1, %xmm3
	movss	(%rbx,%r15,8), %xmm4
	mulss	%xmm4, %xmm1
	mulss	%xmm2, %xmm4
	subss	%xmm4, %xmm3
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	-4(%rbx), %xmm1
	subss	%xmm3, %xmm1
	movss	%xmm1, -4(%rbx,%r15,8)
	movss	(%rbx), %xmm1
	subss	%xmm0, %xmm1
	movss	%xmm1, (%rbx,%r15,8)
	addss	-4(%rbx), %xmm3
	movss	%xmm3, -4(%rbx)
	addss	(%rbx), %xmm0
	movss	%xmm0, (%rbx)
	addq	$8, %rbx
	addq	%rcx, %rbp
	decl	%eax
	jne	LBB2_8
	jmp	LBB2_19
LBB2_9:
	movq	%r15, %rax
	movq	48(%rsp), %rdi          ## 8-byte Reload
	imulq	%rdi, %rax
	movss	268(%rbp,%rax,8), %xmm0
	addq	$268, %rbp              ## imm = 0x10C
	movq	%rdi, %rax
	shlq	$4, %rax
	shlq	$3, %rdi
	movq	%r15, %rcx
	negq	%rcx
	addq	$4, %rbx
	movq	%r15, %rdx
	shlq	$4, %rdx
	movsd	LCPI2_1(%rip), %xmm8
	movq	%rbp, %rsi
	.align	4, 0x90
LBB2_10:                                ## =>This Inner Loop Header: Depth=1
	movss	-4(%rbx,%r15,8), %xmm3
	movss	-4(%rbp), %xmm4
	movss	(%rbp), %xmm5
	movaps	%xmm3, %xmm2
	mulss	%xmm4, %xmm2
	movss	(%rbx,%r15,8), %xmm6
	mulss	%xmm6, %xmm4
	mulss	%xmm5, %xmm6
	subss	%xmm6, %xmm2
	mulss	%xmm5, %xmm3
	addss	%xmm4, %xmm3
	movss	-4(%rbx,%rdx), %xmm5
	movss	(%rbx,%rdx), %xmm4
	movss	-4(%rsi), %xmm6
	movss	(%rsi), %xmm7
	movaps	%xmm5, %xmm1
	mulss	%xmm6, %xmm1
	mulss	%xmm4, %xmm6
	mulss	%xmm7, %xmm4
	subss	%xmm4, %xmm1
	mulss	%xmm7, %xmm5
	addss	%xmm6, %xmm5
	movaps	%xmm2, %xmm6
	addss	%xmm1, %xmm6
	movaps	%xmm3, %xmm4
	addss	%xmm5, %xmm4
	subss	%xmm1, %xmm2
	subss	%xmm5, %xmm3
	movss	-4(%rbx), %xmm1
	cvtss2sd	%xmm1, %xmm1
	xorps	%xmm5, %xmm5
	cvtss2sd	%xmm6, %xmm5
	mulsd	%xmm8, %xmm5
	subsd	%xmm5, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, -4(%rbx,%r15,8)
	movss	(%rbx), %xmm1
	cvtss2sd	%xmm1, %xmm1
	xorps	%xmm5, %xmm5
	cvtss2sd	%xmm4, %xmm5
	mulsd	%xmm8, %xmm5
	subsd	%xmm5, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, (%rbx,%r15,8)
	mulss	%xmm0, %xmm2
	mulss	%xmm0, %xmm3
	addss	-4(%rbx), %xmm6
	movss	%xmm6, -4(%rbx)
	addss	(%rbx), %xmm4
	movss	%xmm4, (%rbx)
	movss	-4(%rbx,%r15,8), %xmm1
	addss	%xmm3, %xmm1
	movss	%xmm1, -4(%rbx,%rdx)
	movss	(%rbx,%r15,8), %xmm1
	subss	%xmm2, %xmm1
	movss	%xmm1, (%rbx,%rdx)
	movss	-4(%rbx,%r15,8), %xmm1
	subss	%xmm3, %xmm1
	movss	%xmm1, -4(%rbx,%r15,8)
	addss	(%rbx,%r15,8), %xmm2
	movss	%xmm2, (%rbx,%r15,8)
	addq	%rax, %rsi
	addq	%rdi, %rbp
	addq	$8, %rbx
	incq	%rcx
	jne	LBB2_10
	jmp	LBB2_19
LBB2_11:
	cmpl	$0, 4(%rbp)
	movq	48(%rsp), %r10          ## 8-byte Reload
	je	LBB2_14
## BB#12:                               ## %.preheader16.preheader
	addq	$268, %rbp              ## imm = 0x10C
	leaq	(,%r10,8), %r9
	leaq	(%r9,%r9,2), %r8
	shlq	$4, %r10
	leaq	4(%rbx), %rdx
	leaq	(%r15,%r15,2), %rax
	leaq	4(%rbx,%rax,8), %r11
	movq	%r15, %rax
	shlq	$4, %rax
	leaq	4(%rbx,%rax), %rdi
	leaq	4(%rbx,%r15,8), %rsi
	xorl	%ebx, %ebx
	movq	%rbp, %rcx
	movq	%rbp, %rax
	.align	4, 0x90
LBB2_13:                                ## %.preheader16
                                        ## =>This Inner Loop Header: Depth=1
	movss	-4(%rsi,%rbx,8), %xmm0
	movss	-4(%rbp), %xmm2
	movss	(%rbp), %xmm3
	movaps	%xmm0, %xmm9
	mulss	%xmm2, %xmm9
	movss	(%rsi,%rbx,8), %xmm4
	mulss	%xmm4, %xmm2
	mulss	%xmm3, %xmm4
	subss	%xmm4, %xmm9
	mulss	%xmm3, %xmm0
	addss	%xmm2, %xmm0
	movss	-4(%rdi,%rbx,8), %xmm2
	movss	-4(%rcx), %xmm4
	movss	(%rcx), %xmm5
	movaps	%xmm2, %xmm3
	mulss	%xmm4, %xmm3
	movss	(%rdi,%rbx,8), %xmm6
	mulss	%xmm6, %xmm4
	mulss	%xmm5, %xmm6
	subss	%xmm6, %xmm3
	mulss	%xmm5, %xmm2
	addss	%xmm4, %xmm2
	movss	-4(%r11,%rbx,8), %xmm6
	movss	-4(%rax), %xmm4
	movss	(%rax), %xmm8
	movaps	%xmm6, %xmm7
	mulss	%xmm4, %xmm7
	movss	(%r11,%rbx,8), %xmm5
	mulss	%xmm5, %xmm4
	mulss	%xmm8, %xmm5
	subss	%xmm5, %xmm7
	mulss	%xmm8, %xmm6
	addss	%xmm4, %xmm6
	movss	-4(%rdx,%rbx,8), %xmm5
	movaps	%xmm5, %xmm8
	subss	%xmm3, %xmm8
	movss	(%rdx,%rbx,8), %xmm1
	movaps	%xmm1, %xmm4
	subss	%xmm2, %xmm4
	addss	%xmm5, %xmm3
	movss	%xmm3, -4(%rdx,%rbx,8)
	addss	%xmm1, %xmm2
	movss	%xmm2, (%rdx,%rbx,8)
	movaps	%xmm9, %xmm1
	addss	%xmm7, %xmm1
	movaps	%xmm0, %xmm5
	addss	%xmm6, %xmm5
	subss	%xmm7, %xmm9
	subss	%xmm6, %xmm0
	subss	%xmm1, %xmm3
	movss	%xmm3, -4(%rdi,%rbx,8)
	subss	%xmm5, %xmm2
	movss	%xmm2, (%rdi,%rbx,8)
	addss	-4(%rdx,%rbx,8), %xmm1
	movss	%xmm1, -4(%rdx,%rbx,8)
	addss	(%rdx,%rbx,8), %xmm5
	movss	%xmm5, (%rdx,%rbx,8)
	movaps	%xmm8, %xmm1
	subss	%xmm0, %xmm1
	movss	%xmm1, -4(%rsi,%rbx,8)
	movaps	%xmm4, %xmm1
	addss	%xmm9, %xmm1
	movss	%xmm1, (%rsi,%rbx,8)
	addss	%xmm8, %xmm0
	movss	%xmm0, -4(%r11,%rbx,8)
	subss	%xmm9, %xmm4
	movss	%xmm4, (%r11,%rbx,8)
	addq	%r8, %rax
	addq	%r10, %rcx
	incq	%rbx
	addq	%r9, %rbp
	cmpq	%rbx, %r15
	jne	LBB2_13
	jmp	LBB2_19
LBB2_16:
	testl	%r15d, %r15d
	movq	48(%rsp), %r12          ## 8-byte Reload
	jle	LBB2_19
## BB#17:                               ## %.lr.ph.i9
	leaq	4(%rbx,%r15,8), %r10
	movq	%r15, %rax
	imulq	%r12, %rax
	movss	264(%rbp,%rax,8), %xmm14
	movss	268(%rbp,%rax,8), %xmm0
	movss	%xmm0, 16(%rsp)         ## 4-byte Spill
	shlq	$4, %rax
	movss	264(%rbp,%rax), %xmm4
	movss	268(%rbp,%rax), %xmm0
	movss	%xmm0, 8(%rsp)          ## 4-byte Spill
	leaq	268(%rbp), %rcx
	leaq	(,%r12,8), %r8
	leal	(%r15,%r15), %eax
	cltq
	leaq	4(%rbx,%rax,8), %r11
	leal	(%r15,%r15,2), %eax
	cltq
	leaq	4(%rbx,%rax,8), %r14
	leal	(,%r15,4), %eax
	cltq
	leaq	4(%rbx,%rax,8), %r13
	leaq	4(%rbx), %rbx
	xorl	%edx, %edx
	movabsq	$12884901888, %r9       ## imm = 0x300000000
	xorl	%eax, %eax
	xorl	%esi, %esi
	.align	4, 0x90
LBB2_18:                                ## =>This Inner Loop Header: Depth=1
	movss	-4(%rbx,%rdx,4), %xmm13
	movss	%xmm13, 56(%rsp)        ## 4-byte Spill
	movss	(%rbx,%rdx,4), %xmm12
	movss	%xmm12, 40(%rsp)        ## 4-byte Spill
	movss	-4(%r10,%rdx,4), %xmm5
	movss	-4(%rcx), %xmm0
	movss	(%rcx), %xmm1
	movaps	%xmm5, %xmm15
	mulss	%xmm0, %xmm15
	movss	(%r10,%rdx,4), %xmm2
	mulss	%xmm2, %xmm0
	mulss	%xmm1, %xmm2
	subss	%xmm2, %xmm15
	mulss	%xmm1, %xmm5
	addss	%xmm0, %xmm5
	movaps	%xmm5, %xmm11
	movss	-4(%r11,%rdx,4), %xmm2
	movslq	%edx, %rdi
	imulq	%r12, %rdi
	movss	264(%rbp,%rdi,8), %xmm0
	movaps	%xmm2, %xmm10
	mulss	%xmm0, %xmm10
	movss	(%r11,%rdx,4), %xmm1
	movss	268(%rbp,%rdi,8), %xmm5
	mulss	%xmm1, %xmm0
	mulss	%xmm5, %xmm1
	subss	%xmm1, %xmm10
	mulss	%xmm5, %xmm2
	addss	%xmm0, %xmm2
	movss	-4(%r14,%rdx,4), %xmm0
	movq	%rsi, %rdi
	sarq	$32, %rdi
	imulq	%r12, %rdi
	movss	264(%rbp,%rdi,8), %xmm1
	movaps	%xmm0, %xmm8
	mulss	%xmm1, %xmm8
	movss	(%r14,%rdx,4), %xmm5
	movss	268(%rbp,%rdi,8), %xmm6
	mulss	%xmm5, %xmm1
	mulss	%xmm6, %xmm5
	subss	%xmm5, %xmm8
	mulss	%xmm6, %xmm0
	addss	%xmm1, %xmm0
	movss	-4(%r13,%rdx,4), %xmm1
	cltq
	movq	%rax, %rdi
	imulq	%r12, %rdi
	movss	264(%rbp,%rdi,8), %xmm5
	movaps	%xmm1, %xmm7
	mulss	%xmm5, %xmm7
	movss	(%r13,%rdx,4), %xmm6
	movss	268(%rbp,%rdi,8), %xmm9
	mulss	%xmm6, %xmm5
	mulss	%xmm9, %xmm6
	subss	%xmm6, %xmm7
	mulss	%xmm9, %xmm1
	addss	%xmm5, %xmm1
	movaps	%xmm15, %xmm5
	addss	%xmm7, %xmm5
	movaps	%xmm11, %xmm9
	addss	%xmm1, %xmm9
	subss	%xmm7, %xmm15
	subss	%xmm1, %xmm11
	movss	%xmm11, 32(%rsp)        ## 4-byte Spill
	movaps	%xmm10, %xmm1
	addss	%xmm8, %xmm1
	movaps	%xmm2, %xmm7
	addss	%xmm0, %xmm7
	subss	%xmm8, %xmm10
	movss	%xmm10, 24(%rsp)        ## 4-byte Spill
	movaps	%xmm10, %xmm3
	subss	%xmm0, %xmm2
	movaps	%xmm1, %xmm0
	addss	%xmm5, %xmm0
	addss	%xmm13, %xmm0
	movss	%xmm0, -4(%rbx,%rdx,4)
	movaps	%xmm7, %xmm0
	addss	%xmm9, %xmm0
	addss	%xmm12, %xmm0
	movss	%xmm0, (%rbx,%rdx,4)
	movaps	%xmm14, %xmm6
	mulss	%xmm5, %xmm6
	addss	%xmm13, %xmm6
	movaps	%xmm4, %xmm8
	mulss	%xmm1, %xmm8
	addss	%xmm6, %xmm8
	movaps	%xmm14, %xmm6
	mulss	%xmm9, %xmm6
	addss	%xmm12, %xmm6
	movaps	%xmm4, %xmm0
	mulss	%xmm7, %xmm0
	addss	%xmm6, %xmm0
	movss	16(%rsp), %xmm13        ## 4-byte Reload
	movaps	%xmm13, %xmm6
	mulss	%xmm11, %xmm6
	movss	8(%rsp), %xmm11         ## 4-byte Reload
	movaps	%xmm11, %xmm12
	mulss	%xmm2, %xmm12
	addss	%xmm6, %xmm12
	movaps	%xmm13, %xmm6
	mulss	%xmm15, %xmm6
	xorps	LCPI2_0(%rip), %xmm6
	movaps	%xmm11, %xmm10
	mulss	%xmm3, %xmm10
	subss	%xmm10, %xmm6
	movaps	%xmm8, %xmm3
	subss	%xmm12, %xmm3
	movss	%xmm3, -4(%r10,%rdx,4)
	movaps	%xmm0, %xmm3
	subss	%xmm6, %xmm3
	movss	%xmm3, (%r10,%rdx,4)
	addss	%xmm8, %xmm12
	movss	%xmm12, -4(%r13,%rdx,4)
	addss	%xmm0, %xmm6
	movss	%xmm6, (%r13,%rdx,4)
	mulss	%xmm4, %xmm5
	addss	56(%rsp), %xmm5         ## 4-byte Folded Reload
	mulss	%xmm14, %xmm1
	addss	%xmm5, %xmm1
	mulss	%xmm4, %xmm9
	addss	40(%rsp), %xmm9         ## 4-byte Folded Reload
	mulss	%xmm14, %xmm7
	addss	%xmm9, %xmm7
	movss	32(%rsp), %xmm0         ## 4-byte Reload
	mulss	%xmm11, %xmm0
	mulss	%xmm13, %xmm2
	subss	%xmm0, %xmm2
	mulss	%xmm11, %xmm15
	movss	24(%rsp), %xmm0         ## 4-byte Reload
	mulss	%xmm13, %xmm0
	subss	%xmm0, %xmm15
	movaps	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%r11,%rdx,4)
	movaps	%xmm15, %xmm0
	addss	%xmm7, %xmm0
	movss	%xmm0, (%r11,%rdx,4)
	subss	%xmm2, %xmm1
	movss	%xmm1, -4(%r14,%rdx,4)
	subss	%xmm15, %xmm7
	movss	%xmm7, (%r14,%rdx,4)
	addq	%r9, %rsi
	addl	$4, %eax
	addq	$2, %rdx
	addq	%r8, %rcx
	decl	%r15d
	jne	LBB2_18
	jmp	LBB2_19
LBB2_14:                                ## %.preheader14.preheader
	addq	$268, %rbp              ## imm = 0x10C
	leaq	(,%r10,8), %r9
	leaq	(%r9,%r9,2), %r8
	shlq	$4, %r10
	leaq	4(%rbx), %rdx
	leaq	(%r15,%r15,2), %rax
	leaq	4(%rbx,%rax,8), %r11
	movq	%r15, %rax
	shlq	$4, %rax
	leaq	4(%rbx,%rax), %rdi
	leaq	4(%rbx,%r15,8), %rsi
	xorl	%ebx, %ebx
	movq	%rbp, %rcx
	movq	%rbp, %rax
	.align	4, 0x90
LBB2_15:                                ## %.preheader14
                                        ## =>This Inner Loop Header: Depth=1
	movss	-4(%rsi,%rbx,8), %xmm10
	movss	-4(%rbp), %xmm2
	movss	(%rbp), %xmm3
	movaps	%xmm10, %xmm0
	mulss	%xmm2, %xmm0
	movss	(%rsi,%rbx,8), %xmm4
	mulss	%xmm4, %xmm2
	mulss	%xmm3, %xmm4
	subss	%xmm4, %xmm0
	mulss	%xmm3, %xmm10
	addss	%xmm2, %xmm10
	movss	-4(%rdi,%rbx,8), %xmm2
	movss	-4(%rcx), %xmm4
	movss	(%rcx), %xmm5
	movaps	%xmm2, %xmm3
	mulss	%xmm4, %xmm3
	movss	(%rdi,%rbx,8), %xmm6
	mulss	%xmm6, %xmm4
	mulss	%xmm5, %xmm6
	subss	%xmm6, %xmm3
	mulss	%xmm5, %xmm2
	addss	%xmm4, %xmm2
	movss	-4(%r11,%rbx,8), %xmm6
	movss	-4(%rax), %xmm4
	movss	(%rax), %xmm8
	movaps	%xmm6, %xmm7
	mulss	%xmm4, %xmm7
	movss	(%r11,%rbx,8), %xmm5
	mulss	%xmm5, %xmm4
	mulss	%xmm8, %xmm5
	subss	%xmm5, %xmm7
	mulss	%xmm8, %xmm6
	addss	%xmm4, %xmm6
	movss	-4(%rdx,%rbx,8), %xmm5
	movaps	%xmm5, %xmm4
	subss	%xmm3, %xmm4
	movss	(%rdx,%rbx,8), %xmm9
	movaps	%xmm9, %xmm8
	subss	%xmm2, %xmm8
	addss	%xmm5, %xmm3
	movss	%xmm3, -4(%rdx,%rbx,8)
	addss	%xmm9, %xmm2
	movss	%xmm2, (%rdx,%rbx,8)
	movaps	%xmm0, %xmm5
	addss	%xmm7, %xmm5
	movaps	%xmm10, %xmm1
	addss	%xmm6, %xmm1
	subss	%xmm7, %xmm0
	subss	%xmm6, %xmm10
	subss	%xmm5, %xmm3
	movss	%xmm3, -4(%rdi,%rbx,8)
	subss	%xmm1, %xmm2
	movss	%xmm2, (%rdi,%rbx,8)
	addss	-4(%rdx,%rbx,8), %xmm5
	movss	%xmm5, -4(%rdx,%rbx,8)
	addss	(%rdx,%rbx,8), %xmm1
	movss	%xmm1, (%rdx,%rbx,8)
	movaps	%xmm4, %xmm1
	addss	%xmm10, %xmm1
	movss	%xmm1, -4(%rsi,%rbx,8)
	movaps	%xmm8, %xmm1
	subss	%xmm0, %xmm1
	movss	%xmm1, (%rsi,%rbx,8)
	subss	%xmm10, %xmm4
	movss	%xmm4, -4(%r11,%rbx,8)
	addss	%xmm8, %xmm0
	movss	%xmm0, (%r11,%rbx,8)
	addq	%r8, %rax
	addq	%r10, %rcx
	incq	%rbx
	addq	%r9, %rbp
	cmpq	%rbx, %r15
	jne	LBB2_15
LBB2_19:                                ## %kf_bfly2.exit
	addq	$72, %rsp
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
	shlq	$3, %rdi
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
	shlq	$3, %rdx
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
