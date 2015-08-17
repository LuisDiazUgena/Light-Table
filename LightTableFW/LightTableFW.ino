

/*

Light table FW

*/

//Encoder variables
//interrupt 0 (pin 2) and interrupt 1 (pin 3)
int encoderPin1 = 3;
int encoderPin2 = 2;
int encoderSwitchPin = 5; //push button switch

int pinledLong = 7;

int sum;

volatile int lastEncoded = 3; //You must initialize the encoders pins on 11 (3) !!!
volatile long encoderValue = 0;

long lastencoderValue = 0;

int lastMSB = 0;
int lastLSB = 0;

//debug
bool debug = false;

//led strip
int pinR = 11, pinG = 10, pinB = 9; // PWM pins
int color = 0; // 0:red, 1: green, 2:blue
int red = 255, green = 255, blue = 255;

//Time variables
long unsigned nextTime, intervale = 1000; // Change intervale to modify long time click
bool clicked = false;

//Fan
int pinFan = 4;
bool fanOn = false;
void setup() {

  Serial.begin (19200); // Needs to be 19200 to work with ZUM BT-328 Bluetooth.

  //Encoder pins
  pinMode(encoderPin1, INPUT);
  pinMode(encoderPin2, INPUT);

  pinMode(encoderSwitchPin, INPUT);

  pinMode(pinFan, OUTPUT);

  digitalWrite(encoderPin1, HIGH); //turn pullup resistor on
  digitalWrite(encoderPin2, HIGH); //turn pullup resistor on

  //call updateEncoder() when any high/low changed seen
  //on interrupt 0 (pin 2), or interrupt 1 (pin 3)
  attachInterrupt(0, updateEncoder, CHANGE);
  attachInterrupt(1, updateEncoder, CHANGE);

  //Led strip pins
  pinMode(pinR, OUTPUT);
  pinMode(pinG, OUTPUT);
  pinMode(pinB, OUTPUT);

  // turn off leds by default at boot
  clear();

}

void loop() {

/*
  Bluetooth functions
*/

if(Serial.available()>0){
  red = Serial.parseInt();
  green = Serial.parseInt();
  blue = Serial.parseInt();

  if(Serial.read()=='\n'){
    red = constrain(red,0,255);
    green = constrain(green,0,255);
    blue = constrain(blue,0,255);

    analogWrite(pinR, red);
    analogWrite(pinG, green);
    analogWrite(pinB, blue);
  }
}

/*
  Encoder functions
*/

  nextTime = millis() + intervale;
  while (digitalRead(encoderSwitchPin)) {
    clicked = true;
    if(millis()>nextTime){
      digitalWrite(pinledLong, HIGH);
    }
  }
  digitalWrite(pinledLong, LOW);

  if (clicked) {
    if (millis() > nextTime) {
      //Long click
      if(encoderValue==0){
        fanOn=true;
        AllOn();
      }else{
        fanOn=false;
        clear();
      }
    } else {
      //Short click
      manageColor();
    }
    clicked = false;
  }else{
    if(lastencoderValue != encoderValue){
      updateAllColors(encoderValue);
    }
  }

  /*
    Fan functions
  */

  if (fanOn){
    digitalWrite(pinFan, HIGH);
  }else{
    digitalWrite(pinFan, LOW);
  }

  delay(100); //just here to slow down the output, and show it. will work even during a delay
}

void updateAllColors(int value){
  analogWrite(pinR, value);
  analogWrite(pinG, value);
  analogWrite(pinB, value);
}
void AllOn(){
  encoderValue=255;
  updateAllColors(encoderValue);
}
void clear(){
  encoderValue=0;
  updateAllColors(encoderValue);
}
int manageColor() {
  delay(250);
  if (debug){
    Serial.print("color = ");
    Serial.println(color);
  }

  encoderValue = 0;
  if (color == 0) {
    clear();
  }

  do {
    if (color == 0) {
      //Red is changing
      red = encoderValue;
      analogWrite(pinR, red);
    } else if (color == 1) {
      //Green is changing
      green = encoderValue;
      analogWrite(pinG, green);
    } else if (color == 2) {
      //Blue is changing
      blue = encoderValue;
      analogWrite(pinB, blue);
    }
  } while (!digitalRead(encoderSwitchPin));

  color++;

  if (color != 3) {
    manageColor();
  } else {
    /*
    analogWrite(pinR, red);
    analogWrite(pinG, green);
    analogWrite(pinB, blue);
    */
    color = 0;
    delay(250);
    return 0;
  }

}
void updateEncoder() {

  int MSB = digitalRead(encoderPin1); //MSB = most significant bit
  int LSB = digitalRead(encoderPin2); //LSB = least significant bit

  int encoded = (MSB << 1) | LSB; //converting the 2 pin value to single number

  sum  = (lastEncoded << 2) | encoded; //adding it to the previous encoded value

  if (sum == 0b1101 || sum == 0b0100 || sum == 0b0010 || sum == 0b1011) encoderValue ++;
  if (sum == 0b1110 || sum == 0b0111 || sum == 0b0001 || sum == 0b1000) encoderValue --;

  encoderValue = constrain(encoderValue,0,255); //Fixed encoder value to 0-255 range

  if (debug) {
    Serial.print("lastencoded: ");
    Serial.println(lastEncoded);

    Serial.print("encoded: ");
    Serial.println(encoded);
  }
  if(encoderValue == 0){
    fanOn = false;
  }else{
    fanOn =true;
  }
  lastEncoded = encoded; //store this value for next time
}
