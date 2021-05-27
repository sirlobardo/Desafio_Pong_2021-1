const int led = 13;

void setup(){
  pinMode(led, OUTPUT);
  Serial.begin(9600);
}

void loop(){
  if(Serial.available() > 0){
    char led_state = Serial.read();
    if(led_state == '1'){
      digitalWrite(led, HIGH);
    }
    if(led_state == '0'){
      digitalWrite(led, LOW);
    }
  }
}
