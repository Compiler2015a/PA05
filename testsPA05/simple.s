.title	"simple.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_Check:	.long __ic_main

.int 3
str0:	.string "5"

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $8, %esp

mov $str0, %eax	# Move str0,R1
mov %eax, -4(%ebp)

# Library __print(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __print
add $4, %esp

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp

