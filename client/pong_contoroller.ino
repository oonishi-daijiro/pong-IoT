#define BUTTON_PIN_MOVEUP 5
#define BUTTON_PIN_MOVEDOWN 21
#define GAME_FPS 60

void setup() {
  Serial.begin(115200);
  pinMode(BUTTON_PIN_MOVEDOWN, INPUT);
  pinMode(BUTTON_PIN_MOVEUP, INPUT);
}

void loop() {
  int buttonStateBlue = digitalRead(BUTTON_PIN_MOVEDOWN);
  int buttonStateRed = digitalRead(BUTTON_PIN_MOVEUP);

  if (buttonStateBlue == HIGH) {
    Serial.print(1);
  } else {
    Serial.print(0);
  }

  if (buttonStateRed == HIGH) {
    Serial.print(1);
  } else {
    Serial.print(0);
  }

  if (buttonStateBlue == HIGH && buttonStateRed == HIGH) {
    Serial.print(1);
  } else {
    Serial.print(0);
  }

  Serial.println();
  delay(25); 
}
