# Light-Table

Light Table design files & Firmware

##Arduino shield

<img src="pcb_layout.png" alt="Curso de introducción a MIT App Inventor" width="100%" align = "center" />

Arduino shield drives from 12V DC Jack (Center positive) and power Arduino through a voltage regulator (LM7805) with decoupling caps. Works with pwm to control Mosfets (IRF3205) (Up to 1.2A/Mosfet).

##Arduino Firmware

Support single or long click: Single click put FW in color selection mode and long click clears the leds.
Control color over Bluetooth and Android/Protocoder App.

##Android Apps
###Protocoder

Protocoder app is used to control color on the light table over Bluetooth. You can download both code and project from Android apps folder.

###App Inventor

**To-Do**.

##Hardware Used

<table>
  <tr>
    <th class="tg-031e">Reference</th>
    <th class="tg-031e">Value</th>
  </tr>
  <tr>
    <td class="tg-031e">C1</td>
    <td class="tg-031e">100uF</td>
  </tr>
  <tr>
    <td class="tg-031e">C2</td>
    <td class="tg-031e">10uF</td>
  </tr>
  <tr>
    <td class="tg-031e">CON1</td>
    <td class="tg-031e">BARREL_JACK</td>
  </tr>
  <tr>
    <td class="tg-031e">D1</td>
    <td class="tg-031e">PWR</td>
  </tr>
  <tr>
    <td class="tg-031e">EN1</td>
    <td class="tg-031e">ENCODER_5_PINS</td>
  </tr>
  <tr>
    <td class="tg-031e">P1</td>
    <td class="tg-031e">Screw Block 2</td>
  </tr>
  <tr>
    <td class="tg-031e">P8</td>
    <td class="tg-031e">Screw Block 4</td>
  </tr>
  <tr>
    <td class="tg-031e">R1</td>
    <td class="tg-031e">10K</td>
  </tr>
  <tr>
    <td class="tg-031e">R2</td>
    <td class="tg-031e">330</td>
  </tr>
  <tr>
    <td class="tg-031e">SHIELD1</td>
    <td class="tg-031e">ARDUINO_SHIELD</td>
  </tr>
  <tr>
    <td class="tg-031e">U1</td>
    <td class="tg-031e">IRF3205</td>
  </tr>
  <tr>
    <td class="tg-031e">U2</td>
    <td class="tg-031e">IRF3205</td>
  </tr>
  <tr>
    <td class="tg-031e">U3</td>
    <td class="tg-031e">IRF3205</td>
  </tr>
  <tr>
    <td class="tg-031e">U4</td>
    <td class="tg-031e">LM7805</td>
  </tr>
</table>

##Issues

Inefficient power regulation (n = 0.41667). Generates so much heat. Solutions:

1. Will change Lm7805 module to 78XXSR Murata switching regulator.
2. Add a heatsink (Still to much heat) and a fan.

By using a efficient power regulation will not need to use heatsink and/or fan.
