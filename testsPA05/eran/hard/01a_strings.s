.title	"01a_strings.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_IFS:	.long 

.int 1
str0:	.string "a"
.int 1
str1:	.string "b"
.int 1
str2:	.string "c"
.int 2
str3:	.string "ab"
.int 7
str4:	.string "equals1"
.int 7
str5:	.string "equals2"
.int 7
str6:	.string "equals3"
.int 7
str7:	.string "equals4"
.int 3
str8:	.string "acb"
.int 34
str9:	.string "not equals (should not be printed)"
.int 40
str10:	.string "Runtime error: Null pointer dereference!"

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $60, %esp

mov $str0, %eax	# Move str0,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Move R1,var1_a
mov %eax, -40(%ebp)

mov $str1, %eax	# Move str1,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Move R2,var2_b
mov %eax, -48(%ebp)

mov $str2, %eax	# Move str2,R3
mov %eax, -12(%ebp)

mov -12(%ebp), %eax	# Move R3,var3_c
mov %eax, -52(%ebp)

mov -40(%ebp), %eax	# Move var1_a,R4
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

mov -40(%ebp), %eax	# Move var1_a,R4
mov %eax, -16(%ebp)

mov -48(%ebp), %eax	# Move var2_b,R5
mov %eax, -20(%ebp)

# Library __stringCat(R4, R5),R4
mov -20(%ebp), %eax
push %eax
mov -16(%ebp), %eax
push %eax
call __stringCat
add $8, %esp
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

mov -52(%ebp), %eax	# Move var3_c,R4
mov %eax, -16(%ebp)

mov -48(%ebp), %eax	# Move var2_b,R5
mov %eax, -20(%ebp)

# Library __stringCat(R4, R5),R4
mov -20(%ebp), %eax
push %eax
mov -16(%ebp), %eax
push %eax
call __stringCat
add $8, %esp
mov %eax, -16(%ebp)

mov -40(%ebp), %eax	# Move var1_a,R5
mov %eax, -20(%ebp)

# Library __stringCat(R4, R5),R4
mov -20(%ebp), %eax
push %eax
mov -16(%ebp), %eax
push %eax
call __stringCat
add $8, %esp
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

mov $str3, %eax	# Move str3,R4
mov %eax, -16(%ebp)

# StaticCall _DV_IFS_len(param1_s=R4),R4
mov -16(%ebp), %eax
push %eax
call _DV_IFS_len
add $4, %esp
mov %eax, -16(%ebp)

mov -40(%ebp), %eax	# Move var1_a,R5
mov %eax, -20(%ebp)

mov -48(%ebp), %eax	# Move var2_b,R6
mov %eax, -24(%ebp)

# Library __stringCat(R5, R6),R5
mov -24(%ebp), %eax
push %eax
mov -20(%ebp), %eax
push %eax
call __stringCat
add $8, %esp
mov %eax, -20(%ebp)

# StaticCall _DV_IFS_len(param1_s=R5),R5
mov -20(%ebp), %eax
push %eax
call _DV_IFS_len
add $4, %esp
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label1

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label1

_true_label1:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label1:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _end_label2

mov $str4, %eax	# Move str4,R4
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

_end_label2:

mov $str3, %eax	# Move str3,R4
mov %eax, -16(%ebp)

# StaticCall _DV_IFS_len(param1_s=R4),R4
mov -16(%ebp), %eax
push %eax
call _DV_IFS_len
add $4, %esp
mov %eax, -16(%ebp)

mov $str3, %eax	# Move str3,R5
mov %eax, -20(%ebp)

# StaticCall _DV_IFS_len(param1_s=R5),R5
mov -20(%ebp), %eax
push %eax
call _DV_IFS_len
add $4, %esp
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label3

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label3

_true_label3:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label3:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _end_label4

mov $str5, %eax	# Move str5,R4
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

_end_label4:

mov -40(%ebp), %eax	# Move var1_a,R4
mov %eax, -16(%ebp)

mov -48(%ebp), %eax	# Move var2_b,R5
mov %eax, -20(%ebp)

# Library __stringCat(R4, R5),R4
mov -20(%ebp), %eax
push %eax
mov -16(%ebp), %eax
push %eax
call __stringCat
add $8, %esp
mov %eax, -16(%ebp)

mov -16(%ebp), %eax	# Move R4,var4_ab
mov %eax, -44(%ebp)

mov $str3, %eax	# Move str3,R5
mov %eax, -20(%ebp)

# StaticCall _DV_IFS_len(param1_s=R5),R5
mov -20(%ebp), %eax
push %eax
call _DV_IFS_len
add $4, %esp
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var4_ab,R6
mov %eax, -24(%ebp)

# StaticCall _DV_IFS_len(param1_s=R6),R6
mov -24(%ebp), %eax
push %eax
call _DV_IFS_len
add $4, %esp
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JZ _true_label5

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label5

_true_label5:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label5:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JNZ _end_label6

mov $str6, %eax	# Move str6,R5
mov %eax, -20(%ebp)

# Library __println(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __println
add $4, %esp

_end_label6:

mov -44(%ebp), %eax	# Move var4_ab,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var5_abab
mov %eax, -60(%ebp)

mov -44(%ebp), %eax	# Move var4_ab,R6
mov %eax, -24(%ebp)

mov -60(%ebp), %eax	# Move var5_abab,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare R6,R7
cmp -24(%ebp), %eax

JZ _true_label7

mov $0, %eax	# Move 0,R6
mov %eax, -24(%ebp)

JMP _end_label7

_true_label7:

mov $1, %eax	# Move 1,R6
mov %eax, -24(%ebp)

_end_label7:

mov -24(%ebp), %eax	# Compare 1,R6
cmp $1, %eax

JNZ _end_label8

mov $str7, %eax	# Move str7,R6
mov %eax, -24(%ebp)

# Library __println(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __println
add $4, %esp

_end_label8:

mov $str8, %eax	# Move str8,R6
mov %eax, -24(%ebp)

# StaticCall _DV_IFS_len(param1_s=R6),R6
mov -24(%ebp), %eax
push %eax
call _DV_IFS_len
add $4, %esp
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_a,R7
mov %eax, -28(%ebp)

mov -52(%ebp), %eax	# Move var3_c,R8
mov %eax, -32(%ebp)

# Library __stringCat(R7, R8),R7
mov -32(%ebp), %eax
push %eax
mov -28(%ebp), %eax
push %eax
call __stringCat
add $8, %esp
mov %eax, -28(%ebp)

# StaticCall _DV_IFS_len(param1_s=R7),R7
mov -28(%ebp), %eax
push %eax
call _DV_IFS_len
add $4, %esp
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare R6,R7
cmp -24(%ebp), %eax

JZ _true_label9

mov $0, %eax	# Move 0,R6
mov %eax, -24(%ebp)

JMP _end_label9

_true_label9:

mov $1, %eax	# Move 1,R6
mov %eax, -24(%ebp)

_end_label9:

mov -24(%ebp), %eax	# Compare 1,R6
cmp $1, %eax

JNZ _end_label10

mov $str9, %eax	# Move str9,R6
mov %eax, -24(%ebp)

# Library __println(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __println
add $4, %esp

_end_label10:

mov $0, %eax	# Move 0,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Move R6,var6_i
mov %eax, -56(%ebp)

_test_label11:

mov $3, %eax	# Move 3,R7
mov %eax, -28(%ebp)

mov -56(%ebp), %eax	# Move var6_i,R8
mov %eax, -32(%ebp)

mov -32(%ebp), %eax	# Compare R7,R8
cmp -28(%ebp), %eax

JL _true_label12

mov $0, %eax	# Move 0,R7
mov %eax, -28(%ebp)

JMP _end_label12

_true_label12:

mov $1, %eax	# Move 1,R7
mov %eax, -28(%ebp)

_end_label12:

mov -28(%ebp), %eax	# Compare 1,R7
cmp $1, %eax

JNZ _end_label11

mov -40(%ebp), %eax	# Move var1_a,R8
mov %eax, -32(%ebp)

mov -40(%ebp), %eax	# Move var1_a,R9
mov %eax, -36(%ebp)

# Library __stringCat(R8, R9),R8
mov -36(%ebp), %eax
push %eax
mov -32(%ebp), %eax
push %eax
call __stringCat
add $8, %esp
mov %eax, -32(%ebp)

mov -32(%ebp), %eax	# Move R8,var1_a
mov %eax, -40(%ebp)

mov -40(%ebp), %eax	# Move var1_a,R7
mov %eax, -28(%ebp)

mov -56(%ebp), %eax	# Move var6_i,R8
mov %eax, -32(%ebp)

mov $1, %eax	# Move 1,R9
mov %eax, -36(%ebp)

mov -32(%ebp), %eax	# Add R9,R8
Add -36(%ebp), %eax
mov %eax, -32(%ebp)

mov -32(%ebp), %eax	# Move R8,var6_i
mov %eax, -56(%ebp)

mov -56(%ebp), %eax	# Move var6_i,R7
mov %eax, -28(%ebp)

JMP _test_label11

_end_label11:

mov -40(%ebp), %eax	# Move var1_a,R7
mov %eax, -28(%ebp)

# Library __println(R7),Rdummy
mov -28(%ebp), %eax
push %eax
call __println
add $4, %esp

_PROGRAM_END:

# Library __exit(0),Rdummy
mov $0, %eax
push %eax
call __exit
add $4, %esp


# -------------------
.align 4
_DV_IFS_len:
push %ebp	# prologue
mov %esp, %ebp
sub $12, %esp

mov 8(%ebp), %eax	# Move param1_s,R2
mov %eax, -8(%ebp)

# Library __stoa(R2),R2
mov -8(%ebp), %eax
push %eax
call __stoa
add $4, %esp
mov %eax, -8(%ebp)
mov %eax, %ebx	# fixing stoa output length to be artificially multiblied by 4
mov -4(%ebx), %eax
mov $4, %ecx
mul %ecx
mov %eax, -4(%ebx)

mov -8(%ebp), %eax	# Compare 0,R2
cmp $0, %eax

JNZ _end_label13

mov $str10, %eax	# Move str10,R1
mov %eax, -4(%ebp)

# Library __print(R1),Rdummy
mov -4(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label13:

mov -8(%ebp), %eax	# ArrayLength R2,R1
mov -4(%eax), %eax
mov $4, %ebx
mov $0, %edx
div %ebx
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Return R1
mov %ebp, %esp	# epilogue
pop %ebp
ret

