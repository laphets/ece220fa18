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
	LEA R0,LBL2
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL3
LBL2
	.STRINGZ "Please type a number: "
LBL3
	LD R0,LBL4
	JSRR R0
	BRnzp LBL5
LBL4
	.FILL PRINTF
LBL5
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL8
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL9
LBL8
	.FILL #1
LBL9
	ADD R0,R5,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL10
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL11
LBL10
	.STRINGZ "%d"
LBL11
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
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRz LBL7
	ADD R2,R2,#1
LBL7
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL15
	LD R3,LBL14
	JMP R3
LBL14
	.FILL LBL6
LBL15
	LEA R0,LBL16
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL17
LBL16
	.STRINGZ "That's not a number!\n"
LBL17
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
	LD R0,LBL20
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL21
LBL20
	.FILL #3
LBL21
	LDR R0,R6,#0
	ADD R6,R6,#1
	STR R0,R5,#3
	;  LBL23
	LD R3,LBL22
	JMP R3
LBL22
	.FILL LBL1
LBL23
LBL6
	LDR R0,R5,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL24
	JSRR R0
	BRnzp LBL25
LBL24
	.FILL SRAND
LBL25
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL28
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL29
LBL28
	.FILL #0
LBL29
	ADD R0,R5,#-1
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL26
	LD R0,LBL31
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL32
LBL31
	.FILL #3
LBL32
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnz LBL30
	ADD R2,R2,#1
LBL30
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL34
	LD R3,LBL33
	JMP R3
LBL33
	.FILL LBL27
LBL34
	LD R0,LBL35
	JSRR R0
	BRnzp LBL36
LBL35
	.FILL RAND
LBL36
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL37
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL38
LBL37
	.FILL #10
LBL38
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
	LD R0,LBL41
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL42
LBL41
	.FILL #5
LBL42
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
	ADD R0,R5,#-1
	LDR R1,R0,#0
	ADD R2,R1,#1
	STR R2,R0,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
	ADD R6,R6,#1
	;  LBL44
	LD R3,LBL43
	JMP R3
LBL43
	.FILL LBL26
LBL44
LBL27
	LD R0,LBL47
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL48
LBL47
	.FILL #0
LBL48
	ADD R0,R5,#-3
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL45
	LD R0,LBL50
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL51
LBL50
	.FILL #0
LBL51
	LDR R0,R5,#-3
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL49
	ADD R2,R2,#1
LBL49
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL53
	LD R3,LBL52
	JMP R3
LBL52
	.FILL LBL46
LBL53
	LD R0,LBL56
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL57
LBL56
	.FILL #0
LBL57
	ADD R0,R5,#-1
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL54
	LD R0,LBL59
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL60
LBL59
	.FILL #3
LBL60
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnz LBL58
	ADD R2,R2,#1
LBL58
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL62
	LD R3,LBL61
	JMP R3
LBL61
	.FILL LBL55
LBL62
	LDR R0,R5,#-1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL63
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL64
LBL63
	.FILL #1
LBL64
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL65
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL66
LBL65
	.STRINGZ "Pile %d: "
LBL66
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
	LD R0,LBL71
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL72
LBL71
	.FILL #0
LBL72
	ADD R0,R5,#-2
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL69
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
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnz LBL73
	ADD R2,R2,#1
LBL73
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL75
	LD R3,LBL74
	JMP R3
LBL74
	.FILL LBL70
LBL75
	LEA R0,LBL76
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL77
LBL76
	.STRINGZ "*"
LBL77
	LD R0,LBL78
	JSRR R0
	BRnzp LBL79
LBL78
	.FILL PRINTF
LBL79
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R5,#-2
	LDR R1,R0,#0
	ADD R2,R1,#1
	STR R2,R0,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
	ADD R6,R6,#1
	;  LBL81
	LD R3,LBL80
	JMP R3
LBL80
	.FILL LBL69
LBL81
LBL70
	LEA R0,LBL82
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL83
LBL82
	.STRINGZ "\n"
LBL83
	LD R0,LBL84
	JSRR R0
	BRnzp LBL85
LBL84
	.FILL PRINTF
LBL85
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R5,#-1
	LDR R1,R0,#0
	ADD R2,R1,#1
	STR R2,R0,#0
	ADD R6,R6,#-1
	STR R1,R6,#0
	ADD R6,R6,#1
	;  LBL87
	LD R3,LBL86
	JMP R3
LBL86
	.FILL LBL54
LBL87
LBL55
	LD R0,LBL90
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL91
LBL90
	.FILL #0
LBL91
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL88
	LD R0,LBL93
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL94
LBL93
	.FILL #0
LBL94
	LDR R0,R5,#-4
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL92
	ADD R2,R2,#1
LBL92
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL96
	LD R3,LBL95
	JMP R3
LBL95
	.FILL LBL89
LBL96
	LEA R0,LBL97
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL98
LBL97
	.STRINGZ "From which pile will you take sticks? "
LBL98
	LD R0,LBL99
	JSRR R0
	BRnzp LBL100
LBL99
	.FILL PRINTF
LBL100
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL109
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL110
LBL109
	.FILL #1
LBL110
	ADD R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL111
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL112
LBL111
	.STRINGZ "%d"
LBL112
	LD R0,LBL113
	JSRR R0
	BRnzp LBL114
LBL113
	.FILL SCANF
LBL114
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRz LBL108
	ADD R2,R2,#1
LBL108
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL116
	LD R3,LBL115
	JMP R3
LBL115
	.FILL LBL106
LBL116
	LD R0,LBL118
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL119
LBL118
	.FILL #1
LBL119
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnz LBL117
	ADD R2,R2,#1
LBL117
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL106
	AND R2,R2,#0
	BRnzp LBL107
LBL106
	AND R2,R2,#0
	ADD R2,R2,#1
LBL107
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL121
	LD R3,LBL120
	JMP R3
LBL120
	.FILL LBL104
LBL121
	LD R0,LBL123
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL124
LBL123
	.FILL #3
LBL124
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRzp LBL122
	ADD R2,R2,#1
LBL122
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL104
	AND R2,R2,#0
	BRnzp LBL105
LBL104
	AND R2,R2,#0
	ADD R2,R2,#1
LBL105
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL126
	LD R3,LBL125
	JMP R3
LBL125
	.FILL LBL102
LBL126
	LD R0,LBL128
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL129
LBL128
	.FILL #0
LBL129
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL130
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL131
LBL130
	.FILL #1
LBL131
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	NOT R1,R1
	ADD R1,R1,#1
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
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL127
	ADD R2,R2,#1
LBL127
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL102
	AND R2,R2,#0
	BRnzp LBL103
LBL102
	AND R2,R2,#0
	ADD R2,R2,#1
LBL103
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL133
	LD R3,LBL132
	JMP R3
LBL132
	.FILL LBL101
LBL133
	LEA R0,LBL134
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL135
LBL134
	.STRINGZ "That's not a good choice.\n"
LBL135
	LD R0,LBL136
	JSRR R0
	BRnzp LBL137
LBL136
	.FILL PRINTF
LBL137
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	;  LBL140
	LD R3,LBL139
	JMP R3
LBL139
	.FILL LBL138
LBL140
LBL101
	LD R0,LBL141
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL142
LBL141
	.FILL #1
LBL142
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL143
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL144
LBL143
	.FILL #1
LBL144
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-5
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL138
	;  LBL146
	LD R3,LBL145
	JMP R3
LBL145
	.FILL LBL88
LBL146
LBL89
	LD R0,LBL149
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL150
LBL149
	.FILL #0
LBL150
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL147
	LD R0,LBL152
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL153
LBL152
	.FILL #0
LBL153
	LDR R0,R5,#-4
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL151
	ADD R2,R2,#1
LBL151
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL155
	LD R3,LBL154
	JMP R3
LBL154
	.FILL LBL148
LBL155
	LDR R0,R5,#-5
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL156
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL157
LBL156
	.FILL #1
LBL157
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,R1
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL158
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL159
LBL158
	.STRINGZ "How many sticks will you take from pile %d? "
LBL159
	LD R0,LBL160
	JSRR R0
	BRnzp LBL161
LBL160
	.FILL PRINTF
LBL161
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL168
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL169
LBL168
	.FILL #1
LBL169
	ADD R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LEA R0,LBL170
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL171
LBL170
	.STRINGZ "%d"
LBL171
	LD R0,LBL172
	JSRR R0
	BRnzp LBL173
LBL172
	.FILL SCANF
LBL173
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#2
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRz LBL167
	ADD R2,R2,#1
LBL167
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL175
	LD R3,LBL174
	JMP R3
LBL174
	.FILL LBL165
LBL175
	LD R0,LBL177
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL178
LBL177
	.FILL #0
LBL178
	LDR R0,R5,#-6
	ADD R6,R6,#-1
	STR R0,R6,#0
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRn LBL176
	ADD R2,R2,#1
LBL176
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL165
	AND R2,R2,#0
	BRnzp LBL166
LBL165
	AND R2,R2,#0
	ADD R2,R2,#1
LBL166
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL180
	LD R3,LBL179
	JMP R3
LBL179
	.FILL LBL163
LBL180
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
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRzp LBL181
	ADD R2,R2,#1
LBL181
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL163
	AND R2,R2,#0
	BRnzp LBL164
LBL163
	AND R2,R2,#0
	ADD R2,R2,#1
LBL164
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL183
	LD R3,LBL182
	JMP R3
LBL182
	.FILL LBL162
LBL183
	LEA R0,LBL184
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL185
LBL184
	.STRINGZ "That's not a good choice.\n"
LBL185
	LD R0,LBL186
	JSRR R0
	BRnzp LBL187
LBL186
	.FILL PRINTF
LBL187
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	;  LBL190
	LD R3,LBL189
	JMP R3
LBL189
	.FILL LBL188
LBL190
LBL162
	LD R0,LBL191
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL192
LBL191
	.FILL #1
LBL192
	ADD R0,R5,#-4
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL188
	;  LBL194
	LD R3,LBL193
	JMP R3
LBL193
	.FILL LBL147
LBL194
LBL148
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
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	NOT R1,R1
	ADD R1,R1,#1
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
	LD R0,LBL201
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL202
LBL201
	.FILL #0
LBL202
	LD R0,LBL203
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL204
LBL203
	.FILL #0
LBL204
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
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL200
	ADD R2,R2,#1
LBL200
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL206
	LD R3,LBL205
	JMP R3
LBL205
	.FILL LBL198
LBL206
	LD R0,LBL208
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL209
LBL208
	.FILL #0
LBL209
	LD R0,LBL210
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL211
LBL210
	.FILL #1
LBL211
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
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL207
	ADD R2,R2,#1
LBL207
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL198
	AND R2,R2,#0
	ADD R2,R2,#1
	BRnzp LBL199
LBL198
	AND R2,R2,#0
LBL199
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL213
	LD R3,LBL212
	JMP R3
LBL212
	.FILL LBL196
LBL213
	LD R0,LBL215
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL216
LBL215
	.FILL #0
LBL216
	LD R0,LBL217
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL218
LBL217
	.FILL #2
LBL218
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
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL214
	ADD R2,R2,#1
LBL214
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL196
	AND R2,R2,#0
	ADD R2,R2,#1
	BRnzp LBL197
LBL196
	AND R2,R2,#0
LBL197
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL220
	LD R3,LBL219
	JMP R3
LBL219
	.FILL LBL195
LBL220
	LEA R0,LBL221
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL222
LBL221
	.STRINGZ "You win!\n"
LBL222
	LD R0,LBL223
	JSRR R0
	BRnzp LBL224
LBL223
	.FILL PRINTF
LBL224
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL225
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL226
LBL225
	.FILL #1
LBL226
	ADD R0,R5,#-3
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	;  LBL229
	LD R3,LBL228
	JMP R3
LBL228
	.FILL LBL227
LBL229
LBL195
	LD R0,LBL232
	JSRR R0
	BRnzp LBL233
LBL232
	.FILL RAND
LBL233
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL234
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL235
LBL234
	.FILL #3
LBL235
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL236
	JSRR R3
	BRnzp LBL237
LBL236
	.FILL MODULUS
LBL237
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-5
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL230
	LD R0,LBL239
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL240
LBL239
	.FILL #0
LBL240
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
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL238
	ADD R2,R2,#1
LBL238
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL242
	LD R3,LBL241
	JMP R3
LBL241
	.FILL LBL231
LBL242
	LD R0,LBL243
	JSRR R0
	BRnzp LBL244
LBL243
	.FILL RAND
LBL244
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#0
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL245
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL246
LBL245
	.FILL #3
LBL246
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	LD R3,LBL247
	JSRR R3
	BRnzp LBL248
LBL247
	.FILL MODULUS
LBL248
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R0,R5,#-5
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
	;  LBL250
	LD R3,LBL249
	JMP R3
LBL249
	.FILL LBL230
LBL250
LBL231
	LD R0,LBL251
	JSRR R0
	BRnzp LBL252
LBL251
	.FILL RAND
LBL252
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
	LD R3,LBL253
	JSRR R3
	BRnzp LBL254
LBL253
	.FILL MODULUS
LBL254
	ADD R6,R6,#-1
	STR R0,R6,#0
	LD R0,LBL255
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL256
LBL255
	.FILL #1
LBL256
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
	LD R0,LBL257
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL258
LBL257
	.FILL #1
LBL258
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
	LEA R0,LBL259
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL260
LBL259
	.STRINGZ "I take %d from pile %d\n"
LBL260
	LD R0,LBL261
	JSRR R0
	BRnzp LBL262
LBL261
	.FILL PRINTF
LBL262
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
	LDR R1,R6,#0
	ADD R6,R6,#1
	LDR R0,R6,#0
	ADD R6,R6,#1
	NOT R1,R1
	ADD R1,R1,#1
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
	LD R0,LBL269
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL270
LBL269
	.FILL #0
LBL270
	LD R0,LBL271
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL272
LBL271
	.FILL #0
LBL272
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
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL268
	ADD R2,R2,#1
LBL268
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL274
	LD R3,LBL273
	JMP R3
LBL273
	.FILL LBL266
LBL274
	LD R0,LBL276
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL277
LBL276
	.FILL #0
LBL277
	LD R0,LBL278
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL279
LBL278
	.FILL #1
LBL279
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
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL275
	ADD R2,R2,#1
LBL275
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL266
	AND R2,R2,#0
	ADD R2,R2,#1
	BRnzp LBL267
LBL266
	AND R2,R2,#0
LBL267
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL281
	LD R3,LBL280
	JMP R3
LBL280
	.FILL LBL264
LBL281
	LD R0,LBL283
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL284
LBL283
	.FILL #0
LBL284
	LD R0,LBL285
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL286
LBL285
	.FILL #2
LBL286
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
	AND R2,R2,#0
	NOT R1,R1
	ADD R1,R1,#1
	ADD R0,R0,R1
	BRnp LBL282
	ADD R2,R2,#1
LBL282
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRz LBL264
	AND R2,R2,#0
	ADD R2,R2,#1
	BRnzp LBL265
LBL264
	AND R2,R2,#0
LBL265
	ADD R6,R6,#-1
	STR R2,R6,#0
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R0,R0,#0
	BRnp LBL288
	LD R3,LBL287
	JMP R3
LBL287
	.FILL LBL263
LBL288
	LEA R0,LBL289
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL290
LBL289
	.STRINGZ "I win!\n"
LBL290
	LD R0,LBL291
	JSRR R0
	BRnzp LBL292
LBL291
	.FILL PRINTF
LBL292
	LDR R0,R6,#0
	ADD R6,R6,#1
	ADD R6,R6,#1
	ADD R6,R6,#-1
	STR R0,R6,#0
	ADD R6,R6,#1
	LD R0,LBL293
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL294
LBL293
	.FILL #1
LBL294
	ADD R0,R5,#-3
	LDR R1,R6,#0
	STR R1,R0,#0
	ADD R6,R6,#1
LBL263
LBL227
	;  LBL296
	LD R3,LBL295
	JMP R3
LBL295
	.FILL LBL45
LBL296
LBL46
	LD R0,LBL297
	ADD R6,R6,#-1
	STR R0,R6,#0
	BRnzp LBL298
LBL297
	.FILL #0
LBL298
	LDR R0,R6,#0
	ADD R6,R6,#1
	STR R0,R5,#3
	;  LBL300
	LD R3,LBL299
	JMP R3
LBL299
	.FILL LBL1
LBL300
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

