;W_Comp
;created by Remi Lamiaux and Baptiste Ghirardi 
;13/11/2019
;version 1

W1_L			data		7Fh
W1_H			data		7Eh
W2_L			data		7Dh
W2_H			data		7Ch
RES			bit		P3.7
Tmp			data		Acc

				org		0000h
				
debut:
				MOV		A,W1_H
				CLR 		C
				SUBB		A,W2_H
Si:			JNZ		finSi
            MOV		A,W1_L
            CLR		C
            SUBB		A,W2_L
finSi:		MOV		RES,C			
fin:			SJMP		debut

				end 