.title	"02b_arith.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_IFS:	.long 

.int 0
str0:	.string ""
.int 32
str1:	.string "Runtime error: Division by zero!"

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $36, %esp

mov $5, %eax	# Move 5,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Move R1,var1_a
mov %eax, -28(%ebp)

mov $10, %eax	# Move 10,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Move R2,var2_b
mov %eax, -32(%ebp)

mov $20, %eax	# Move 20,R3
mov %eax, -12(%ebp)

mov -12(%ebp), %eax	# Move R3,var3_c
mov %eax, -36(%ebp)

mov -28(%ebp), %eax	# Move var1_a,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var2_b,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Add R5,R4
Add -20(%ebp), %eax
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var3_c,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Add R5,R4
Add -20(%ebp), %eax
mov %eax, -16(%ebp)

# Library __printi(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov $str0, %eax	# Move str0,R4
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

mov -28(%ebp), %eax	# Move var1_a,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var2_b,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Mul R5,R4
mov -20(%ebp), %ebx
mul %ebx
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var3_c,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Add R5,R4
Add -20(%ebp), %eax
mov %eax, -16(%ebp)

# Library __printi(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov $str0, %eax	# Move str0,R4
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

mov -32(%ebp), %eax	# Move var2_b,R4
mov %eax, -16(%ebp)

mov -28(%ebp), %eax	# Move var1_a,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare 0,R5
cmp $0, %eax

JNZ _end_label1

mov $str1, %eax	# Move str1,R4
mov %eax, -16(%ebp)

# Library __print(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label1:

mov -16(%ebp), %eax	# Div R5,R4
mov -20(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var3_c,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Mul R5,R4
mov -20(%ebp), %ebx
mul %ebx
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var3_c,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var3_c,R6
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Mul R6,R5
mov -24(%ebp), %ebx
mul %ebx
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Add R5,R4
Add -20(%ebp), %eax
mov %eax, -16(%ebp)

# Library __printi(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov $str0, %eax	# Move str0,R4
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

mov -36(%ebp), %eax	# Move var3_c,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var2_b,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Sub R5,R4
Sub -20(%ebp), %eax
mov %eax, -16(%ebp)

mov -28(%ebp), %eax	# Move var1_a,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Sub R5,R4
Sub -20(%ebp), %eax
mov %eax, -16(%ebp)

mov $5, %eax	# Move 5,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Sub R5,R4
Sub -20(%ebp), %eax
mov %eax, -16(%ebp)

# Library __printi(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov $str0, %eax	# Move str0,R4
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp

