.title	"03a_loops.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_IFS:	.long 

.int 1
str0:	.string " "
.int 0
str1:	.string ""
.int 1
str2:	.string "*"

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $32, %esp

mov $1, %eax	# Move 1,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Move R1,var1_x
mov %eax, -28(%ebp)

mov $20, %eax	# Move 20,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Move R2,var2_y
mov %eax, -32(%ebp)

_test_label1:

mov $11, %eax	# Move 11,R3
mov %eax, -12(%ebp)

mov -28(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Compare R3,R4
cmp -12(%ebp), %eax

JL _true_label2

mov $0, %eax	# Move 0,R3
mov %eax, -12(%ebp)

JMP _end_label2

_true_label2:

mov $1, %eax	# Move 1,R3
mov %eax, -12(%ebp)

_end_label2:

mov -12(%ebp), %eax	# Compare 1,R3
cmp $1, %eax

JNZ _end_label1

mov -28(%ebp), %eax	# Move var1_x,R3
mov %eax, -12(%ebp)

mov $2, %eax	# Move 2,R4
mov %eax, -16(%ebp)

mov -12(%ebp), %eax	# Mul R4,R3
mov -16(%ebp), %ebx
mul %ebx
mov %eax, -12(%ebp)

# Library __printi(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov $str0, %eax	# Move str0,R3
mov %eax, -12(%ebp)

# Library __print(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __print
add $4, %esp

mov -28(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Add R5,R4
Add -20(%ebp), %eax
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Move R4,var1_x
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var1_x,R3
mov %eax, -12(%ebp)

JMP _test_label1

_end_label1:

mov $str1, %eax	# Move str1,R3
mov %eax, -12(%ebp)

# Library __println(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __println
add $4, %esp

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Move R4,var1_x
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var1_x,R3
mov %eax, -12(%ebp)

_test_label3:

mov $5, %eax	# Move 5,R3
mov %eax, -12(%ebp)

mov -28(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Compare R3,R4
cmp -12(%ebp), %eax

JLE _true_label4

mov $0, %eax	# Move 0,R3
mov %eax, -12(%ebp)

JMP _end_label4

_true_label4:

mov $1, %eax	# Move 1,R3
mov %eax, -12(%ebp)

_end_label4:

mov -12(%ebp), %eax	# Compare 1,R3
cmp $1, %eax

JNZ _end_label3

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Move R4,var2_y
mov %eax, -32(%ebp)

mov -32(%ebp), %eax	# Move var2_y,R3
mov %eax, -12(%ebp)

_test_label5:

mov -28(%ebp), %eax	# Move var1_x,R3
mov %eax, -12(%ebp)

mov -32(%ebp), %eax	# Move var2_y,R4
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Compare R3,R4
cmp -12(%ebp), %eax

JLE _true_label6

mov $0, %eax	# Move 0,R3
mov %eax, -12(%ebp)

JMP _end_label6

_true_label6:

mov $1, %eax	# Move 1,R3
mov %eax, -12(%ebp)

_end_label6:

mov -12(%ebp), %eax	# Compare 1,R3
cmp $1, %eax

JNZ _end_label5

mov $str2, %eax	# Move str2,R3
mov %eax, -12(%ebp)

# Library __print(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __print
add $4, %esp

mov -32(%ebp), %eax	# Move var2_y,R4
mov %eax, -16(%ebp)

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Add R5,R4
Add -20(%ebp), %eax
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Move R4,var2_y
mov %eax, -32(%ebp)

mov -32(%ebp), %eax	# Move var2_y,R3
mov %eax, -12(%ebp)

JMP _test_label5

_end_label5:

mov $str1, %eax	# Move str1,R3
mov %eax, -12(%ebp)

# Library __println(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __println
add $4, %esp

mov -28(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Add R5,R4
Add -20(%ebp), %eax
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Move R4,var1_x
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var1_x,R3
mov %eax, -12(%ebp)

JMP _test_label3

_end_label3:

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp

