import processing.serial.*;

Serial myPort;

PImage bg;

void setup(){
   // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  while (myPort.available() > 0) {
    int inByte = myPort.read();
    println(inByte);
  }
}
