			.syntax	unified
			.cpu	cortex-m4
			.text
			.global	PutNibble
			.thumb_func
			.align
			// void PutNibble(void *nibbles, uint32_t index, uint32_t nibble) ;
PutNibble:	
			LSR 	R12, R1, 1 //divide by 2, two nibbles for one byte
			LDRB	R3, [R0, R12] //get byte
			AND		R1, R1, 1 //even or odd
			CMP		R1, 0 //r1==0
			ITE		EQ
			BFIEQ	R3, R2, 0, 4
			BFINE	R3, R2, 4, 4 
			STRB	R3, [R0, R12] //return bits
			BX		LR
			.global	GetNibble
			.thumb_func
			.align
			// uint32_t GetNibble(void *nibbles, uint32_t index) ;
GetNibble:	
			LSR		R2, R1, 1//divide by 2, two nibbles for one byte
			LDRB	R2,[R0, R2] //get byte
			AND		R1, R1, 1 //even or odd
			CMP		R1, 0
			ITE		EQ //r1==0
			UBFXEQ	R0, R2, 0, 4
			UBFXNE	R0, R2, 4, 4 //set bits
			BX		LR
			.end
