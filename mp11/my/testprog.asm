;---------------------------------------------------------------------------
; 
; WARNING!  This code was produced automatically using the ECE190 C compiler
; (MP5 in the Spring 2008 semester).  If you choose to modify it by hand,
; be aware that you WILL LOSE such changes when the code is recompiled.
;
; Student-generated code is marked as "STUDENT CODE."
;
;---------------------------------------------------------------------------

	.ORIG x3000

BOGUSFP
	LD	R4,GDPTR
	LEA	R5,BOGUSFP
	LD	R6,SPTR
	JSR	MAIN
	LEA	R0,OUTPREFIX
	PUTS
	LDR	R0,R6,#0
	ADD	R6,R6,#1
	LD	R1,PNPTR
	JSRR	R1
	AND	R0,R0,#0
	ADD	R0,R0,#10
	OUT
	HALT

GDPTR	.FILL GLOBDATA
SPTR	.FILL STACK
PNPTR	.FILL PRINT_NUM
OUTPREFIX	.STRINGZ "main returned "

MAIN	ADD	R6,R6,#-3
	STR	R5,R6,#0
	STR	R7,R6,#1
	ADD	R5,R6,#-1

;---------------------------------------------------------------------------
; local variable space allocation
;---------------------------------------------------------------------------

	ADD R6,R6,#-7

;---------------------------------------------------------------------------
; R0...R3 are callee-saved
;---------------------------------------------------------------------------

	ADD	R6,R6,#-4
	STR	R0,R6,#0	; save R0...R3
	STR	R1,R6,#1
	STR	R2,R6,#2
	STR	R3,R6,#3
	
;---------------------------------------------------------------------------
; STUDENT CODE STARTS HERE (after the symbol table)
;---------------------------------------------------------------------------

;                piles[3]        global          offset=+0
;                 seed           local to main   offset=+0
;                    i           local to main   offset=-1
;                    j           local to main   offset=-2
;                 done           local to main   offset=-3
;            choice_ok           local to main   offset=-4
;                 pnum           local to main   offset=-5
;                  amt           local to main   offset=-6
	LEA R0,LBL4
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL5
LBL4
	.STRINGZ "Please type a number: "
LBL5
	LD R0,LBL2
	JSRR R0
	BRnzp LBL3
LBL2
	.FILL PRINTF
LBL3
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL10
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL11
LBL10
	.FILL #1
LBL11
	ADD R0,R5,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL14
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL15
LBL14
	.STRINGZ "%d"
LBL15
	LD R0,LBL12
	JSRR R0
	BRnzp LBL13
LBL12
	.FILL SCANF
LBL13
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRz LBL9
	ADD R2,R2,#1
LBL9
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL6
	LD R3,LBL16
	JMP R3
LBL16
	.FILL LBL7
LBL17
LBL6
	LEA R0,LBL20
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL21
LBL20
	.STRINGZ "That's not a number!\n"
LBL21
	LD R0,LBL18
	JSRR R0
	BRnzp LBL19
LBL18
	.FILL PRINTF
LBL19
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL24
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL25
LBL24
	.FILL #3
LBL25
	LDR R0,R6,#0
	ADD R6,R6,#1
	STR R0,R5,#3
	LD R3,LBL22
	JMP R3
LBL22
	.FILL LBL1
LBL23
	LD R3,LBL26
	JMP R3
LBL26
	.FILL LBL8
LBL27
LBL7
LBL8
	LDR R0,R5,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL28
	JSRR R0
	BRnzp LBL29
LBL28
	.FILL SRAND
LBL29
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL30
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL31
LBL30
	.FILL #0
LBL31
	ADD R0,R5,#-1
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL32
	LD R0,LBL35
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL36
LBL35
	.FILL #3
LBL36
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnz LBL34
	ADD R2,R2,#1
LBL34
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL38
	LD R3,LBL37
	JMP R3
LBL37
	.FILL LBL33
LBL38
	LD R0,LBL41
	JSRR R0
	BRnzp LBL42
LBL41
	.FILL RAND
LBL42
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL43
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL44
LBL43
	.FILL #10
LBL44
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL39
	JSRR R3
	BRnzp LBL40
LBL39
	.FILL MODULUS
LBL40
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL45
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL46
LBL45
	.FILL #5
LBL46
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R0,R1,R0
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-1
	LDR R1,R6,#0
	ADD R1,R1,#1
	STR R1,R0,#0
	ADD R6,R6,#1
	;  LBL48
	LD R3,LBL47
	JMP R3
LBL47
	.FILL LBL32
LBL48
LBL33
	LD R0,LBL49
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL50
LBL49
	.FILL #0
LBL50
	ADD R0,R5,#-3
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL51
	LD R0,LBL54
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL55
LBL54
	.FILL #0
LBL55
	LDR R0,R5,#-3
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL53
	ADD R2,R2,#1
LBL53
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL57
	LD R3,LBL56
	JMP R3
LBL56
	.FILL LBL52
LBL57
	LD R0,LBL58
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL59
LBL58
	.FILL #0
LBL59
	ADD R0,R5,#-1
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL60
	LD R0,LBL63
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL64
LBL63
	.FILL #3
LBL64
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnz LBL62
	ADD R2,R2,#1
LBL62
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL66
	LD R3,LBL65
	JMP R3
LBL65
	.FILL LBL61
LBL66
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL69
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL70
LBL69
	.FILL #1
LBL70
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL71
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL72
LBL71
	.STRINGZ "Pile %d: "
LBL72
	LD R0,LBL67
	JSRR R0
	BRnzp LBL68
LBL67
	.FILL PRINTF
LBL68
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL73
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL74
LBL73
	.FILL #0
LBL74
	ADD R0,R5,#-2
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL75
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-2
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnz LBL77
	ADD R2,R2,#1
LBL77
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL79
	LD R3,LBL78
	JMP R3
LBL78
	.FILL LBL76
LBL79
	LEA R0,LBL82
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL83
LBL82
	.STRINGZ "*"
LBL83
	LD R0,LBL80
	JSRR R0
	BRnzp LBL81
LBL80
	.FILL PRINTF
LBL81
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LDR R0,R5,#-2
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-2
	LDR R1,R6,#0
	ADD R1,R1,#1
	STR R1,R0,#0
	ADD R6,R6,#1
	;  LBL85
	LD R3,LBL84
	JMP R3
LBL84
	.FILL LBL75
LBL85
LBL76
	LEA R0,LBL88
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL89
LBL88
	.STRINGZ "\n"
LBL89
	LD R0,LBL86
	JSRR R0
	BRnzp LBL87
LBL86
	.FILL PRINTF
LBL87
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-1
	LDR R1,R6,#0
	ADD R1,R1,#1
	STR R1,R0,#0
	ADD R6,R6,#1
	;  LBL91
	LD R3,LBL90
	JMP R3
LBL90
	.FILL LBL60
LBL91
LBL61
	LD R0,LBL92
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL93
LBL92
	.FILL #0
LBL93
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL94
	LD R0,LBL97
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL98
LBL97
	.FILL #0
LBL98
	LDR R0,R5,#-4
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL96
	ADD R2,R2,#1
LBL96
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL100
	LD R3,LBL99
	JMP R3
LBL99
	.FILL LBL95
LBL100
	LEA R0,LBL103
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL104
LBL103
	.STRINGZ "From which pile will you take sticks? "
LBL104
	LD R0,LBL101
	JSRR R0
	BRnzp LBL102
LBL101
	.FILL PRINTF
LBL102
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL121
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL122
LBL121
	.FILL #1
LBL122
	ADD R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL125
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL126
LBL125
	.STRINGZ "%d"
LBL126
	LD R0,LBL123
	JSRR R0
	BRnzp LBL124
LBL123
	.FILL SCANF
LBL124
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRz LBL120
	ADD R2,R2,#1
LBL120
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL128
	LD R3,LBL127
	JMP R3
LBL127
	.FILL LBL118
LBL128
	LD R0,LBL130
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL131
LBL130
	.FILL #1
LBL131
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnz LBL129
	ADD R2,R2,#1
LBL129
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL133
	LD R3,LBL132
	JMP R3
LBL132
	.FILL LBL118
LBL133
	;  LBL135
	LD R3,LBL134
	JMP R3
LBL134
	.FILL LBL119
LBL135
LBL118
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL116
LBL119
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL116
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL137
	LD R3,LBL136
	JMP R3
LBL136
	.FILL LBL114
LBL137
	LD R0,LBL139
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL140
LBL139
	.FILL #3
LBL140
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRzp LBL138
	ADD R2,R2,#1
LBL138
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL142
	LD R3,LBL141
	JMP R3
LBL141
	.FILL LBL114
LBL142
	;  LBL144
	LD R3,LBL143
	JMP R3
LBL143
	.FILL LBL115
LBL144
LBL114
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL112
LBL115
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL112
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL146
	LD R3,LBL145
	JMP R3
LBL145
	.FILL LBL110
LBL146
	LD R0,LBL148
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL149
LBL148
	.FILL #0
LBL149
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL150
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL151
LBL150
	.FILL #1
LBL151
	LDR R0,R6,#0
	ADD R6,R6,#1
	LDR R1,R6,#0
	ADD R6,R6,#1
	NOT R0,R0
	ADD R0,R0,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL147
	ADD R2,R2,#1
LBL147
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL153
	LD R3,LBL152
	JMP R3
LBL152
	.FILL LBL110
LBL153
	;  LBL155
	LD R3,LBL154
	JMP R3
LBL154
	.FILL LBL111
LBL155
LBL110
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL108
LBL111
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL108
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL105
	LD R3,LBL156
	JMP R3
LBL156
	.FILL LBL106
LBL157
LBL105
	LEA R0,LBL160
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL161
LBL160
	.STRINGZ "That's not a good choice.\n"
LBL161
	LD R0,LBL158
	JSRR R0
	BRnzp LBL159
LBL158
	.FILL PRINTF
LBL159
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL162
	JMP R3
LBL162
	.FILL LBL107
LBL163
LBL106
	LD R0,LBL164
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL165
LBL164
	.FILL #1
LBL165
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL166
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL167
LBL166
	.FILL #1
LBL167
	LDR R0,R6,#0
	ADD R6,R6,#1
	LDR R1,R6,#0
	ADD R6,R6,#1
	NOT R0,R0
	ADD R0,R0,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-5
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL107
	;  LBL169
	LD R3,LBL168
	JMP R3
LBL168
	.FILL LBL94
LBL169
LBL95
	LD R0,LBL170
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL171
LBL170
	.FILL #0
LBL171
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL172
	LD R0,LBL175
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL176
LBL175
	.FILL #0
LBL176
	LDR R0,R5,#-4
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL174
	ADD R2,R2,#1
LBL174
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL178
	LD R3,LBL177
	JMP R3
LBL177
	.FILL LBL173
LBL178
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL181
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL182
LBL181
	.FILL #1
LBL182
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL183
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL184
LBL183
	.STRINGZ "How many sticks will you take from pile %d? "
LBL184
	LD R0,LBL179
	JSRR R0
	BRnzp LBL180
LBL179
	.FILL PRINTF
LBL180
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL197
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL198
LBL197
	.FILL #1
LBL198
	ADD R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL201
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL202
LBL201
	.STRINGZ "%d"
LBL202
	LD R0,LBL199
	JSRR R0
	BRnzp LBL200
LBL199
	.FILL SCANF
LBL200
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRz LBL196
	ADD R2,R2,#1
LBL196
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL204
	LD R3,LBL203
	JMP R3
LBL203
	.FILL LBL194
LBL204
	LD R0,LBL206
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL207
LBL206
	.FILL #0
LBL207
	LDR R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRn LBL205
	ADD R2,R2,#1
LBL205
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL209
	LD R3,LBL208
	JMP R3
LBL208
	.FILL LBL194
LBL209
	;  LBL211
	LD R3,LBL210
	JMP R3
LBL210
	.FILL LBL195
LBL211
LBL194
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL192
LBL195
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL192
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL213
	LD R3,LBL212
	JMP R3
LBL212
	.FILL LBL190
LBL213
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRzp LBL214
	ADD R2,R2,#1
LBL214
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL216
	LD R3,LBL215
	JMP R3
LBL215
	.FILL LBL190
LBL216
	;  LBL218
	LD R3,LBL217
	JMP R3
LBL217
	.FILL LBL191
LBL218
LBL190
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL188
LBL191
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL188
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL185
	LD R3,LBL219
	JMP R3
LBL219
	.FILL LBL186
LBL220
LBL185
	LEA R0,LBL223
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL224
LBL223
	.STRINGZ "That's not a good choice.\n"
LBL224
	LD R0,LBL221
	JSRR R0
	BRnzp LBL222
LBL221
	.FILL PRINTF
LBL222
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL225
	JMP R3
LBL225
	.FILL LBL187
LBL226
LBL186
	LD R0,LBL227
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL228
LBL227
	.FILL #1
LBL228
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL187
	;  LBL230
	LD R3,LBL229
	JMP R3
LBL229
	.FILL LBL172
LBL230
LBL173
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	LDR R1,R6,#0
	ADD R6,R6,#1
	NOT R0,R0
	ADD R0,R0,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R0,R1,R0
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LD R0,LBL243
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL244
LBL243
	.FILL #0
LBL244
	LD R0,LBL245
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL246
LBL245
	.FILL #0
LBL246
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL242
	ADD R2,R2,#1
LBL242
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL248
	LD R3,LBL247
	JMP R3
LBL247
	.FILL LBL241
LBL248
	LD R0,LBL250
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL251
LBL250
	.FILL #0
LBL251
	LD R0,LBL252
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL253
LBL252
	.FILL #1
LBL253
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL249
	ADD R2,R2,#1
LBL249
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL255
	LD R3,LBL254
	JMP R3
LBL254
	.FILL LBL241
LBL255
	;  LBL257
	LD R3,LBL256
	JMP R3
LBL256
	.FILL LBL240
LBL257
LBL240
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL238
LBL241
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL238
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL259
	LD R3,LBL258
	JMP R3
LBL258
	.FILL LBL237
LBL259
	LD R0,LBL261
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL262
LBL261
	.FILL #0
LBL262
	LD R0,LBL263
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL264
LBL263
	.FILL #2
LBL264
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL260
	ADD R2,R2,#1
LBL260
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL266
	LD R3,LBL265
	JMP R3
LBL265
	.FILL LBL237
LBL266
	;  LBL268
	LD R3,LBL267
	JMP R3
LBL267
	.FILL LBL236
LBL268
LBL236
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL234
LBL237
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL234
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL231
	LD R3,LBL269
	JMP R3
LBL269
	.FILL LBL232
LBL270
LBL231
	LEA R0,LBL273
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL274
LBL273
	.STRINGZ "You win!\n"
LBL274
	LD R0,LBL271
	JSRR R0
	BRnzp LBL272
LBL271
	.FILL PRINTF
LBL272
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL275
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL276
LBL275
	.FILL #1
LBL276
	ADD R0,R5,#-3
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LD R3,LBL277
	JMP R3
LBL277
	.FILL LBL233
LBL278
LBL232
	LD R0,LBL281
	JSRR R0
	BRnzp LBL282
LBL281
	.FILL RAND
LBL282
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL283
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL284
LBL283
	.FILL #3
LBL284
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL279
	JSRR R3
	BRnzp LBL280
LBL279
	.FILL MODULUS
LBL280
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-5
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL285
	LD R0,LBL288
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL289
LBL288
	.FILL #0
LBL289
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL287
	ADD R2,R2,#1
LBL287
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL291
	LD R3,LBL290
	JMP R3
LBL290
	.FILL LBL286
LBL291
	LD R0,LBL294
	JSRR R0
	BRnzp LBL295
LBL294
	.FILL RAND
LBL295
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL296
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL297
LBL296
	.FILL #3
LBL297
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL292
	JSRR R3
	BRnzp LBL293
LBL292
	.FILL MODULUS
LBL293
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-5
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	;  LBL299
	LD R3,LBL298
	JMP R3
LBL298
	.FILL LBL285
LBL299
LBL286
	LD R0,LBL302
	JSRR R0
	BRnzp LBL303
LBL302
	.FILL RAND
LBL303
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL300
	JSRR R3
	BRnzp LBL301
LBL300
	.FILL MODULUS
LBL301
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL304
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL305
LBL304
	.FILL #1
LBL305
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-6
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL308
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL309
LBL308
	.FILL #1
LBL309
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL310
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL311
LBL310
	.STRINGZ "I take %d from pile %d\n"
LBL311
	LD R0,LBL306
	JSRR R0
	BRnzp LBL307
LBL306
	.FILL PRINTF
LBL307
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#3
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	LDR R1,R6,#0
	ADD R6,R6,#1
	NOT R0,R0
	ADD R0,R0,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R0,R1,R0
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LD R0,LBL324
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL325
LBL324
	.FILL #0
LBL325
	LD R0,LBL326
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL327
LBL326
	.FILL #0
LBL327
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL323
	ADD R2,R2,#1
LBL323
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL329
	LD R3,LBL328
	JMP R3
LBL328
	.FILL LBL322
LBL329
	LD R0,LBL331
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL332
LBL331
	.FILL #0
LBL332
	LD R0,LBL333
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL334
LBL333
	.FILL #1
LBL334
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL330
	ADD R2,R2,#1
LBL330
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL336
	LD R3,LBL335
	JMP R3
LBL335
	.FILL LBL322
LBL336
	;  LBL338
	LD R3,LBL337
	JMP R3
LBL337
	.FILL LBL321
LBL338
LBL321
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL319
LBL322
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL319
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL340
	LD R3,LBL339
	JMP R3
LBL339
	.FILL LBL318
LBL340
	LD R0,LBL342
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL343
LBL342
	.FILL #0
LBL343
	LD R0,LBL344
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL345
LBL344
	.FILL #2
LBL345
	LDR R1,R6,#0
	ADD R6,R6,#1
	ADD R0,R4,#0
	ADD R1,R1,R0
	LDR R0,R1,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	LDR R0,R6,#1
	ADD R6,R6,#2
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL341
	ADD R2,R2,#1
LBL341
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL347
	LD R3,LBL346
	JMP R3
LBL346
	.FILL LBL318
LBL347
	;  LBL349
	LD R3,LBL348
	JMP R3
LBL348
	.FILL LBL317
LBL349
LBL317
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL315
LBL318
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL315
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL312
	LD R3,LBL350
	JMP R3
LBL350
	.FILL LBL313
LBL351
LBL312
	LEA R0,LBL354
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL355
LBL354
	.STRINGZ "I win!\n"
LBL355
	LD R0,LBL352
	JSRR R0
	BRnzp LBL353
LBL352
	.FILL PRINTF
LBL353
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL356
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL357
LBL356
	.FILL #1
LBL357
	ADD R0,R5,#-3
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LD R3,LBL358
	JMP R3
LBL358
	.FILL LBL314
LBL359
LBL313
LBL314
LBL233
	;  LBL361
	LD R3,LBL360
	JMP R3
LBL360
	.FILL LBL51
LBL361
LBL52
	LD R0,LBL364
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL365
LBL364
	.FILL #0
LBL365
	LDR R0,R6,#0
	ADD R6,R6,#1
	STR R0,R5,#3
	LD R3,LBL362
	JMP R3
LBL362
	.FILL LBL1
LBL363
LBL1

;---------------------------------------------------------------------------
; STUDENT CODE ENDS HERE
;---------------------------------------------------------------------------

	LDR	R0,R6,#0	; restore R0...R3
	LDR	R1,R6,#1
	LDR	R2,R6,#2
	LDR	R3,R6,#3

	ADD	R6,R5,#1	; pop off local variables
	LDR	R5,R6,#0
	LDR	R7,R6,#1
	ADD	R6,R6,#2	; leave return value on stack
	RET
	
;---------------------------------------------------------------------------
; C library routines
;---------------------------------------------------------------------------

; assembly routines in this library
;   MULTIPLY (R0 <- R0 * R1)
;   DIVIDE   (R0 <- R0 / R1, rounded toward 0)
;   MODULUS  (R0 <- R0 MOD R1, using C's definition)

; routines with C interfaces in this library
;   int PRINTF (const char* fmt, ...);
;   int SCANF (const char* fmt, ...);
;   void SRAND (int new_seed);
;   int RAND ();
; NOTES: 
;    - ALL C ROUTINES LEAVE A RETURN VALUE LOCATION ON THE STACK, EVEN
;      IF THEY PRODUCE NO RETURN VALUE!
;    - PRINTF and SCANF only handle %d, %%, \n, \\, and normal characters
;

; INTERNAL routines (you should not call them)
;   LOG_RIGHT_SHIFT
;   PRINT_NUM
;   LOAD_FORMAT
;

;---------------------------------------------------------------------------

; MULTIPLY -- calculate R0 * R1
;     INPUTS -- R0 and R1
;     OUTPUTS -- R0 is the product
;     SIDE EFFECTS -- uses stack to save registers
;     NOTE: the calling convention here is NOT for use directly by C
;
MULTIPLY
	ADD R6,R6,#-3	; save R1, R2, and R3
	STR R1,R6,#0
	STR R2,R6,#1
	STR R3,R6,#2

	AND R2,R2,#0	; number of negative operands

	ADD R1,R1,#0	; set R1 to its absolute value
	BRzp MULT_R1_NON_NEG
	NOT R1,R1
	ADD R1,R1,#1
	ADD R2,R2,#1
MULT_R1_NON_NEG

	AND R3,R3,#0
MULT_LOOP
	ADD R1,R1,#0
	BRz MULT_FINISH
	ADD R3,R3,R0
	ADD R1,R1,#-1
	BRnzp MULT_LOOP

MULT_FINISH
	ADD R0,R3,#0	; move result into R0

	AND R2,R2,#1	; negate answer?
	BRz MULT_DONE
	NOT R0,R0
	ADD R0,R0,#1

MULT_DONE
	LDR R1,R6,#0	; restore R1, R2, and R3
	LDR R2,R6,#1
	LDR R3,R6,#2
	ADD R6,R6,#3
	RET


; DIVIDE -- calculate R0 / R1 (rounded toward zero)
;     INPUTS -- R0 and R1
;     OUTPUTS -- R0 is the quotient
;     SIDE EFFECTS -- uses stack to save registers; may print divide by
;                     zero error
;     NOTE: the calling convention here is NOT for use directly by C
;
DIVIDE	ADD R6,R6,#-4	; save R1, R2, R3, and R7
	STR R1,R6,#0
	STR R2,R6,#1
	STR R3,R6,#2
	STR R7,R6,#3

	AND R2,R2,#0	; number of negative operands
	ADD R2,R2,#1

	ADD R1,R1,#0	; set R1 to its negative absolute value
	BRn DIV_R1_NEG
	BRp DIV_R1_POS
	LEA R0,MSG_DIV
	PUTS
	AND R0,R0,#0
	BRnzp DIV_DONE
DIV_R1_POS
	NOT R1,R1
	ADD R1,R1,#1
	ADD R2,R2,#-1
DIV_R1_NEG

	ADD R0,R0,#0	; set R0 to its absolute value
	BRzp DIV_R0_NON_NEG
	NOT R0,R0
	ADD R0,R0,#1
	ADD R2,R2,#1
DIV_R0_NON_NEG

	AND R3,R3,#0
DIV_LOOP
	ADD R0,R0,R1
	BRn DIV_FINISH
	ADD R3,R3,#1
	BRnzp DIV_LOOP
DIV_FINISH
	ADD R0,R3,#0	; move result into R0

	AND R2,R2,#1	; negate answer?
	BRz DIV_DONE
	NOT R0,R0
	ADD R0,R0,#1

DIV_DONE
	LDR R1,R6,#0	; restore R1, R2, R3, and R7
	LDR R2,R6,#1
	LDR R3,R6,#2
	LDR R7,R6,#3
	ADD R6,R6,#4
	RET

MSG_DIV	.STRINGZ "\nDIVIDE BY ZERO\n"



; MODULUS -- calculate R0 MOD R1 (defined in C as R0 - (R0 / R1) * R1)
;     INPUTS -- R0 and R1
;     OUTPUTS -- R0 is the modulus
;     SIDE EFFECTS -- uses stack to save registers; may print divide by
;                     zero error
;     NOTE: the calling convention here is NOT for use directly by C
;
MODULUS	ADD R6,R6,#-3	; save R0, R1, and R7
	STR R0,R6,#0
	STR R1,R6,#1
	STR R7,R6,#2

	JSR DIVIDE	; R0 = R0 / R1
	JSR MULTIPLY	; R0 = (R0 / R1) * R1
	NOT R1,R0	; negate it
	ADD R1,R1,#1
	LDR R0,R6,#0	; add to original R0
	ADD R0,R0,R1

	LDR R1,R6,#1	; restore R1 and R7
	LDR R7,R6,#2
	ADD R6,R6,#3
	RET


; SRAND -- set random number generation seed
;     INPUTS -- new seed (on top of stack)
;     OUTPUTS -- one (meaningless) location left on top of stack
;     SIDE EFFECTS -- changes random seed
;     NOTE: call as a C function
;
SRAND	ADD R6,R6,#-1		; save R0
	STR R0,R6,#0
	LDR R0,R6,#1
	ST R0,RAND_SEED
	LDR R0,R6,#0		; restore R0
	RET


; LOG_RIGHT_SHIFT -- logically shift R0 right by one bit (MSB <- 0)
;     INPUTS -- R0
;     OUTPUTS -- R0 shifted right by a bit
;     SIDE EFFECTS -- uses stack to save registers
;     NOTE: the calling convention here is NOT for use directly by C
;
LOG_RIGHT_SHIFT
	ADD R6,R6,#-1		; save R1
	STR R1,R6,#0

	AND R0,R0,xFFFE		; set low bit to 0 (will become MSB)

	AND R1,R1,#0		; loop 15 times...
	ADD R1,R1,#15

LRSHFT_LOOP
	ADD R0,R0,#0		; rotate left (copy high bit to low bit)
	BRn LOW_BIT_IS_1
	ADD R0,R0,R0
	BRnzp LRSHFT_NEXT
LOW_BIT_IS_1
	ADD R0,R0,R0
	ADD R0,R0,1

LRSHFT_NEXT
	ADD R1,R1,#-1
	BRp LRSHFT_LOOP

	LDR R1,R6,#0		; restore R1
	ADD R6,R6,#1
	RET


; RAND -- generate random number using the function
;             NEW = (27193 * OLD) + 35993   MOD 65536
;	  the low bit is right-shifted out before returning, since
;         it is not random (the rest are not too bad, at least by 
;         separation of order 2 in Knuth's methods...)
;     INPUTS -- none
;     OUTPUTS -- random value left on top of stack (return value)
;     SIDE EFFECTS -- changes random seed
;     NOTE: call as a C function
;
RAND	ADD R6,R6,#-3		; save R0, R1, and R7
	STR R0,R6,#0
	STR R1,R6,#1
	STR R7,R6,#2
	LD R0,RAND_SEED
	ADD R1,R0,R0		; x 0002
	ADD R1,R1,R0		; x 0003
	ADD R1,R1,R1		; x 0006
	ADD R1,R1,R1		; x 000C
	ADD R1,R1,R0		; x 000D
	ADD R1,R1,R1		; x 001A
	ADD R1,R1,R1		; x 0034
	ADD R1,R1,R0		; x 0035
	ADD R1,R1,R1		; x 006A
	ADD R1,R1,R1		; x 00D4
	ADD R1,R1,R1		; x 01A8
	ADD R1,R1,R1		; x 0350
	ADD R1,R1,R0		; x 0351
	ADD R1,R1,R1		; x 06A2
	ADD R1,R1,R0		; x 06A3
	ADD R1,R1,R1		; x 0D46
	ADD R1,R1,R0		; x 0D47
	ADD R1,R1,R1		; x 1A8E
	ADD R1,R1,R1		; x 351C
	ADD R1,R1,R1		; x 6A38
	ADD R0,R1,R0		; x 6A39 = #27193
	LD R1,RAND_ADD
	ADD R0,R0,R1
	ST R0,RAND_SEED
	JSR LOG_RIGHT_SHIFT	; drop the low bit
	LDR R7,R6,#2		; restore R7
	STR R0,R6,#2		; save return value onto stack
	LDR R0,R6,#0		; restore R0 and R1 
	LDR R1,R6,#1
	ADD R6,R6,#2
	RET

; storage for SRAND and RAND

RAND_SEED 
	.BLKW 1
RAND_ADD
	.FILL #35993


; PRINT_NUM -- print a number in decimal to the monitor (based on code 
;              incorporated as TRAP x26 for MP2 in the Spring 2004 
;              semester of ECE190)
;     INPUTS -- R0 is the number to be printed
;     OUTPUTS -- R0 is the number of characters printed
;     SIDE EFFECTS -- none
;     NOTE: the calling convention here is NOT for use directly by C
;
; The basic strategy is to handle the sign first, then to loop over place
; values starting from 10,000 down to 10.  Place values are subtracted
; repeatedly to calculate each digit, then digits are printed, with 
; leading zeroes omitted.

; R0 is the current digit (calculated in the inner loop)
; R1 points to table of negative digit place values
; R2 holds current digit's place value, again negative
; R3 is the remaining value after removing the previous digit
; R4 is a temporary
; R5 holds the ASCII value '0'
; R6 is a marker used to avoid leading zeroes

PRINT_NUM
	ST R1,PN_SAVE_R1	; callee saves registers
	ST R2,PN_SAVE_R2
	ST R3,PN_SAVE_R3
	ST R4,PN_SAVE_R4
	ST R5,PN_SAVE_R5
	ST R6,PN_SAVE_R6
	ST R7,PN_SAVE_R7

	AND R3,R0,#0		; initialize number of characters printed
	ST R3,PN_PRINTED

	ADD R3,R0,#0		; move to R3 and check for negative value
	BRzp PN_NON_NEG
	LD R0,PN_MINUS		; if negative, print a minus sign
	OUT
	LD R0,PN_PRINTED	; add one to printed characters count
	ADD R0,R0,#1
	ST R0,PN_PRINTED
	NOT R3,R3		; and replace R0 with its absolute value
	ADD R3,R3,#1		; (-32768 will be handled correctly, too)
PN_NON_NEG
	
	LEA R1,PN_SUB		; initialize pointer to place value table
	LD R5,PN_ASC_ZERO	; initialize register with ASCII '0'
	AND R6,R6,#0		; skip leading zeroes
PN_LOOP
	LDR R2,R1,#0		; load digit place value from table
	BRz PN_LAST_DIGIT	; end of table?
	AND R0,R0,#0		; start current digit at 0 (count ADDs)
PN_DIG_LOOP			; loop to determine digit value
	ADD R4,R3,R2		; subtract place value once
	BRn PN_DIG_DONE		; done?
	ADD R3,R4,#0		; no, so copy to remaining value
	ADD R0,R0,#1		;   and increment digit
	BRnzp PN_DIG_LOOP
PN_DIG_DONE
	ADD R4,R0,R6		; do not print leading zeroes
	BRz PN_NO_PRINT
	ADD R0,R0,R5		; print current digit
	OUT
	LD R0,PN_PRINTED	; add one to printed characters count
	ADD R0,R0,#1
	ST R0,PN_PRINTED
	ADD R6,R6,#1		; always print subsequent digits, even zeroes
PN_NO_PRINT
	ADD R1,R1,#1		; point to next place value
	BRnzp PN_LOOP		; loop back for next digit
PN_LAST_DIGIT
	ADD R0,R3,R5		; always print last digit
	OUT
	LD R0,PN_PRINTED	; add one to printed characters count
	ADD R0,R0,#1

	LD R1,PN_SAVE_R1	; restore original register values
	LD R2,PN_SAVE_R2
	LD R3,PN_SAVE_R3
	LD R4,PN_SAVE_R4
	LD R5,PN_SAVE_R5
	LD R6,PN_SAVE_R6
	LD R7,PN_SAVE_R7
	RET

PN_SAVE_R1 .BLKW 1		; space for caller's register values
PN_SAVE_R2 .BLKW 1
PN_SAVE_R3 .BLKW 1
PN_SAVE_R4 .BLKW 1
PN_SAVE_R5 .BLKW 1
PN_SAVE_R6 .BLKW 1
PN_SAVE_R7 .BLKW 1
PN_PRINTED .BLKW 1

PN_SUB  .FILL #-10000		; table of place values
	.FILL #-1000
	.FILL #-100
	.FILL #-10
	.FILL #0

PN_ASC_ZERO .FILL x30		; '0'
PN_MINUS    .FILL x2D		; '-'


; LOAD_FORMAT -- load a character from a format string (for PRINTF or
;		 SCANF), translating escape sequences (-1 for %d)
;                and advancing the string pointer appropriately
;     INPUTS -- R1 is the format string pointer
;     OUTPUTS -- R0 is the next character (-1 for %d)
;                R1 is advanced either one or two locations
;     SIDE EFFECTS -- uses stack to save registers
;     NOTE: the calling convention here is NOT for use directly by C
;
LOAD_FORMAT
	ADD R6,R6,#-2	; save R2 and R3
	STR R2,R6,#0
	STR R3,R6,#1
	LDR R0,R1,#0
	LD R2,LDF_TEST_1
	ADD R3,R0,R2
	BRnp LDF_NOT_PCT
	LDR R0,R1,#1
	ADD R2,R0,R2
	BRnp LDF_CHECK_D
	ADD R1,R1,#1
LDF_BAD_PCT
	LDR R0,R1,#0
	BRnzp LDF_DONE
LDF_CHECK_D
	LD R2,LDF_TEST_2
	ADD R0,R0,R2
	BRnp LDF_BAD_PCT
	AND R0,R0,#0
	ADD R0,R0,#-1
	ADD R1,R1,#1
	BRnzp LDF_DONE
LDF_NOT_PCT
	LD R2,LDF_TEST_3
	ADD R3,R0,R2
	BRnp LDF_DONE
	LDR R0,R1,#1
	ADD R2,R0,R2
	BRnp LDF_CHECK_N
	ADD R1,R1,#1
LDF_BAD_BS
	LDR R0,R1,#0
	BRnzp LDF_DONE
LDF_CHECK_N
	LD R2,LDF_TEST_4
	ADD R0,R0,R2
	BRnp LDF_BAD_BS
	AND R0,R0,#0
	ADD R0,R0,#10
	ADD R1,R1,#1
LDF_DONE
	ADD R1,R1,#1	; default string pointer advance
	LDR R2,R6,#0	; restore R2 and R3
	LDR R3,R6,#1
	ADD R6,R6,#2
	RET

LDF_TEST_1 	.FILL xFFDB	; -'%'
LDF_TEST_2	.FILL xFF9C	; -'d'
LDF_TEST_3	.FILL xFFA4	; -'\\'
LDF_TEST_4	.FILL xFF92	; -'n'


; PRINTF -- print formatted data
;     INPUTS -- format string followed by arguments
;     OUTPUTS -- number of characters printed left on top of stack 
;                (return value)
;     SIDE EFFECTS -- uses stack to save registers
;     NOTE: call as a C function
;
; R0 holds the character to print
; R1 is the format string pointer
; R2 points to the next argument
; R3 is the number of characters printed so far
;
PRINTF	ADD R6,R6,#-5		; save R0, R1, R2, R3, and R7
	STR R0,R6,#0
	STR R1,R6,#1
	STR R2,R6,#2
	STR R3,R6,#3
	STR R7,R6,#4
	LDR R1,R6,#5
	ADD R2,R6,#6
	AND R3,R3,#0
PR_LOOP	JSR LOAD_FORMAT
	ADD R0,R0,#0
	BRz PR_DONE
	BRp PR_REG
	LDR R0,R2,#0
	ADD R2,R2,#1
	JSR PRINT_NUM
	ADD R3,R3,R0
	BRnzp PR_LOOP
PR_REG	OUT
	ADD R3,R3,#1
	BRnzp PR_LOOP
PR_DONE	LDR R7,R6,#4		; restore R7
	STR R3,R6,#4		; save return value
	LDR R0,R6,#0		; restore R0, R1, R2, and R3
	LDR R1,R6,#1
	LDR R2,R6,#2
	LDR R3,R6,#3
	ADD R6,R6,#4
	RET


; BUF_GETC -- read a character from the keyboard, with preference for
;                a character previously read but buffered (in INBUF)
;     INPUTS -- none
;     OUTPUTS -- R4 holds the character
;     SIDE EFFECTS -- uses stack to save registers
;     NOTE: the calling convention here is NOT for use directly by C
;
BUF_GETC
	ADD R6,R6,#-2
	STR R0,R6,#0
	STR R7,R6,#1
	LD R4,INBUF
	BRnp BGC_OLD
	GETC
	OUT
	ADD R4,R0,#0
	BRnzp BGC_DONE
BGC_OLD	LD R0,INBUF2
        ST R0,INBUF
	AND R0,R0,#0
	ST R0,INBUF
BGC_DONE
	LDR R0,R6,#0
	LDR R7,R6,#1
	ADD R6,R6,#2
	RET

; BUF_UNGETC -- push a character back into the input buffer
;     INPUTS -- R4 holds the character
;     OUTPUTS -- none
;     SIDE EFFECTS -- uses stack to save registers
;     NOTE: the calling convention here is NOT for use directly by C
;
BUF_UNGETC
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,INBUF
	ST R0,INBUF2
	ST R4,INBUF
	LDR R0,R6,#0
	ADD R6,R6,#1
	RET

; READ_NUM -- read a decimal number from the keyboard, starting with
;             a character previously read but buffered (in INBUF) if necessary;
;             skip white space before the first digit; terminate on non-digit
;             (after first digit); buffer character that causes termination;
;             ignore overflow
;             (this code based on readnumsub.asm code from 190 materials)
;     INPUTS -- none
;     OUTPUTS -- R4 holds the number typed in; R0 holds 1 if number was typed,
;                or 0 if not
;     SIDE EFFECTS -- uses stack to save registers
;     NOTE: the calling convention here is NOT for use directly by C
;

; R0 is used as a temporary register
; R1 holds the current value of the number being input
; R2 holds the additive inverse of ASCII '0' (0xFFD0)
; R3 is used as a temporary register
; R4 holds the value of the last key pressed
; R5 marks whether a digit has been seen (positive), just a negative sign (-),
;    or nothing has been seen (0) yet

READ_NUM
	ADD R6,R6,#-5		; save R1, R2, R3, R5, and R7
	STR R1,R6,#0
	STR R2,R6,#1
	STR R3,R6,#2
	STR R5,R6,#3
	STR R7,R6,#4
	AND R1,R1,#0		; clear the current value
	LD R2,RN_NEG_0		; put the value -x30 in R2
	AND R5,R5,#0		; no digits yet
	ST R5,RN_NEGATE
READ_LOOP
	JSR BUF_GETC
	ADD R0,R4,R2		; subtract x30 from R4 and store in R0 
	BRn RN_NON_DIG		; smaller than '0' means a non-digit
	ADD R3,R0,#-10		; check if > '9'
	BRzp RN_NON_DIG		; greater than '9' means a non-digit
	ADD R5,R4,#0		; a digit has been seen
	ADD R3,R1,R1		; sequence of adds multiplies R1 by 10
	ADD R3,R3,R3
	ADD R1,R1,R3
	ADD R1,R1,R1
	ADD R1,R1,R0		; finally, add in new digit
	BRnzp READ_LOOP		; get another digit
RN_NON_DIG
	; if we see space, tab, CR, or LF, we consume if no digits have
	; been seen; otherwise, we stop and buffer the character
	AND R0,R0,#0
	ADD R5,R5,#0
	BRp RN_GOT_NUM 
	BRz RN_NO_DIGITS

	; need to put the minus sign back, too
	JSR BUF_UNGETC
	LD R4,RN_MINUS
	BRnzp RN_SAVE_CHAR

RN_NO_DIGITS
	ADD R3,R4,#-9
	BRz READ_LOOP
	ADD R3,R4,#-10
	BRz READ_LOOP
	ADD R3,R4,#-13
	BRz READ_LOOP
	ADD R3,R4,#-16
	ADD R3,R3,#-16
	BRz READ_LOOP

	LD R3,RN_NEG_MIN
	ADD R3,R3,R4
	BRnp RN_SAVE_CHAR
	ADD R5,R5,#-1
	ST R5,RN_NEGATE
	BRnzp READ_LOOP

RN_GOT_NUM
	ADD R0,R0,#1
	LD R5,RN_NEGATE
	BRz RN_SAVE_CHAR
	NOT R1,R1
	ADD R1,R1,#1
RN_SAVE_CHAR
	JSR BUF_UNGETC
	ADD R4,R1,#0		; move R1 into R4	
	LDR R1,R6,#0		; restore R1, R2, R3, R5, and R7
	LDR R2,R6,#1
	LDR R3,R6,#2
	LDR R5,R6,#3
	LDR R7,R6,#4
	ADD R6,R6,#5
	RET

RN_NEG_0	.FILL xFFD0	; -'0'
RN_NEG_MIN	.FILL xFFD3	; -'-'
RN_MINUS	.FILL x002D	; '-'
RN_NEGATE	.BLKW 1

; SCANF -- scan in formatted data
;     INPUTS -- format string followed by arguments
;     OUTPUTS -- number of integers converted left on top of stack 
;                (return value)
;     SIDE EFFECTS -- uses stack to save registers
;     NOTE: call as a C function
;
; R0 holds the character to be read
; R1 is the format string pointer
; R2 points to the next argument
; R3 is the number of integer conversions so far
; R4 is the character/number actually read from the keyboard
;
SCANF	ADD R6,R6,#-6		; save R0, R1, R2, R3, R4, and R7
	STR R0,R6,#0
	STR R1,R6,#1
	STR R2,R6,#2
	STR R3,R6,#3
	STR R4,R6,#4
	STR R7,R6,#5
	LDR R1,R6,#6
	ADD R2,R6,#7
	AND R3,R3,#0
SC_LOOP	JSR LOAD_FORMAT
	ADD R0,R0,#0
	BRz SC_DONE
	BRp SC_REG
	JSR READ_NUM
	ADD R0,R0,#0
	BRz SC_DONE
	LDR R0,R2,#0
	ADD R2,R2,#1
	STR R4,R0,#0
	ADD R3,R3,#1
	BRnzp SC_LOOP
SC_REG	JSR BUF_GETC
	NOT R0,R0
	ADD R0,R0,#1
	ADD R0,R0,R4
	BRz SC_LOOP
	JSR BUF_UNGETC
SC_DONE	LDR R7,R6,#5		; restore R7
	STR R3,R6,#5		; save return value
	LDR R0,R6,#0		; restore R0, R1, R2, R3, and R4
	LDR R1,R6,#1
	LDR R2,R6,#2
	LDR R3,R6,#3
	LDR R4,R6,#4
	ADD R6,R6,#5
	RET

; buffered input characters (0 means none)
INBUF	.FILL x0000
INBUF2	.FILL x0000

;---------------------------------------------------------------------------
; global data space allocation
;---------------------------------------------------------------------------

GLOBDATA
	.BLKW #3

;---------------------------------------------------------------------------
; stack allocation
;---------------------------------------------------------------------------

	.BLKW #1000
STACK

	.END

