EESchema Schematic File Version 2
LIBS:LightTable-rescue
LIBS:attiny
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:icsp
LIBS:arduino_shieldsNCL
LIBS:encoder_5_pins
LIBS:borniers
LIBS:IRF3205
LIBS:ab2_terminal_block
LIBS:LightTable-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 4800 2950 0    60   Input ~ 0
GND
Text GLabel 8750 3550 2    60   Input ~ 0
VCC
$Comp
L LM7805 U4
U 1 1 558438B8
P 9450 1800
F 0 "U4" H 9600 1604 60  0000 C CNN
F 1 "LM7805" H 9450 2000 60  0000 C CNN
F 2 "" H 9450 1800 60  0001 C CNN
F 3 "" H 9450 1800 60  0000 C CNN
	1    9450 1800
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR01
U 1 1 55843A96
P 8250 1750
F 0 "#PWR01" H 8250 1600 60  0001 C CNN
F 1 "+12V" H 8250 1890 60  0000 C CNN
F 2 "" H 8250 1750 60  0000 C CNN
F 3 "" H 8250 1750 60  0000 C CNN
	1    8250 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1750 9050 1750
Text GLabel 9450 2600 3    60   Input ~ 0
GND
Wire Wire Line
	9450 2050 9450 2600
$Comp
L C-RESCUE-LightTable C1
U 1 1 55843C24
P 8700 2150
F 0 "C1" H 8750 2250 50  0000 L CNN
F 1 "330nF" H 8750 2050 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 8738 2000 30  0001 C CNN
F 3 "" H 8700 2150 60  0000 C CNN
	1    8700 2150
	-1   0    0    1   
$EndComp
Connection ~ 9450 2400
$Comp
L C-RESCUE-LightTable C2
U 1 1 55843F41
P 10200 2150
F 0 "C2" H 10250 2250 50  0000 L CNN
F 1 "100nF" H 10250 2050 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 10238 2000 30  0001 C CNN
F 3 "" H 10200 2150 60  0000 C CNN
	1    10200 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 2400 10200 2350
Text GLabel 10700 1750 2    60   Input ~ 0
V5
Wire Wire Line
	10700 1750 9850 1750
Wire Wire Line
	10200 1950 10200 1750
Connection ~ 10200 1750
Wire Wire Line
	8700 1750 8700 1950
Connection ~ 8700 1750
Wire Wire Line
	8700 2350 8700 2400
Wire Wire Line
	8700 2400 10200 2400
$Comp
L ARDUINO_SHIELD SHIELD1
U 1 1 55CB5DD9
P 6000 3050
F 0 "SHIELD1" H 5650 4000 60  0000 C CNN
F 1 "ARDUINO_SHIELD" H 6050 2100 60  0000 C CNN
F 2 "arduino_shields:ARDUINO_SHIELD_2_040pins" H 6000 3050 60  0001 C CNN
F 3 "" H 6000 3050 60  0000 C CNN
	1    6000 3050
	1    0    0    -1  
$EndComp
Text GLabel 4800 3150 0    60   Input ~ 0
V5
Wire Wire Line
	4800 3150 5050 3150
Wire Wire Line
	4800 2950 5050 2950
Wire Wire Line
	5050 3050 4900 3050
Wire Wire Line
	4900 3050 4900 2950
Connection ~ 4900 2950
Text GLabel 7250 2350 2    60   Input ~ 0
GND
Wire Wire Line
	7250 2350 6950 2350
$Comp
L ENCODER_5_PINS EN1
U 1 1 55CB78CE
P 8000 3650
F 0 "EN1" H 8150 3950 60  0000 C CNN
F 1 "ENCODER_5_PINS" H 8000 3350 60  0000 C CNN
F 2 "" H 8000 3650 60  0001 C CNN
F 3 "" H 8000 3650 60  0000 C CNN
	1    8000 3650
	1    0    0    -1  
$EndComp
Text GLabel 7350 3950 3    60   Input ~ 0
GND
Wire Wire Line
	7500 3650 7350 3650
Wire Wire Line
	7350 3650 7350 3950
Wire Wire Line
	7500 3550 6950 3550
Wire Wire Line
	7500 3750 7200 3750
Wire Wire Line
	7200 3750 7200 3650
Wire Wire Line
	7200 3650 6950 3650
Wire Wire Line
	8750 3550 8500 3550
$Comp
L R R1
U 1 1 55CB81A3
P 8750 4050
F 0 "R1" V 8830 4050 50  0000 C CNN
F 1 "10K" V 8750 4050 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 8680 4050 30  0001 C CNN
F 3 "" H 8750 4050 30  0000 C CNN
	1    8750 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3750 8750 3750
Wire Wire Line
	8750 3750 8750 3900
Text GLabel 8750 4400 3    60   Input ~ 0
PBtn
Wire Wire Line
	8750 4400 8750 4200
Text GLabel 7200 3150 2    60   Input ~ 0
PBtn
Wire Wire Line
	7200 3150 6950 3150
$Comp
L +12V #PWR02
U 1 1 55CB8DF3
P 7150 1200
F 0 "#PWR02" H 7150 1050 60  0001 C CNN
F 1 "+12V" H 7150 1340 60  0000 C CNN
F 2 "" H 7150 1200 60  0000 C CNN
F 3 "" H 7150 1200 60  0000 C CNN
	1    7150 1200
	0    1    1    0   
$EndComp
Text GLabel 7100 1400 2    60   Input ~ 0
GND
$Comp
L MosfetIRF U1
U 1 1 55CB92F6
P 2100 2600
F 0 "U1" H 2250 2404 60  0000 C CNN
F 1 "MosfetIRF" H 2100 2800 60  0000 C CNN
F 2 "" H 2100 2600 60  0001 C CNN
F 3 "" H 2100 2600 60  0000 C CNN
	1    2100 2600
	1    0    0    -1  
$EndComp
Text GLabel 1550 2550 0    60   Input ~ 0
PWM_R
Text GLabel 2700 2550 2    60   Input ~ 0
GND
Wire Wire Line
	2700 2550 2500 2550
Wire Wire Line
	7250 2850 6950 2850
Wire Wire Line
	2100 2850 2100 2950
$Comp
L CONN_3_V K1
U 1 1 55CB9A92
P 3600 3500
F 0 "K1" H 3500 3750 50  0000 C CNN
F 1 "CONN_3_V" H 3600 3690 40  0000 C CNN
F 2 "borniers:bornier3_V" H 3600 3500 60  0001 C CNN
F 3 "" H 3600 3500 60  0000 C CNN
	1    3600 3500
	0    -1   -1   0   
$EndComp
Text GLabel 2100 2950 3    60   Input ~ 0
R
Text GLabel 7250 2850 2    60   Input ~ 0
PWM_R
Wire Wire Line
	1550 2550 1700 2550
Text GLabel 3500 3950 3    60   Input ~ 0
R
Wire Wire Line
	3500 3950 3500 3850
Text GLabel 3600 3950 3    60   Input ~ 0
G
Wire Wire Line
	3600 3950 3600 3850
Text GLabel 3700 3950 3    60   Input ~ 0
B
Wire Wire Line
	3700 3950 3700 3850
$Comp
L MosfetIRF U2
U 1 1 55CBA0A7
P 2100 3450
F 0 "U2" H 2250 3254 60  0000 C CNN
F 1 "MosfetIRF" H 2100 3650 60  0000 C CNN
F 2 "" H 2100 3450 60  0001 C CNN
F 3 "" H 2100 3450 60  0000 C CNN
	1    2100 3450
	1    0    0    -1  
$EndComp
Text GLabel 1550 3400 0    60   Input ~ 0
PWM_R
Text GLabel 2700 3400 2    60   Input ~ 0
GND
Wire Wire Line
	2700 3400 2500 3400
Wire Wire Line
	2100 3700 2100 3800
Text GLabel 2100 3800 3    60   Input ~ 0
G
Wire Wire Line
	1550 3400 1700 3400
$Comp
L MosfetIRF U3
U 1 1 55CBA176
P 2100 4250
F 0 "U3" H 2250 4054 60  0000 C CNN
F 1 "MosfetIRF" H 2100 4450 60  0000 C CNN
F 2 "" H 2100 4250 60  0001 C CNN
F 3 "" H 2100 4250 60  0000 C CNN
	1    2100 4250
	1    0    0    -1  
$EndComp
Text GLabel 1550 4200 0    60   Input ~ 0
PWM_R
Text GLabel 2700 4200 2    60   Input ~ 0
GND
Wire Wire Line
	2700 4200 2500 4200
Wire Wire Line
	2100 4500 2100 4600
Text GLabel 2100 4600 3    60   Input ~ 0
B
Wire Wire Line
	1550 4200 1700 4200
$Comp
L BARREL_JACK CON1
U 1 1 55CBA35B
P 6650 1300
F 0 "CON1" H 6650 1550 60  0000 C CNN
F 1 "BARREL_JACK" H 6650 1100 60  0000 C CNN
F 2 "" H 6650 1300 60  0001 C CNN
F 3 "" H 6650 1300 60  0000 C CNN
	1    6650 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1200 6950 1200
Wire Wire Line
	7100 1400 6950 1400
Wire Wire Line
	6950 1300 7050 1300
Wire Wire Line
	7050 1300 7050 1400
Connection ~ 7050 1400
$EndSCHEMATC
