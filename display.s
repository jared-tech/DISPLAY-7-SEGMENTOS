PROCESSOR 16F887
#include <xc.inc>
;CONFIG word1
CONFIG FOSC = INTRC_NOCLKOUT
CONFIG WDTE = OFF
CONFIG PWRTE = ON
CONFIG MCLRE = OFF
CONFIG CP = OFF
CONFIG CPD = OFF
CONFIG BOREN = OFF
CONFIG IESO = OFF
CONFIG FCMEN = ON
CONFIG DEBUG = ON
;CONFIG word2
CONFIG BOR4V=BOR40V
CONFIG WRT = OFF
PSECT udata
pineda1:
    DS 1
pineda2:
    DS 1
pineda3:
    DS 1
PSECT resetVec,class=CODE,delta=2
resetVec:
PAGESEL main
goto main
    
PSECT code
n0:
BANKSEL PORTC
movlw 0b00111111
movwf PORTC
PAGESEL main
return

PSECT code
n1:
BANKSEL PORTC
movlw 0b00000110
movwf PORTC
PAGESEL main
return

PSECT code
n2:
BANKSEL PORTC
movlw 0b01011011
movwf PORTC
PAGESEL main
return
    
PSECT code
n3:
BANKSEL PORTC
movlw 0b01001111
movwf PORTC
PAGESEL main
return    

PSECT code
n4:
BANKSEL PORTC
movlw 0b01100110
movwf PORTC
PAGESEL main
return

PSECT code
n5:
BANKSEL PORTC
movlw 0b01101101
movwf PORTC
PAGESEL main
return
   
PSECT code
n6:
BANKSEL PORTC
movlw 0b01111101
movwf PORTC
PAGESEL main
return

PSECT code
n7:
BANKSEL PORTC
movlw 0b00000111
movwf PORTC
PAGESEL main
return

PSECT code
n8:
BANKSEL PORTC
movlw 0b01111111
movwf PORTC
PAGESEL main
return

PSECT code
n9:
BANKSEL PORTC
movlw 0b01101111
movwf PORTC
PAGESEL main
return

PSECT code
delay_255us:
movlw   255
movwf   pineda3
decfsz pineda3
goto $-1
return

PSECT code
delay_65ms:
movlw   255
movwf   pineda2
call delay_255us
decfsz pineda2
goto $-2
return
 
PSECT code
delay_500ms:
movlw   0x08
movwf pineda1
call delay_65ms
decfsz  pineda1
goto $-2
return
   
PSECT code
main:
bcf STATUS,0
bcf STATUS,5
bcf STATUS,6
BANKSEL ANSELH
CLRF ANSELH
BANKSEL TRISC
MOVLW 0b00000000
MOVWF TRISC
BANKSEL PORTC
CLRF PORTC
BANKSEL OSCCON
MOVLW  0b01110000
MOVWF  OSCCON
INICIO:
call n0
call delay_500ms
call n1
call delay_500ms
call n2
call delay_500ms   
call n3
call delay_500ms
call n4
call delay_500ms
call n5
call delay_500ms
call n6
call delay_500ms
call n7
call delay_500ms
call n8
call delay_500ms
call n9
call delay_500ms
GOTO INICIO
END


