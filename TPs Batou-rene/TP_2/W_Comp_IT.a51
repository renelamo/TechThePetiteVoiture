;created by Remi Lamiaux and Baptiste Ghirardi 
;15/11/2019
;version 1

W1_L			data		7Fh
W1_H			data		7Eh
W2_L			data		7Dh
W2_H			data		7Ch
INF			bit		P3.7
SUP			bit		P3.6
Res_Rt		bit		F0
W_IN			data		P1
Masque		equ		00000011b



				org		0000h
				SJMP		debut
				
				org		0003h
				LJMP		INTech
				
				org		0030h
				
debut:
				MOV		TCON,#00000001b
				MOV		IE,#10000001b
		
fin:			SJMP		fin


;Compare 2 nombres
;Paramètres: Adresses des octets de poids fort des nombres a comparer dans R0 et R1
;Retourne: 1 si ((R0))<((R1)) et 0 sinon, dans F0
Comp:
				PUSH		Acc
				MOV		A,@R0
				CLR 		C
				SUBB		A,@R1
Si:			JNZ		finSi
				INC		R0
				INC		R1
            MOV		A,@R0
            CLR		C
            SUBB		A,@R1
finSi:		MOV		Res_Rt,C
FinComp:		POP		Acc
				RET
				
INTech:
				MOV		W2_L,W_IN
				MOV		A,W_IN
				RR			A
				RR			A
				MOV		W2_H,A
				RR			A
				RR			A
				MOV		W1_L,A
				RR			A
				RR			A
				MOV		W1_H,A
								
				ANL		W2_L,#Masque
				ANL		W2_H,#Masque
				ANL		W1_L,#Masque
				ANL		W1_H,#Masque
				;Comparaison
				MOV		R0,#W1_H
            MOV		R1,#W2_H
				LCALL		Comp
				MOV		C,Res_Rt
				MOV		INF,C
				CPL		C
				MOV		SUP,C
				
Fin_INTech:	RETI

				end  
