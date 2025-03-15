#include <Arduino.h>

// Add externals for accesibility in the
// assembly code file.
extern "C"
{
  void LedInit();
  void LedOn();
  void LedOff();
}

void setup() 
{
  LedInit();
}

void loop() 
{
  LedOn();
  delay(500);
  LedOff();
  // Delay
  delay(500);
}
