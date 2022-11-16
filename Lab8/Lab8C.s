			.syntax		unified
			.cpu		cortex-m4
			.text
			// uint32_t Mul32X10(uint32_t R0_multiplicand) ;
			.global		Mul32X10
			.thumb_func
			.align
Mul32X10:	LSL 		R1, R0, 2 //multiply by 4
			ADD			R1, R1, R0 //add multiplcand to tmp var
			LSL			R0, R1, 1 //multiply by 2
			BX			LR

			// uint32_t Mul64X10(uint32_t R1.R0_multiplicand) ;
			.global		Mul64X10
			.thumb_func
			.align
Mul64X10:	LSL 		R2, R1, 2 //multiply 4
			LSR			R3, R0, 30 //take sign bit	
			ORR			R2, R2, R3 //or together
			LSL 		R3, R0, 2  //below we are adding with cary bit and together
			ADDS		R3, R3, R0
			ADC			R2, R2, R1
			LSLS		R0, R3, 1
			ADC			R1, R2, R2
			BX			LR

			// uint32_t Div32X10(uint32_t R0_dividend) ;
			.global		Div32X10
			.thumb_func
			.align
Div32X10:	// ImplementMe
			LDR 		R1, =3435973837 //load constant
			UMULL		R2, R1, R1, R0 //multiply
			LSR			R0, R1, 3
			BX			LR
			.end
