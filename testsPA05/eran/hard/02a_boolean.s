.title	"02a_boolean.ic"

# global declarations
.global __ic_main

# data section
.data
.align 4

_DV_BoolCheck:	.long 

.int 32
str0:	.string "Runtime error: Division by zero!"
.int 0
str1:	.string ""

# text (code) section
.text

# -------------------
.align 4
__ic_main:
push %ebp	# prologue
mov %esp, %ebp
sub $44, %esp

mov $4, %eax	# Move 4,R1
mov %eax, -4(%ebp)

mov -4(%ebp), %eax	# Move R1,var1_x
mov %eax, -40(%ebp)

mov $23, %eax	# Move 23,R2
mov %eax, -8(%ebp)

mov -8(%ebp), %eax	# Move R2,var2_y
mov %eax, -44(%ebp)

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JG _true_label10

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label10

_true_label10:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label10:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JZ _end_label9

mov $5, %eax	# Move 5,R4
mov %eax, -16(%ebp)

mov $3, %eax	# Move 3,R5
mov %eax, -20(%ebp)

mov -16(%ebp), %eax	# Sub R5,R4
Sub -20(%ebp), %eax
mov %eax, -16(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Sub R6,R5
Sub -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JL _true_label11

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label11

_true_label11:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label11:

_end_label9:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JZ _end_label8

mov -40(%ebp), %eax	# Move var1_x,R4
mov %eax, -16(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label13

mov $str0, %eax	# Move str0,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label13:

mov -20(%ebp), %eax	# Mod R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JNZ _true_label12

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label12

_true_label12:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label12:

_end_label8:

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JZ _end_label7

mov $3, %eax	# Move 3,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label17

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label17:

mov -24(%ebp), %eax	# Div R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JG _true_label16

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label16

_true_label16:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label16:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label15

mov $5, %eax	# Move 5,R5
mov %eax, -20(%ebp)

mov $3, %eax	# Move 3,R6
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Sub R6,R5
Sub -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R7
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Sub R7,R6
Sub -28(%ebp), %eax
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JL _true_label18

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label18

_true_label18:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label18:

_end_label15:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label14

mov -40(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label20

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label20:

mov -24(%ebp), %eax	# Mod R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JNZ _true_label19

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label19

_true_label19:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label19:

_end_label14:

mov -20(%ebp), %eax	# And R4,R5
And -16(%ebp), %eax
mov %eax, -20(%ebp)

_end_label7:

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JZ _end_label6

mov $3, %eax	# Move 3,R5
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov $2, %eax	# Move 2,R7
mov %eax, -28(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R8
mov %eax, -32(%ebp)

mov -28(%ebp), %eax	# Mul R8,R7
mov -32(%ebp), %ebx
mul %ebx
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Add R7,R6
Add -28(%ebp), %eax
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JG _true_label23

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label23

_true_label23:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label23:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label22

mov $5, %eax	# Move 5,R5
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R7
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Sub R7,R6
Sub -28(%ebp), %eax
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JL _true_label24

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label24

_true_label24:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label24:

_end_label22:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label21

mov -44(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JZ _true_label25

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label25

_true_label25:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label25:

_end_label21:

mov -20(%ebp), %eax	# And R4,R5
And -16(%ebp), %eax
mov %eax, -20(%ebp)

_end_label6:

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JZ _end_label5

mov -40(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JZ _true_label28

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label28

_true_label28:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label28:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label27

mov $1, %eax	# Move 1,R6
mov %eax, -24(%ebp)

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Sub R6,R5
Sub -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JL _true_label29

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label29

_true_label29:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label29:

_end_label27:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label26

mov -44(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JNZ _true_label30

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label30

_true_label30:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label30:

_end_label26:

mov -20(%ebp), %eax	# And R4,R5
And -16(%ebp), %eax
mov %eax, -20(%ebp)

_end_label5:

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JZ _end_label4

mov $3, %eax	# Move 3,R5
mov %eax, -20(%ebp)

mov $1, %eax	# Move 1,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Sub R7,R6
Sub -28(%ebp), %eax
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JG _true_label33

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label33

_true_label33:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label33:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label32

mov $5, %eax	# Move 5,R5
mov %eax, -20(%ebp)

mov $8, %eax	# Move 8,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare 0,R6
cmp $0, %eax

JNZ _end_label35

mov $str0, %eax	# Move str0,R5
mov %eax, -20(%ebp)

# Library __print(R5),Rdummy
mov -20(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label35:

mov -20(%ebp), %eax	# Div R6,R5
mov -24(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -20(%ebp)

mov $1, %eax	# Move 1,R6
mov %eax, -24(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R7
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Sub R7,R6
Sub -28(%ebp), %eax
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JL _true_label34

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label34

_true_label34:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label34:

_end_label32:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label31

mov -44(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Sub R6,R5
Sub -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label37

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label37:

mov -24(%ebp), %eax	# Mod R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %edx, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JZ _true_label36

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label36

_true_label36:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label36:

_end_label31:

mov -20(%ebp), %eax	# And R4,R5
And -16(%ebp), %eax
mov %eax, -20(%ebp)

_end_label4:

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JZ _end_label3

mov $25, %eax	# Move 25,R5
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Mul R7,R6
mov -28(%ebp), %ebx
mul %ebx
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JG _true_label40

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label40

_true_label40:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label40:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label39

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Sub R6,R5
Sub -24(%ebp), %eax
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -20(%ebp), %eax	# Mul R6,R5
mov -24(%ebp), %ebx
mul %ebx
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R7
mov %eax, -28(%ebp)

mov $0, %eax	# Move 0,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Sub R7,R6
Sub -28(%ebp), %eax
mov %eax, -24(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R7
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Mul R7,R6
mov -28(%ebp), %ebx
mul %ebx
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JL _true_label41

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label41

_true_label41:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label41:

_end_label39:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label38

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label43

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label43:

mov -24(%ebp), %eax	# Div R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JNZ _true_label42

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label42

_true_label42:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label42:

_end_label38:

mov -20(%ebp), %eax	# And R4,R5
And -16(%ebp), %eax
mov %eax, -20(%ebp)

_end_label3:

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JZ _end_label2

mov $2, %eax	# Move 2,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label47

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label47:

mov -24(%ebp), %eax	# Div R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label48

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label48:

mov -24(%ebp), %eax	# Div R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JG _true_label46

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label46

_true_label46:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label46:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label45

mov $3, %eax	# Move 3,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label50

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label50:

mov -24(%ebp), %eax	# Div R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label51

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label51:

mov -24(%ebp), %eax	# Div R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JL _true_label49

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label49

_true_label49:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label49:

_end_label45:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label44

mov -40(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R8
mov %eax, -32(%ebp)

mov -32(%ebp), %eax	# Compare 0,R8
cmp $0, %eax

JNZ _end_label53

mov $str0, %eax	# Move str0,R7
mov %eax, -28(%ebp)

# Library __print(R7),Rdummy
mov -28(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label53:

mov -28(%ebp), %eax	# Div R8,R7
mov -32(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -28(%ebp)

mov -28(%ebp), %eax	# Compare 0,R7
cmp $0, %eax

JNZ _end_label54

mov $str0, %eax	# Move str0,R6
mov %eax, -24(%ebp)

# Library __print(R6),Rdummy
mov -24(%ebp), %eax
push %eax
call __print
add $4, %esp

JMP _PROGRAM_END

_end_label54:

mov -24(%ebp), %eax	# Div R7,R6
mov -28(%ebp), %ebx
mov $0, %edx
div %ebx
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JL _true_label52

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label52

_true_label52:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label52:

_end_label44:

mov -20(%ebp), %eax	# And R4,R5
And -16(%ebp), %eax
mov %eax, -20(%ebp)

_end_label2:

mov -16(%ebp), %eax	# Compare 0,R4
cmp $0, %eax

JZ _end_label1

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JZ _true_label57

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label57

_true_label57:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label57:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label56

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JZ _true_label58

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label58

_true_label58:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label58:

_end_label56:

mov -20(%ebp), %eax	# Compare 1,R5
cmp $1, %eax

JZ _end_label55

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R6
mov %eax, -24(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R7
mov %eax, -28(%ebp)

mov -24(%ebp), %eax	# Sub R7,R6
Sub -28(%ebp), %eax
mov %eax, -24(%ebp)

mov -24(%ebp), %eax	# Compare R5,R6
cmp -20(%ebp), %eax

JG _true_label59

mov $0, %eax	# Move 0,R5
mov %eax, -20(%ebp)

JMP _end_label59

_true_label59:

mov $1, %eax	# Move 1,R5
mov %eax, -20(%ebp)

_end_label59:

_end_label55:

mov -20(%ebp), %eax	# And R4,R5
And -16(%ebp), %eax
mov %eax, -20(%ebp)

_end_label1:

mov -16(%ebp), %eax	# Move R4,var3_p
mov %eax, -36(%ebp)

mov -36(%ebp), %eax	# Move var3_p,R3
mov %eax, -12(%ebp)

mov -36(%ebp), %eax	# Move var3_p,R3
mov %eax, -12(%ebp)

# Library __printb(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __printb
add $4, %esp

mov $str1, %eax	# Move str1,R3
mov %eax, -12(%ebp)

# Library __println(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __println
add $4, %esp

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JL _true_label61

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label61

_true_label61:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label61:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JZ _end_label60

mov $24, %eax	# Move 24,R4
mov %eax, -16(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JG _true_label62

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label62

_true_label62:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label62:

_end_label60:

mov -16(%ebp), %eax	# Move R4,var3_p
mov %eax, -36(%ebp)

mov -36(%ebp), %eax	# Move var3_p,R3
mov %eax, -12(%ebp)

mov -36(%ebp), %eax	# Move var3_p,R3
mov %eax, -12(%ebp)

# Library __printb(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __printb
add $4, %esp

mov $str1, %eax	# Move str1,R3
mov %eax, -12(%ebp)

# Library __println(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __println
add $4, %esp

mov $3, %eax	# Move 3,R4
mov %eax, -16(%ebp)

mov -40(%ebp), %eax	# Move var1_x,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JG _true_label64

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label64

_true_label64:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label64:

mov -16(%ebp), %eax	# Compare 1,R4
cmp $1, %eax

JZ _end_label63

mov $24, %eax	# Move 24,R4
mov %eax, -16(%ebp)

mov -44(%ebp), %eax	# Move var2_y,R5
mov %eax, -20(%ebp)

mov -20(%ebp), %eax	# Compare R4,R5
cmp -16(%ebp), %eax

JG _true_label65

mov $0, %eax	# Move 0,R4
mov %eax, -16(%ebp)

JMP _end_label65

_true_label65:

mov $1, %eax	# Move 1,R4
mov %eax, -16(%ebp)

_end_label65:

_end_label63:

mov -16(%ebp), %eax	# Move R4,var3_p
mov %eax, -36(%ebp)

mov -36(%ebp), %eax	# Move var3_p,R3
mov %eax, -12(%ebp)

mov -36(%ebp), %eax	# Move var3_p,R3
mov %eax, -12(%ebp)

# Library __printb(R3),Rdummy
mov -12(%ebp), %eax
push %eax
call __printb
add $4, %esp

mov $str1, %eax	# Move str1,R3
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

