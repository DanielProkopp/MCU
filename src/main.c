#include <avr/io.h>
#include <avr/interrupt.h>

#define F_CPU 16000000UL

#include "lib.h"

#define LEFT_MOTOR PB1
#define RIGHT_MOTOR PB2

#define LEFT_SENSOR PB0
#define RIGHT_SENSOR PB3




/*
ISR(INT0_vect){
	
}

ISR(INT0_vect){
	
}
*/

int main(){
	
	DDRB = 0x06;
	
	
	TCCR1A = (1<<COM1A1) |
			 (1<<COM1B1) | 
			 //(1<<COM1B0) | 
			(1<<WGM10);
	
	TCCR1B = //(1<<CS10) | 
			 (1<<CS11) | 
			 (1<<WGM12);
	/*
	// External Interrupt enable for INT0 and INT1
	EIMSK = 0x02;
	// Falling Edge sense (this because the infrared sensor)
	EICRA = (1<<ISC11) |
			(1<<ISC01);
	*/
	float left_radix = 7;
	float right_radix = 7;
	
	OCR1A = (left_radix/10)*255;
	OCR1B = (right_radix/10)*255;
	
	TIMSK1 = (1<<TOIE1);
	sei();
	
	uint8_t left_sensor_state;
	uint8_t right_sensor_state;
	
	while(1){
		
		OCR1A = (left_radix/10)*255;
		OCR1B = (right_radix/10)*255;
		
		left_sensor_state = digitalRead(DDRB,LEFT_SENSOR);
		right_sensor_state = digitalRead(DDRB,RIGHT_SENSOR);
		
		switch(left_sensor_state){
			case 0:
				if(left_radix >1){
					left_radix--; // speed up
				}
				break;
			case 1:
				left_radix = 5;
				break;
		}
		
		switch(right_sensor_state){
			case 0:
				if(right_radix >1){
					right_radix--; // speed up
				}
				break;
			case 1:
				right_radix = 5;
				break;
		}
		
	}
	
	return 0;
}



















