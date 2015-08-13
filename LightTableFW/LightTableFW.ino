

/*

Light table FW

*/

//Encoder variables
//interrupt 0 (pin 2) and interrupt 1 (pin 3)
int encoderPin1 = 3;
int encoderPin2 = 2;
int encoderSwitchPin = 7; //push button switch

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
int red=255,green=255,blue=255;

void setup(){

  Serial.begin (19200); // Needs to be 19200 to work with ZUM BT-328 Bluetooth.

	//Encoder pins
  pinMode(encoderPin1, INPUT);
  pinMode(encoderPin2, INPUT);

  pinMode(encoderSwitchPin, INPUT);

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
	digitalWrite(pinR,LOW);
	digitalWrite(pinG,LOW);
	digitalWrite(pinB,LOW);

}

void loop(){

  if(digitalRead(encoderSwitchPin)){
    //button is being pushed
		if (debug) Serial.println("click!");
		manageClick();
		manageColor();
	}

  Serial.println(encoderValue);
  delay(100); //just here to slow down the output, and show it will work  even during a delay
}

void manageClick(){
	if (color=3){
		color=0;
	}else{
		color++;
	}
}
int manageColor(){
	int auxR=red,auxG = green,auxB = blue;

	encoderValue=0;

	digitalWrite(pinR,LOW);
	digitalWrite(pinG,LOW);
	digitalWrite(pinB,LOW);

	do{
		if(color == 0){
			//Red is changing
			red = constrain(encoderValue,0,255);
		}else if(color == 1){
			//Green is changing
			green = constrain(encoderValue,0,255);
		}else if(color == 2){
			//Blue is changing
			blue = constrain(encoderValue,0,255);
		}
	}while(digitalRead(encoderSwitchPin));
	
	color++;

	if(color!=3){
		manageColor();
	}else{
		return 0;
	}

}
void updateEncoder(){

  int MSB = digitalRead(encoderPin1); //MSB = most significant bit
  int LSB = digitalRead(encoderPin2); //LSB = least significant bit

  int encoded = (MSB << 1) |LSB; //converting the 2 pin value to single number

  sum  = (lastEncoded << 2) | encoded; //adding it to the previous encoded value

  if(sum == 0b1101 || sum == 0b0100 || sum == 0b0010 || sum == 0b1011) encoderValue ++;
  if(sum == 0b1110 || sum == 0b0111 || sum == 0b0001 || sum == 0b1000) encoderValue --;

	if (debug){
		Serial.print("lastencoded: ");
	   Serial.println(lastEncoded);

	   Serial.print("encoded: ");
	   Serial.println(encoded);
	}

  lastEncoded = encoded; //store this value for next time
}
