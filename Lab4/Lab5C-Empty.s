			.syntax     unified
			.cpu        cortex-m4
			.text
			//                         R0         R1            R2            R3
			// int32_t MxPlusB(int32_t x, int32_t mtop, int32_t mbtm, int32_t b) ;
			.global     MxPlusB
			.thumb_func
			.align
MxPlusB:	
			PUSH		{R4-R12} //push needed registers
			MUL			R4, R1, R0 // R4 = mtop * x
			MUL			R5, R4, R2 // R5 = R4 * mbtm
			ASR 		R6, R5, 31 // R6 = shift R5 by 31 bits (extending)
			MUL 		R7, R6, R2 // R7 = R6 * mbtm
			LSL			R8, R7, 1  // R8 = shift R7 by 1 bit
			ADD			R9, R8, R2 // R9 = R8 + R2mbtm
			LDR			R10,=2	   // setting R10 to 2 for future use
			SDIV 		R10, R9, R10 // R10 = R9 / 2
			MUL			R11, R1, R0  // R11 = mtop/x
			ADD			R12, R11, R10 // R12 = R11 + R10
			SDIV		R0, R12, R2		// R0 = R12 / mbtm
			ADD			R0, R0, R3		// R0 = R0 + b
			POP			{R4-R12}	//pop needed registers 
			BX          LR
			.end
