//
const int pot_left = A0, pot_right = A2;
void setup() {
  pinMode(pot_right, INPUT);
  pinMode(pot_left, INPUT);
  Serial.begin(9600);
  Serial.println("Começando...");
  delay(1000);
}

void loop() {

}

int read_bar_right(){
  int pos_right = analogRead(pot_right);
  Serial.println(pos_right)
  return pos_right;
}

int read_bar_left(){
  int pos_left = analogRead(pot_left);
  Serial.println(pos_left)
  return pos_left;
}

