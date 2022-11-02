			.syntax		unified
			.cpu		cortex-m4
			.text
			.global		CopyCell
			.thumb_func
			.align
			// void CopyCell(uint32_t *dst, uint32_t *src);
CopyCell:	
			MOV		R2,0 //load r2=0
NextRow1:	
			MOV		R3, 0	//load r3 = 0
			CMP 	R2, 60	//for loop compare R2 and 60
			BHS		EndRows1 //exit clause
			
			
NextCol1:	
			CMP 	R3, 60	//for loop compare R3 and 60
			BHS		EndCol1 //for loop exit clause 
			LDR 	R12,[R1, R3, LSL 2] 
			STR		R12,[R0, R3, LSL 2] //r0[r3] = r1[r3]
			ADD		R3, R3, 1	//r2=r2+1
			B		NextCol1	//loop back to top

EndCol1:	
			ADD		R0, R0, 960 //move to next row
			ADD 	R1, R1, 960
			ADD		R2, R2, 1
			B		NextRow1

EndRows1:	
			BX			LR

			.global		FillCell
			.thumb_func
			.align 
			// void FillCell(uint32_t *dst, uint32_t color);
FillCell:	
			MOV		R2,0
NextRow2:	
			MOV		R3, 0
			CMP 	R2, 60				//for loop exit clause
			BHS		EndRows2			//exit

NextCol2:	
			CMP 	R3, 60	
			BHS		EndCol2				//for loop exit clause
			STR		R1, [R0, R3, LSL 2] //r0[r3] = r1
			ADD		R3, R3, 1			//r3 = r3+1
			B		NextCol2			//loop back to top

EndCol2:	
			ADD		R0, R0, 960	//move to next row
			ADD		R2, R2, 1
			B		NextRow2

EndRows2:	
			BX			LR
			.end
