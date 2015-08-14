/*
*   
*   Description: Control Light Table with Arduino and Protocoder over bluetooth 
*
*/

ui.toolbar.title("Light Table Control");
ui.toolbar.bgColor(55, 155, 155, 150);
//ui.backgroundColor("#298A08"); // medium green
ui.toolbar.show(true);
//ui.screenMode("fullscreen");
ui.screenOrientation("portrait");

var btClient;
var sendString= "0,0,0",string="0,0,0", hexString="000";
var btStatus = false;
var margin = 10;
var w = ui.screenWidth - 2*margin;
var h = 150;


var btnConnect = ui.addButton("Connect to bluetooth", margin,0,w, h).onClick(function() {
    //if you want to use the Bluetooth Address, use 
    //network.bluetooth.connectSerial(macAddess, function(status) {});
    btClient = network.bluetooth.connectSerial(function(status) {
        console.log("connected " + status);
        if (status === true){
            btStatus = true;
            ui.toast("Connected!");
            btnConnect.setAlpha(0);
            btnDisconnect.setAlpha(255);
        }
    });
});

var btnDisconnect = ui.addButton("Disconnect",margin,h, w, h).onClick(function() {
    if (btStatus === true ) {
        btClient.disconnect();
        btStatus = false;
        ui.toast("Disconnected!");
        btnConnect.setAlpha(255);
        btnDisconnect.setAlpha(0);   
    }else{
        ui.toast("Not Connected");
    }
});
var red=0,green=0,blue=0;

function modifySliders(newRed,newGreen,newBlue){
    red = Math.floor(newRed);
    green = Math.floor(newGreen);
    blue = Math.floor(newBlue);
    
    sendString = red +","+ green +","+ blue;
    string = red +","+ green +","+ blue;
    colorDec.setText(string);
    hexString = red.toString(16) + green.toString(16) + blue.toString(16);
    hexString = hexString.toUpperCase();
    colorHex.setText(hexString);
    
}

var redLabel = ui.addText("R",margin,2*h+margin,w,w);
redLabel.color("#000000");
var sliderRed = ui.addSlider(4*margin, 2*h, w, 20, 0, 255).onChange(function(val) { 
    modifySliders(val,blue,green);
});


var greenLabel = ui.addText("G",margin,3*h+margin,w,w);
greenLabel.color("#000000");
var sliderGreen = ui.addSlider(4*margin, 3*h, w, 20, 0, 255).onChange(function(val) { 
    modifySliders(red,val,blue);
});

var blueLabel = ui.addText("B",margin,4*h+margin,w,w);
blueLabel.color("#000000");
var sliderBlue = ui.addSlider(4*margin, 4*h, w, 20, 0, 255).onChange(function(val) { 
    modifySliders(red,green,val);
});

var whiteLabel = ui.addText("W",4,5*h+margin,w,w);
whiteLabel.color("#000000");
var sliderWhite = ui.addSlider(4*margin,5*h,w,20,0,255).onChange(function(val){
    modifySliders(val,val,val);
    
    sliderRed.setValue(val);
    sliderGreen.setValue(val);
    sliderBlue.setValue(val);
    
});

var canvas = ui.addCanvas(margin, 7.9*h, w-h-margin, h-margin);
canvas.loopDraw(35, function() {
    canvas.fill(red,green,blue,10);
    canvas.rect(0, 0, ui.screenWidth, 500);
});

function randomInt(){
    var int = Math.random()*255;
    int = Math.floor(int);
    return int;
}

var randomButton = ui.addButton("?",w-h,7.9*h,h,h).onClick(function(val) { 
    red = randomInt();
    green = randomInt();
    blue = randomInt();
    sliderRed.setValue(red);
    sliderGreen.setValue(green);
    sliderBlue.setValue(blue);
    sendString = red +","+ green +","+ blue;
    string = red +","+ green +","+ blue;
    colorDec.setText(string);
    hexString = red.toString(16)+green.toString(16)+blue.toString(16);
    hexString = hexString.toUpperCase();
    colorHex.setText(hexString);   
    autoSend();
}); 


var colorDecLabel = ui.addText("Dec = ", margin, 9*h, 2*w, h);
var colorDec = ui.addText(string,h, 9*h, 2*w, h);
var colorHexLabel = ui.addText("Hex = ", margin, 9.5*h, 2*w, h);
var colorHex = ui.addText(hexString,h, 9.5*h, 2*w, h);

colorDecLabel.color("#000000");
colorDec.color("#000000");
colorHexLabel.color("#000000");
colorHex.color("#000000");


var btnSend = ui.addButton("Send", margin, 10*h, w, h).onClick(function() {
    if (btStatus === true){
        ui.jump(btnSend);
        btClient.send(sendString +"\n");
        console.log(sendString);
        ui.toast("Sended!");
    }else{
        ui.toast("¡Not connected!");
    }
});
