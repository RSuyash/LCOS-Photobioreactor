// Include libraries
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// Define pin connections
#define TURBIDITY_SENSOR_PIN A0
#define LED_PIN D0
#define AERATOR_PUMP_PIN D1
#define MEDIA_PUMP_PIN D2
#define HARVEST_PUMP_PIN D3
#define OLED_RESET     -1
#define SCREEN_ADDRESS 0x3C

// Photobioreactor parameters
const int turbidityThreshold = 500;
const unsigned long harvestDuration = 10000;
const unsigned long delayAfterHarvest = 3000;
const unsigned long mediaDuration = 10000;
const unsigned long cooldownPeriod = 60000; // 1 minute in milliseconds
const int harvestPumpSpeed = 255;
const int mediaPumpSpeed = 10;
const int bubblerSpeed = 255;
const int ledBrightness = 50;
const unsigned long mediaPumpCooldown = 60000; // 1 minute

// State variables
String currentStatus = "Idle";
int progressBarValue = 0;
unsigned long lastHarvestTime = 0;
bool mediaPumpedRecently = false;
unsigned long lastMediaPumpTime = 0;

// OLED display setup
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

void setup() {
  // Initialize serial communication
  Serial.begin(115200);
  Serial.println("ATmega328 is ready"); // Add this line for testing

  // Set pin modes
  pinMode(harvestPumpPin, OUTPUT);
  pinMode(mediaPumpPin, OUTPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(bubblerPin, OUTPUT);

  // Initialize the OLED display
  if (!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for (;;);
  }

  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0, 0);
  display.println("Algae Control System");
  display.println("Initialized");
  display.display();
  delay(2000);

  // Set initial LED and bubbler states
  analogWrite(ledPin, ledBrightness);
  analogWrite(bubblerPin, bubblerSpeed);
}

void loop() {
  // Read the turbidity sensor (using potentiometer for testing)
  int turbidityValue = analogRead(potentiometerPin);
  updateDisplay(turbidityValue);
  
  // Send turbidity value to ESP8266
  sendTurbidityToESP(turbidityValue);

  // Check turbidity and trigger harvesting
  if (turbidityValue > turbidityThreshold && currentStatus == "Idle" && (millis() - lastHarvestTime > cooldownPeriod)) {
    if (!mediaPumpedRecently) {
      harvest();
      delay(delayAfterHarvest);
      addMedia();
      lastHarvestTime = millis();
      mediaPumpedRecently = true;
      lastMediaPumpTime = millis();
    }
  }

  // Reset media pump status after cooldown
  if (mediaPumpedRecently && (millis() - lastMediaPumpTime > mediaPumpCooldown)) {
    mediaPumpedRecently = false;
  }

  delay(1000); // Delay for 1 second
}

void harvest() {
  currentStatus = "Harvesting";
  analogWrite(harvestPumpPin, harvestPumpSpeed);
  
  unsigned long startTime = millis();
  while (millis() - startTime < harvestDuration) {
    progressBarValue = map(millis() - startTime, 0, harvestDuration, 0, 128);
    updateDisplay(analogRead(potentiometerPin));
    delay(100);
  }
  
  analogWrite(harvestPumpPin, 0);
  progressBarValue = 0;
  currentStatus = "Idle";
}

void addMedia() {
  currentStatus = "Adding Media";
  analogWrite(mediaPumpPin, mediaPumpSpeed);
  
  unsigned long startTime = millis();
  while (millis() - startTime < mediaDuration) {
    progressBarValue = map(millis() - startTime, 0, mediaDuration, 0, 128);
    updateDisplay(analogRead(potentiometerPin));
    delay(100);
  }
  
  analogWrite(mediaPumpPin, 0);
  progressBarValue = 0;
  currentStatus = "Idle";
}

void updateDisplay(int turbidity) {
  display.clearDisplay();
  display.setCursor(0, 0);
  display.print("Turbidity: ");
  display.println(turbidity);
  display.print("Status: ");
  display.println(currentStatus);

  display.drawRect(0, 40, 128, 10, SSD1306_WHITE);
  display.fillRect(0, 40, progressBarValue, 10, SSD1306_WHITE);

  display.display();
  Serial.print("Turbidity: ");
  Serial.print(turbidity);
  Serial.print(" | Status: ");
  Serial.println(currentStatus);
}

void sendTurbidityToESP(int turbidity) {
  // Send the turbidity value to the ESP8266
  Serial.print("Turbidity: ");
  Serial.println(turbidity);
}


