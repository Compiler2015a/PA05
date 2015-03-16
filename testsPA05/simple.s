.title	"simple.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_A:	.long __ic_main,_DV_A_foo

.int 42
str0:	.string "Runtime error: Null pointer dereference!"

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $16, %esp

# Library __allocateObject(12),R1
mov $12, %eax
push %eax
call __allocateObject
add $4, %esp
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# MoveField _DV_A,R1.0
mov $0, %ebx
mov $_DV_A, %ecx
mov %ecx, (%eax,%ebx,4)

mov -4(%ebp), %eax	# Move R1,var1_a
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Move var1_a,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Compare 0,R2
cmp $0, %eax

JNZ _end_label1

mov $str0, %eax	# Move str0,R2
mov %eax, -8(%ebp)

# Library __print(R2),Rdummy
mov -8(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label1:

mov -8(%ebp), %eax	# VirtualCall R2.1(),R2
push %eax
mov (%eax), %eax
call *4(%eax)
add $4, %esp
mov %eax, -8(%ebp)

# Library __printi(R2),Rdummy
mov -8(%ebp), %eax
push %eax
call __printi
add $4, %esp

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp

mov %ebp, %esp	# epilogue
pop %ebp
ret

# -------------------
.align 4
_DV_A_foo:
push %ebp	# prologue
mov %esp, %ebp
sub $0, %esp

mov $5, %eax	# Move 5,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Return R1
ret

