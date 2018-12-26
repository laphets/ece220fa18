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
	LD R0,LBL118
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL119
LBL118
	.FILL #1
LBL119
	ADD R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL122
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL123
LBL122
	.STRINGZ "%d"
LBL123
	LD R0,LBL120
	JSRR R0
	BRnzp LBL121
LBL120
	.FILL SCANF
LBL121
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
	BRz LBL117
	ADD R2,R2,#1
LBL117
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL125
	LD R3,LBL124
	JMP R3
LBL124
	.FILL LBL115
LBL125
	LD R0,LBL127
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL128
LBL127
	.FILL #1
LBL128
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
	BRnz LBL126
	ADD R2,R2,#1
LBL126
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL130
	LD R3,LBL129
	JMP R3
LBL129
	.FILL LBL115
LBL130
	;  LBL132
	LD R3,LBL131
	JMP R3
LBL131
	.FILL LBL116
LBL132
LBL115
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL114
LBL116
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL114
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL134
	LD R3,LBL133
	JMP R3
LBL133
	.FILL LBL112
LBL134
	LD R0,LBL136
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL137
LBL136
	.FILL #3
LBL137
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
	BRzp LBL135
	ADD R2,R2,#1
LBL135
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL139
	LD R3,LBL138
	JMP R3
LBL138
	.FILL LBL112
LBL139
	;  LBL141
	LD R3,LBL140
	JMP R3
LBL140
	.FILL LBL113
LBL141
LBL112
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL111
LBL113
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL111
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL143
	LD R3,LBL142
	JMP R3
LBL142
	.FILL LBL109
LBL143
	LD R0,LBL145
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL146
LBL145
	.FILL #0
LBL146
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL147
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL148
LBL147
	.FILL #1
LBL148
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
	BRnp LBL144
	ADD R2,R2,#1
LBL144
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL150
	LD R3,LBL149
	JMP R3
LBL149
	.FILL LBL109
LBL150
	;  LBL152
	LD R3,LBL151
	JMP R3
LBL151
	.FILL LBL110
LBL152
LBL109
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL108
LBL110
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL108
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL105
	LD R3,LBL153
	JMP R3
LBL153
	.FILL LBL106
LBL154
LBL105
	LEA R0,LBL157
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL158
LBL157
	.STRINGZ "That's not a good choice.\n"
LBL158
	LD R0,LBL155
	JSRR R0
	BRnzp LBL156
LBL155
	.FILL PRINTF
LBL156
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL159
	JMP R3
LBL159
	.FILL LBL107
LBL160
LBL106
	LD R0,LBL161
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL162
LBL161
	.FILL #1
LBL162
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL163
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL164
LBL163
	.FILL #1
LBL164
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
	;  LBL166
	LD R3,LBL165
	JMP R3
LBL165
	.FILL LBL94
LBL166
LBL95
	LD R0,LBL167
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL168
LBL167
	.FILL #0
LBL168
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL169
	LD R0,LBL172
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL173
LBL172
	.FILL #0
LBL173
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
	BRnp LBL171
	ADD R2,R2,#1
LBL171
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL175
	LD R3,LBL174
	JMP R3
LBL174
	.FILL LBL170
LBL175
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL178
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL179
LBL178
	.FILL #1
LBL179
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL180
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL181
LBL180
	.STRINGZ "How many sticks will you take from pile %d? "
LBL181
	LD R0,LBL176
	JSRR R0
	BRnzp LBL177
LBL176
	.FILL PRINTF
LBL177
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL192
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL193
LBL192
	.FILL #1
LBL193
	ADD R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL196
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL197
LBL196
	.STRINGZ "%d"
LBL197
	LD R0,LBL194
	JSRR R0
	BRnzp LBL195
LBL194
	.FILL SCANF
LBL195
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
	BRz LBL191
	ADD R2,R2,#1
LBL191
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL199
	LD R3,LBL198
	JMP R3
LBL198
	.FILL LBL189
LBL199
	LD R0,LBL201
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL202
LBL201
	.FILL #0
LBL202
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
	BRn LBL200
	ADD R2,R2,#1
LBL200
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL204
	LD R3,LBL203
	JMP R3
LBL203
	.FILL LBL189
LBL204
	;  LBL206
	LD R3,LBL205
	JMP R3
LBL205
	.FILL LBL190
LBL206
LBL189
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL188
LBL190
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL188
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL208
	LD R3,LBL207
	JMP R3
LBL207
	.FILL LBL186
LBL208
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
	BRzp LBL209
	ADD R2,R2,#1
LBL209
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL211
	LD R3,LBL210
	JMP R3
LBL210
	.FILL LBL186
LBL211
	;  LBL213
	LD R3,LBL212
	JMP R3
LBL212
	.FILL LBL187
LBL213
LBL186
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL185
LBL187
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL185
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL182
	LD R3,LBL214
	JMP R3
LBL214
	.FILL LBL183
LBL215
LBL182
	LEA R0,LBL218
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL219
LBL218
	.STRINGZ "That's not a good choice.\n"
LBL219
	LD R0,LBL216
	JSRR R0
	BRnzp LBL217
LBL216
	.FILL PRINTF
LBL217
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL220
	JMP R3
LBL220
	.FILL LBL184
LBL221
LBL183
	LD R0,LBL222
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL223
LBL222
	.FILL #1
LBL223
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL184
	;  LBL225
	LD R3,LBL224
	JMP R3
LBL224
	.FILL LBL169
LBL225
LBL170
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
	LD R0,LBL236
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL237
LBL236
	.FILL #0
LBL237
	LD R0,LBL238
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL239
LBL238
	.FILL #0
LBL239
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
	BRnp LBL235
	ADD R2,R2,#1
LBL235
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL241
	LD R3,LBL240
	JMP R3
LBL240
	.FILL LBL234
LBL241
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
	.FILL #1
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
	.FILL LBL234
LBL248
	;  LBL250
	LD R3,LBL249
	JMP R3
LBL249
	.FILL LBL233
LBL250
LBL233
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL232
LBL234
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL232
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL252
	LD R3,LBL251
	JMP R3
LBL251
	.FILL LBL231
LBL252
	LD R0,LBL254
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL255
LBL254
	.FILL #0
LBL255
	LD R0,LBL256
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL257
LBL256
	.FILL #2
LBL257
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
	BRnp LBL253
	ADD R2,R2,#1
LBL253
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL259
	LD R3,LBL258
	JMP R3
LBL258
	.FILL LBL231
LBL259
	;  LBL261
	LD R3,LBL260
	JMP R3
LBL260
	.FILL LBL230
LBL261
LBL230
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL229
LBL231
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL229
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL226
	LD R3,LBL262
	JMP R3
LBL262
	.FILL LBL227
LBL263
LBL226
	LEA R0,LBL266
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL267
LBL266
	.STRINGZ "You win!\n"
LBL267
	LD R0,LBL264
	JSRR R0
	BRnzp LBL265
LBL264
	.FILL PRINTF
LBL265
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL268
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL269
LBL268
	.FILL #1
LBL269
	ADD R0,R5,#-3
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LD R3,LBL270
	JMP R3
LBL270
	.FILL LBL228
LBL271
LBL227
	LD R0,LBL274
	JSRR R0
	BRnzp LBL275
LBL274
	.FILL RAND
LBL275
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL276
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL277
LBL276
	.FILL #3
LBL277
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL272
	JSRR R3
	BRnzp LBL273
LBL272
	.FILL MODULUS
LBL273
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-5
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL278
	LD R0,LBL281
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL282
LBL281
	.FILL #0
LBL282
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
	BRnp LBL280
	ADD R2,R2,#1
LBL280
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL284
	LD R3,LBL283
	JMP R3
LBL283
	.FILL LBL279
LBL284
	LD R0,LBL287
	JSRR R0
	BRnzp LBL288
LBL287
	.FILL RAND
LBL288
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL289
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL290
LBL289
	.FILL #3
LBL290
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL285
	JSRR R3
	BRnzp LBL286
LBL285
	.FILL MODULUS
LBL286
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-5
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	;  LBL292
	LD R3,LBL291
	JMP R3
LBL291
	.FILL LBL278
LBL292
LBL279
	LD R0,LBL295
	JSRR R0
	BRnzp LBL296
LBL295
	.FILL RAND
LBL296
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
	LD R3,LBL293
	JSRR R3
	BRnzp LBL294
LBL293
	.FILL MODULUS
LBL294
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL297
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL298
LBL297
	.FILL #1
LBL298
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
	LD R0,LBL301
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL302
LBL301
	.FILL #1
LBL302
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
	LEA R0,LBL303
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL304
LBL303
	.STRINGZ "I take %d from pile %d\n"
LBL304
	LD R0,LBL299
	JSRR R0
	BRnzp LBL300
LBL299
	.FILL PRINTF
LBL300
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
	LD R0,LBL315
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL316
LBL315
	.FILL #0
LBL316
	LD R0,LBL317
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL318
LBL317
	.FILL #0
LBL318
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
	BRnp LBL314
	ADD R2,R2,#1
LBL314
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL320
	LD R3,LBL319
	JMP R3
LBL319
	.FILL LBL313
LBL320
	LD R0,LBL322
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL323
LBL322
	.FILL #0
LBL323
	LD R0,LBL324
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL325
LBL324
	.FILL #1
LBL325
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
	BRnp LBL321
	ADD R2,R2,#1
LBL321
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL327
	LD R3,LBL326
	JMP R3
LBL326
	.FILL LBL313
LBL327
	;  LBL329
	LD R3,LBL328
	JMP R3
LBL328
	.FILL LBL312
LBL329
LBL312
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL311
LBL313
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL311
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL331
	LD R3,LBL330
	JMP R3
LBL330
	.FILL LBL310
LBL331
	LD R0,LBL333
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL334
LBL333
	.FILL #0
LBL334
	LD R0,LBL335
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL336
LBL335
	.FILL #2
LBL336
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
	BRnp LBL332
	ADD R2,R2,#1
LBL332
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL338
	LD R3,LBL337
	JMP R3
LBL337
	.FILL LBL310
LBL338
	;  LBL340
	LD R3,LBL339
	JMP R3
LBL339
	.FILL LBL309
LBL340
LBL309
	AND R1,R1,#0
	ADD R1,R1,#1
	ADD R6,R6,#-1
	STR R1,R6,#0
	BRnzp LBL308
LBL310
	AND R1,R1,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
LBL308
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
BRnp LBL305
	LD R3,LBL341
	JMP R3
LBL341
	.FILL LBL306
LBL342
LBL305
	LEA R0,LBL345
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL346
LBL345
	.STRINGZ "I win!\n"
LBL346
	LD R0,LBL343
	JSRR R0
	BRnzp LBL344
LBL343
	.FILL PRINTF
LBL344
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL347
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL348
LBL347
	.FILL #1
LBL348
	ADD R0,R5,#-3
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LD R3,LBL349
	JMP R3
LBL349
	.FILL LBL307
LBL350
LBL306
LBL307
LBL228
	;  LBL352
	LD R3,LBL351
	JMP R3
LBL351
	.FILL LBL51
LBL352
LBL52
	LD R0,LBL355
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL356
LBL355
	.FILL #0
LBL356
	LDR R0,R6,#0
	ADD R6,R6,#1
	STR R0,R5,#3
	LD R3,LBL353
	JMP R3
LBL353
	.FILL LBL1
LBL354
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

