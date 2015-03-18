.title	"06a_static.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_A:	.long 
_DV_Check:	.long 

.int 0
str0:	.string ""

# text (code) section
.text

# -------------------
.align 4
_DV_A_print_sum:
push %ebp	# prologue
mov %esp, %ebp
sub $8, %esp

mov 8(%ebp), %eax	# Move param1_a,R1
mov %eax, -4(%ebp)

mov 12(%ebp), %eax	# Move param2_b,R2
mov %eax, -8(%ebp)

mov -4(%ebp), %eax	# Add R2,R1
Add -8(%ebp), %eax
mov %eax, -4(%ebp)

# Library __printi(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov $str0, %eax	# Move str0,R1
mov %eax, -4(%ebp)

# Library __println(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __println
add $4, %esp

mov %ebp, %esp	# epilogue
pop %ebp
ret


# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $12, %esp

mov $4, %eax	# Move 4,R1
mov %eax, -4(%ebp)

mov $6, %eax	# Move 6,R2
mov %eax, -8(%ebp)

# StaticCall _DV_A_print_sum(param1_a=R1, param2_b=R2),Rdummy
mov -8(%ebp), %eax
push %eax
mov -4(%ebp), %eax
push %eax
call _DV_A_print_sum
add $8, %esp

mov $4, %eax	# Move 4,R1
mov %eax, -4(%ebp)

mov $6, %eax	# Move 6,R2
mov %eax, -8(%ebp)

mov -4(%ebp), %eax	# Add R2,R1
Add -8(%ebp), %eax
mov %eax, -4(%ebp)

mov $5, %eax	# Move 5,R2
mov %eax, -8(%ebp)

mov $5, %eax	# Move 5,R3
mov %eax, -12(%ebp)

mov -8(%ebp), %eax	# Add R3,R2
Add -12(%ebp), %eax
mov %eax, -8(%ebp)

# StaticCall _DV_A_print_sum(param1_a=R1, param2_b=R2),Rdummy
mov -8(%ebp), %eax
push %eax
mov -4(%ebp), %eax
push %eax
call _DV_A_print_sum
add $8, %esp

mov $1, %eax	# Move 1,R1
mov %eax, -4(%ebp)

mov $2, %eax	# Move 2,R2
mov %eax, -8(%ebp)

# StaticCall _DV_A_print_sum(param1_a=R1, param2_b=R2),Rdummy
mov -8(%ebp), %eax
push %eax
mov -4(%ebp), %eax
push %eax
call _DV_A_print_sum
add $8, %esp

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp

