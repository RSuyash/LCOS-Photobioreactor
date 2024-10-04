#include <ESP8266WiFi.h>
#include <WiFiClientSecure.h> // Include for HTTPS

// Replace with your network credentials
const char* ssid = "Your WiFi SSID";       // Your WiFi SSID
const char* password = "Your WiFi SSID"; // Your WiFi Password

// Server details
const char* server = "xyz.com";  // Your server address
const char* endpoint = "/PBR/turbidity_data.php"; // PHP script path

void setup() {
    Serial.begin(115200);
    delay(10);

    // Connect to WiFi
    Serial.println();
    Serial.println();
    Serial.print("Connecting to ");
    Serial.println(ssid);
    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }

    Serial.println("");
    Serial.println("WiFi connected");
    Serial.print("IP address: ");
    Serial.println(WiFi.localIP());

    // Send turbidity data
    sendTurbidityData(1111); // Example turbidity value
}

void loop() {
    // Optionally, you can put your loop code here if needed
}

void sendTurbidityData(float turbidity) {
    if (WiFi.status() == WL_CONNECTED) { // Check the WiFi connection
        WiFiClientSecure client; // Create a secure client object

        // Create the URL for the GET request
        String url = String(endpoint) + "?turbidity=" + String(turbidity);

        Serial.print("Connecting to ");
        Serial.println(server);

        // If you get a connection, report back via serial
        if (client.connect(server, 443)) { // Connect using port 443 for HTTPS
            Serial.println("Connected to server");

            // Make an HTTP request
            client.print(String("GET ") + url + " HTTP/1.1\r\n" +
                         "Host: " + server + "\r\n" +
                         "Connection: close\r\n\r\n");
            delay(500);

            // Read response from server
            while (client.available()) {
                String line = client.readStringUntil('\n');
                Serial.println(line);
            }

            Serial.println("Data sent successfully");
        } else {
            Serial.println("Connection to server failed");
        }
    } else {
        Serial.println("WiFi not connected");
    }
}
