        		.syntax         unified
        		.cpu            cortex-m4
        		.text
				// int32_t Return32Bits(void) ;
        		.global         Return32Bits
        		.thumb_func
        		.align
Return32Bits:
				// ImplementMe
				// ImplementMe
				// ImplementMe
				LDR				R0, =10 //Load 10 into return register
        		BX              LR

				// int64_t Return64Bits(void) ;
        		.global         Return64Bits
        		.thumb_func
        		.align
Return64Bits:	
				// ImplementMe
				// ImplementMe
				// ImplementMe
				LDR				R0, =-10 //Load -10 into return register
				LDR				R1, =-1	 //setting sign for rest of bits
        		BX              LR

				// uint8_t Add8Bits(uint8_t x, uint8_t y) ;
	        	.global         Add8Bits
        		.thumb_func
        		.align
Add8Bits:		
				// ImplementMe
				// ImplementMe
				// ImplementMe
				ADD				R0,R0,R1 //add x+y into return register
				UXTB			R0, R0	// extend the sign bit
        		BX              LR

				// uint32_t FactSum32(uint32_t x, uint32_t y) ;
		        .global         FactSum32
		        .thumb_func
		        .align
FactSum32:	
				// ImplementMe
				// ImplementMe
				// ImplementMe
				PUSH			{R4, LR} //push on stack
				ADD				R0,R0,R1 //add x and y
				BL 				Factorial //call factorial function
				POP				{R4, PC} //pop off the stack
        		BX              LR

				// uint32_t XPlusGCD(uint32_t x, uint32_t y, uint32_t z) ;
        		.global         XPlusGCD
        		.thumb_func
        		.align
XPlusGCD:
				// ImplementMe
				// ImplementMe
				// ImplementMe
				PUSH			{R4, LR} //push on stack
				MOV				R4, R0	//save x value
				MOV				R0, R1	//move into parameter register
				MOV				R1, R2	//move into parameter register
				ADD				R0, R0, R1	//add into parameter register
				BL				gcd
				ADD				R0, R0, R4 //add x and result of factorial(x+y)
				POP				{R4, PC} //pop off stack
        		BX              LR
        		.end
