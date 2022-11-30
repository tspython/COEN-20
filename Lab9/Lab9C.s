					.syntax         unified
					.cpu            cortex-m4
					.text
					// float EccentricAnomaly(float e, float M)
					.global         EccentricAnomaly
					.thumb_func
					.align
EccentricAnomaly:	// S0 = e, S1 = M
					PUSH            {LR}
					VPUSH           {S16-S18}
					VMOV			S16, S0
					VMOV			S17, S1
					VMOV			S0, S1
					BL				cosDeg		//call cosDeg
					VMOV.F32		S18, 1.0
					VMLA.F32		S18, S0, S16
					VMOV			S0, S17
					BL				sinDeg		//call sinDeg
					VMUL.F32		S18, S18, S0
					VMUL.F32		S0, S16, S18
					BL				Rad2Deg		//call Rad2Deg
					VMUL.F32		S0, S0, S17
					VPOP            {S16-S18}
					POP             {PC}

					// float Kepler(float m, float ecc)
					.global         Kepler
					.thumb_func
					.align
Kepler:				// S0 = m, S1 = ecc
					PUSH            {R3,LR}
					VPUSH           {S16-S19}
					VMOV			S16, S1
					BL				Deg2Rad		//call Degrees to Radians
					VMOV			S17, S0
					VMOV			S18, S0
Top:				VMOV			S0, S18
					BL				sinf
					VMUL.F32		S1, S16, S0
					VSUB.F32		S1, S18, S1
					VSUB.F32		S19, S1, S17
					VMOV			S0, S18
					BL				cosf
					VMOV			S1, 1.0	
					VMLS.F32		S1, S16, S0
					VDIV.F32		S0, S19, S1
					VSUB.F32		S18, S18, S0
					VABS.F32		S0, S19
					VLDR 			S1, epsilon		//load unique epsilon number
					VCMP.F32		S0, S1	
					VMRS			APSR_nczv, FPSCR
					BGT				Top
					VMOV			S0, S18
					VPOP            {S16-S19}
					POP             {R3,PC}

					.align
epsilon:			.float          1E-6
					.end