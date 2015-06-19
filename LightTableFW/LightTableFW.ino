

/*

Attiny85 based light table --

Firmware

*/

int trimmer = A1, out = 0;
float trimValue = 0, lastTrimValue = 0;
int threeshold = 200;

void setup() {

	pinMode(trimmer, INPUT);
	pinMode(out, OUTPUT);

	digitalWrite(out, LOW);
	test();
}
void loop() {

	trimValue = analogRead(trimmer);
	if (trimValue < (0 + threeshold)) {
		digitalWrite(out, LOW);
	} else if (trimValue > (1023 - threeshold)) {
		digitalWrite(out, HIGH);
	} else if (trimValue != lastTrimValue) {
		analogWrite(out, map(trimValue, 0, 1023, 0, 255));
	}

	lastTrimValue = trimValue;
}

void test() {
	int j;
	for (j = 0; j <= 255; j++) {
		analogWrite(out, j);
		delay(10);
	}
	for (j = 255; j >= 0; j--) {
		analogWrite(out, j);
		delay(10);
	}
}