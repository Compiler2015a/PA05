.title	"08a_recursive.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_A:	.long 
_DV_Check:	.long 

.int 1
str0:	.string " "
.int 0
str1:	.string ""

# text (code) section
.text

# -------------------
.align 4
_DV_A_calc_print_factorial:
push %ebp	# prologue
mov %esp, %ebp
sub $20, %esp

mov $1, %eax	# Move 1,R1
mov %eax, -4(%ebp)

mov 8(%ebp), %eax	# Move param1_n,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Compare R1,R2
cmp -4(%ebp), %eax

JLE _true_label1

mov $0, %eax	# Move 0,R1
mov %eax, -4(%ebp)

JMP _end_label1

_true_label1:

mov $1, %eax	# Move 1,R1
mov %eax, -4(%ebp)

_end_label1:

mov -4(%ebp), %eax	# Compare 1,R1
cmp $1, %eax

JNZ _false_label2

mov 8(%ebp), %eax	# Move param1_n,R1
mov %eax, -4(%ebp)

# Library __printi(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov $str0, %eax	# Move str0,R1
mov %eax, -4(%ebp)

# Library __print(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __print
add $4, %esp

mov 8(%ebp), %eax	# Move param1_n,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Return R1
mov %ebp, %esp	# epilogue
pop %ebp
ret

JMP _end_label2

_false_label2:

mov 8(%ebp), %eax	# Move param1_n,R1
mov %eax, -4(%ebp)

mov $1, %eax	# Move 1,R2
mov %eax, -8(%ebp)

mov -4(%ebp), %eax	# Sub R2,R1
Sub -8(%ebp), %eax
mov %eax, -4(%ebp)

# StaticCall _DV_A_calc_print_factorial(param1_n=R1),R1
mov -4(%ebp), %eax
push %eax
call _DV_A_calc_print_factorial
add $4, %esp
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Move R1,var1_a
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move var1_a,R3
mov %eax, -12(%ebp)

mov 8(%ebp), %eax	# Move param1_n,R4
mov %eax, -16(%ebp)

mov -12(%ebp), %eax	# Mul R4,R3
mov -16(%ebp), %ebx
mul %ebx
mov %eax, -12(%ebp)

mov -12(%ebp), %eax	# Move R3,var1_a
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move var1_a,R2
mov %eax, -8(%ebp)

mov -20(%ebp), %eax	# Move var1_a,R2
mov %eax, -8(%ebp)

# Library __printi(R2),Rdummy
mov -8(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov $str0, %eax	# Move str0,R2
mov %eax, -8(%ebp)

# Library __print(R2),Rdummy
mov -8(%ebp), %eax
push %eax
call __print
add $4, %esp

mov -20(%ebp), %eax	# Move var1_a,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Return R2
mov %ebp, %esp	# epilogue
pop %ebp
ret

_end_label2:


# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $8, %esp

mov $3, %eax	# Move 3,R1
mov %eax, -4(%ebp)

# StaticCall _DV_A_calc_print_factorial(param1_n=R1),R1
mov -4(%ebp), %eax
push %eax
call _DV_A_calc_print_factorial
add $4, %esp
mov %eax, -4(%ebp)

mov $str1, %eax	# Move str1,R1
mov %eax, -4(%ebp)

# Library __println(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __println
add $4, %esp

mov $5, %eax	# Move 5,R1
mov %eax, -4(%ebp)

# StaticCall _DV_A_calc_print_factorial(param1_n=R1),R1
mov -4(%ebp), %eax
push %eax
call _DV_A_calc_print_factorial
add $4, %esp
mov %eax, -4(%ebp)

mov $str1, %eax	# Move str1,R1
mov %eax, -4(%ebp)

# Library __println(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __println
add $4, %esp

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp

