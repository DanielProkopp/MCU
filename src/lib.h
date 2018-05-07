#ifndef LIB_H
#define LIB_H

// states
#define HIGH 1
#define LOW 0

#define OUTPUT 1
#define INPUT 0


/*!
  @def digitalWrite(port,bit,state)
*/
#define digitalWrite(port,bit,state) (port = state << bit)



/*!
  @def digitalWrite(port,bit,state)
*/
#define pinMode(ddrX,bit,state) (ddrX = state << bit)


#define digitalRead(pinX,bit) (pinX &= (1 << bit))




#endif
