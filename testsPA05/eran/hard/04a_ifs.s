.title	"04a_ifs.ic"

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
.int 3
str2:	.string "TTT"
.int 3
str3:	.string "TTF"
.int 3
str4:	.string "TFT"
.int 3
str5:	.string "TFF"
.int 3
str6:	.string "FTT"
.int 3
str7:	.string "FTF"
.int 3
str8:	.string "FFT"
.int 3
str9:	.string "FFF"

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $36, %esp

mov $12, %eax	# Move 12,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Move R1,var1_x
mov %eax, -32(%ebp)

mov $8, %eax	# Move 8,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Move R2,var2_y
mov %eax, -36(%ebp)

mov $str0, %eax	# Move str0,R3
mov %eax, -12(%ebp)

mov -12(%ebp), %eax	# Move R3,var3_res
mov %eax, -28(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JL _true_label1

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label1

_true_label1:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label1:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label2

mov -32(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Mul R5,R4
mov -20(%ebp), %ebx
mul %ebx
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Add R6,R5
Add -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JG _true_label3

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label3

_true_label3:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label3:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label4

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label6

mov $str1, %eax	# Move str1,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label6:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label5

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label5

_true_label5:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label5:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label7

mov $str2, %eax	# Move str2,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

JMP _end_label7

_false_label7:

mov $str3, %eax	# Move str3,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

_end_label7:

JMP _end_label4

_false_label4:

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label9

mov $str1, %eax	# Move str1,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label9:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label8

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label8

_true_label8:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label8:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label10

mov $str4, %eax	# Move str4,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

JMP _end_label10

_false_label10:

mov $str5, %eax	# Move str5,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

_end_label10:

_end_label4:

JMP _end_label2

_false_label2:

mov -32(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Mul R5,R4
mov -20(%ebp), %ebx
mul %ebx
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Add R6,R5
Add -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JG _true_label11

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label11

_true_label11:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label11:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label12

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label14

mov $str1, %eax	# Move str1,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label14:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label13

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label13

_true_label13:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label13:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label15

mov $str6, %eax	# Move str6,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

JMP _end_label15

_false_label15:

mov $str7, %eax	# Move str7,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

_end_label15:

JMP _end_label12

_false_label12:

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label17

mov $str1, %eax	# Move str1,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label17:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label16

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label16

_true_label16:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label16:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label18

mov $str8, %eax	# Move str8,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

JMP _end_label18

_false_label18:

mov $str9, %eax	# Move str9,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

_end_label18:

_end_label12:

_end_label2:

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

# Library __println(R4),Rdummy
mov -16(%ebp), %eax
push %eax
call __println
add $4, %esp

mov $3, %eax	# Move 3,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var1_x
mov %eax, -32(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JL _true_label19

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label19

_true_label19:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label19:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label20

mov -32(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Mul R5,R4
mov -20(%ebp), %ebx
mul %ebx
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Add R6,R5
Add -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JG _true_label21

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label21

_true_label21:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label21:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label22

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label24

mov $str1, %eax	# Move str1,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label24:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label23

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label23

_true_label23:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label23:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label25

mov $str2, %eax	# Move str2,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

JMP _end_label25

_false_label25:

mov $str3, %eax	# Move str3,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

_end_label25:

JMP _end_label22

_false_label22:

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label27

mov $str1, %eax	# Move str1,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label27:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label26

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label26

_true_label26:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label26:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label28

mov $str4, %eax	# Move str4,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

JMP _end_label28

_false_label28:

mov $str5, %eax	# Move str5,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

_end_label28:

_end_label22:

JMP _end_label20

_false_label20:

mov -32(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Mul R5,R4
mov -20(%ebp), %ebx
mul %ebx
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Add R6,R5
Add -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JG _true_label29

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label29

_true_label29:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label29:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label30

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label32

mov $str1, %eax	# Move str1,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label32:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label31

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label31

_true_label31:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label31:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label33

mov $str6, %eax	# Move str6,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

JMP _end_label33

_false_label33:

mov $str7, %eax	# Move str7,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

_end_label33:

JMP _end_label30

_false_label30:

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -32(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -36(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label35

mov $str1, %eax	# Move str1,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label35:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JZ _true_label34

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label34

_true_label34:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label34:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JNZ _false_label36

mov $str8, %eax	# Move str8,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

JMP _end_label36

_false_label36:

mov $str9, %eax	# Move str9,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Move R5,var3_res
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Move var3_res,R4
mov %eax, -16(%ebp)

_end_label36:

_end_label30:

_end_label20:

mov -28(%ebp), %eax	# Move var3_res,R4
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

