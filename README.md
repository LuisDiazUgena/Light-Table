# Light-Table

Light Table design files & Firmware

##Arduino shield

<img src="pcb_layout.png" alt="Curso de introducción a MIT App Inventor" width="100%" align = "center" />

Arduino shield drives from 12V DC Jack (Center positive) and power Arduino through a voltage regulator (LM7805) with decoupling caps. Works with pwm to control Mosfets (IRF3205) (Up to 1.2A/Mosfet).

##Arduino Firmware

**To-Do**

Control each color with the encoder.

Control each color over Bluetooth and Android/Protocoder App.

##Hardware Used

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
</style>
<table class="tg">
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
