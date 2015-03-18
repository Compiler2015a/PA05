.title	"07c_inheritance.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_MySuperClass:	.long _DV_MySuperClass_a,_DV_MySuperClass_b,_DV_MySuperClass_c,_DV_MySuperClass_d
_DV_Check:	.long 
_DV_MyInheritedClass:	.long _DV_MySuperClass_a,_DV_MySuperClass_b,_DV_MySuperClass_c,_DV_MySuperClass_d

.int 5
str0:	.string "hello"
.int 57
str1:	.string "Runtime error: Array allocation with negative array size!"
.int 40
str2:	.string "Runtime error: Null pointer dereference!"

# text (code) section
.text

# -------------------
.align 4
_DV_MySuperClass_a:
push %ebp	# prologue
mov %esp, %ebp
sub $0, %esp

mov %ebp, %esp	# epilogue
pop %ebp
ret


# -------------------
.align 4
_DV_MySuperClass_b:
push %ebp	# prologue
mov %esp, %ebp
sub $0, %esp

mov $0, %eax	# Move 0,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Return R1
mov %ebp, %esp	# epilogue
pop %ebp
ret


# -------------------
.align 4
_DV_MySuperClass_c:
push %ebp	# prologue
mov %esp, %ebp
sub $0, %esp

mov $str0, %eax	# Move str0,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Return R1
mov %ebp, %esp	# epilogue
pop %ebp
ret


# -------------------
.align 4
_DV_MySuperClass_d:
push %ebp	# prologue
mov %esp, %ebp
sub $8, %esp

mov $3, %eax	# Move 3,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Mul 4,R2
mov $4, %ebx
mul %ebx
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Compare 0,R2
cmp $0, %eax

JGE _end_label1

mov $str1, %eax	# Move str1,R1
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

mov -4(%ebp), %eax	# Return R1
mov %ebp, %esp	# epilogue
pop %ebp
ret


# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $40, %esp

# Library __allocateObject(4),R1
mov $4, %eax
push %eax
call __allocateObject
add $4, %esp
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# MoveField _DV_MyInheritedClass,R1.0
mov $0, %ebx
mov $_DV_MyInheritedClass, %ecx
mov %ecx, (%eax,%ebx,4)

mov -4(%ebp), %eax	# Move R1,var1_obj
mov %eax, -36(%ebp)

mov -36(%ebp), %eax	# Move var1_obj,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Compare 0,R2
cmp $0, %eax

JNZ _end_label2

mov $str2, %eax	# Move str2,R2
mov %eax, -8(%ebp)

# Library __print(R2),Rdummy
mov -8(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label2:

mov -8(%ebp), %eax	# VirtualCall R2.0(),Rdummy
push %eax
mov (%eax), %eax
call *0(%eax)
add $4, %esp

mov -36(%ebp), %eax	# Move var1_obj,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Compare 0,R2
cmp $0, %eax

JNZ _end_label3

mov $str2, %eax	# Move str2,R2
mov %eax, -8(%ebp)

# Library __print(R2),Rdummy
mov -8(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label3:

mov -8(%ebp), %eax	# VirtualCall R2.1(),R2
push %eax
mov (%eax), %eax
call *4(%eax)
add $4, %esp
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Move R2,var2_x
mov %eax, -40(%ebp)

mov -36(%ebp), %eax	# Move var1_obj,R3
mov %eax, -12(%ebp)

mov -12(%ebp), %eax	# Compare 0,R3
cmp $0, %eax

JNZ _end_label4

mov $str2, %eax	# Move str2,R3
mov %eax, -12(%ebp)

# Library __print(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label4:

mov -40(%ebp), %eax	# Move var2_x,R4
mov %eax, -16(%ebp)

mov -12(%ebp), %eax	# VirtualCall R3.2(param1_a=R4),R3
mov -16(%ebp), %ebx
push %ebx
push %eax
mov (%eax), %eax
call *8(%eax)
add $8, %esp
mov %eax, -12(%ebp)

mov -12(%ebp), %eax	# Move R3,var3_str
mov %eax, -28(%ebp)

mov -36(%ebp), %eax	# Move var1_obj,R4
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JNZ _end_label5

mov $str2, %eax	# Move str2,R4
mov %eax, -16(%ebp)

# Library __print(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label5:

mov -28(%ebp), %eax	# Move var3_str,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# VirtualCall R4.3(param1_s=R5),R4
mov -20(%ebp), %ebx
push %ebx
push %eax
mov (%eax), %eax
call *12(%eax)
add $8, %esp
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Move R4,var4_arr
mov %eax, -32(%ebp)

mov -40(%ebp), %eax	# Move var2_x,R5
mov %eax, -20(%ebp)

# Library __printi(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov -32(%ebp), %eax	# Move var4_arr,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label6

mov $str2, %eax	# Move str2,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label6:

mov -24(%ebp), %eax	# ArrayLength R6,R5
mov -4(%eax), %eax
mov $4, %ebx
mov $0, %edx
div %ebx
mov %eax, -20(%ebp)

# Library __printi(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __printi
add $4, %esp

mov -28(%ebp), %eax	# Move var3_str,R5
mov %eax, -20(%ebp)

# Library __println(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __println
add $4, %esp

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp

