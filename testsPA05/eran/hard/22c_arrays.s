.title	"22c_arrays.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_MainClass:	.long 

.int 57
str0:	.string "Runtime error: Array allocation with negative array size!"
.int 40
str1:	.string "Runtime error: Null pointer dereference!"
.int 41
str2:	.string "Runtime error: Array index out of bounds!"
.int 34
str3:	.string "Should not print this or get here."

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $40, %esp

mov $5, %eax	# Move 5,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Mul 4,R2
mov $4, %ebx
mul %ebx
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Compare 0,R2
cmp $0, %eax

JGE _end_label1

mov $str0, %eax	# Move str0,R1
mov %eax, -4(%ebp)

# Library __print(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label1:

# Library __allocateArray(R2),R1
mov -8(%ebp), %eax
push %eax
call __allocateArray
add $4, %esp
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Move R1,var1_arr
mov %eax, -36(%ebp)

mov -36(%ebp), %eax	# Move var1_arr,R5
mov %eax, -20(%ebp)

mov $0, %eax	# Move 0,R6
mov %eax, -24(%ebp)

mov $2, %eax	# Move 2,R7
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Sub R7,R6
Sub -28(%ebp), %eax
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Compare 0,R5
cmp $0, %eax

JNZ _end_label2

mov $str1, %eax	# Move str1,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label2:

mov -20(%ebp), %eax	# ArrayLength R5,R8
mov -4(%eax), %eax
mov $4, %ebx
mov $0, %edx
div %ebx
mov %eax, -32(%ebp)

mov -32(%ebp), %eax	# Compare R6,R8
cmp -24(%ebp), %eax

JG _end_label3

mov $str2, %eax	# Move str2,R8
mov %eax, -32(%ebp)

# Library __print(R8),Rdummy
mov -32(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label3:

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JGE _end_label4

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label4:

mov -20(%ebp), %eax	# MoveArray R5[R6],R2
mov -24(%ebp), %ebx
mov (%eax,%ebx,4), %ecx
mov %ecx, -8(%ebp)

mov -8(%ebp), %eax	# Move R2,var2_i
mov %eax, -40(%ebp)

mov $str3, %eax	# Move str3,R3
mov %eax, -12(%ebp)

# Library __println(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __println
add $4, %esp

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp

