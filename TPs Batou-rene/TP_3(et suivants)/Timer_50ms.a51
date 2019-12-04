;Timer_50ms
;Created by Lamiaux R�my and Ghirardi Baptiste
;20/11/2019
;version 1

LED			bit			P3.0 
Charge_H	   equ 			03Ch
Charge_L	   equ 			0B0h+08h				;Charge_L = N_L + Nr
			
	
   			org			0000h
debut: 
		      MOV			TMOD,#01h
		      

RPT:
				CLR			TR0
				MOV			A,TL0					;1CM
				ADD			A,#Charge_L			;1CM
		      MOV			TL0,A					;1CM
		      MOV			A,TH0					;1CM
		      ADDC			A,#Charge_H			;1CM
		      MOV			TH0,A					;1CM
		      CLR			TF0					;1CM
		      SETB			TR0					;1CM
Attendre:	JNB			TF0,Attendre	

 				CPL			LED
JSQ: 			SJMP			RPT	  			
