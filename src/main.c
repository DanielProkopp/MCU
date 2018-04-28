#include <avr/io.h>


int main(void) {

  DDRB = 0xFF;
  PORTB = 1 << PB0;
  
  while(1){
    
  }

  return 0;
}
