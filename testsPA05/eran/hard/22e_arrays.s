.title	"22e_arrays.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_MainClass:	.long 

.int 6
str0:	.string "a = -3"
.int 10
str1:	.string "new int[a]"
.int 57
str2:	.string "Runtime error: Array allocation with negative array size!"
.int 34
str3:	.string "Should not print this or get here."

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $28, %esp

mov $0, %eax	# Move 0,R2
mov %eax, -8(%ebp)

mov $3, %eax	# Move 3,R3
mov %eax, -12(%ebp)

mov -8(%ebp), %eax	# Sub R3,R2
Sub -12(%ebp), %eax
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Move R2,var1_a
mov %eax, -28(%ebp)

mov $str0, %eax	# Move str0,R3
mov %eax, -12(%ebp)

# Library __println(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __println
add $4, %esp

mov $str1, %eax	# Move str1,R3
mov %eax, -12(%ebp)

# Library __println(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __println
add $4, %esp

mov -28(%ebp), %eax	# Move var1_a,R4
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Mul 4,R4
mov $4, %ebx
mul %ebx
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JGE _end_label1

mov $str2, %eax	# Move str2,R3
mov %eax, -12(%ebp)

# Library __print(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label1:

# Library __allocateArray(R4),R3
mov -16(%ebp), %eax
push %eax
call __allocateArray
add $4, %esp
mov %eax, -12(%ebp)

mov -12(%ebp), %eax	# Move R3,var2_arr
mov %eax, -24(%ebp)

mov $str3, %eax	# Move str3,R4
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

