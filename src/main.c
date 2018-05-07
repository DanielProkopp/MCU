#include <avr/io.h>

#define F_CPU 16000000UL


#include <util/delay.h>
#include "lib.h"


#define LEFT_MOTOR PB0
#define RIGHT_MOTOR PB1


int main(void) {
  
  DDRB=0x02;
  TCCR1A = (1 << COM1A0);
  TCCR1B = (1<<WGM12) | (1<<CS10);
  OCR1A = 0x1FFF;

  pinMode(DDRB,PB5,OUTPUT);
  pinMode(DDRC,PC1,INPUT);
  digitalWrite(PORTC,PC1,LOW);

  while(1);
  /*  
  while(1){
    if(digitalRead(PINC,PC1)){
      digitalWrite(PORTB,PB5,HIGH);
    }
    else{
      digitalWrite(PORTB,PB5,LOW);
    }
  }
  */
  return 0;
}
