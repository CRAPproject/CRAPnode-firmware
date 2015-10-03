//
// CRAPnode setup tool
//
//
//
//
// Instructions:
//  1. Enter your WiFi SSID and password below.
//  2. Upload the sketch to the CRAPnode.
//  3. Ground GPIO0 on the ESP8266 module (short bare pads under the ISP connector)
//  4. Update the ESP8266 module using this guide (files are in this folder): http://www.xess.com/blog/esp8266-reflash/
//     Note that you must swap the RX and TX lines of the serial module.
//  5. Unground GPIO0. Uncomment the line below this one.
#define TESTMODE
//  6. Upload to the CRAPnode again and wait for green (pass) LED.
//     If the LED is red, the test has failed.
//     Check your router to see if the CRAPnode has connected.
//     The test is likely to fail if there is no battery.
//


#define SSID "xxx"
#define PASS "12345678"






#include <Wire.h>
#include "RTClib.h"
#include <SoftwareSerial.h>

RTC_DS1307 rtc;

boolean passFailState = 0; // 0 is pass, 1 is fail

#if defined(TESTMODE)

void setup () {
  Serial.begin(115200);
  pinMode(A3, OUTPUT);
  digitalWrite(A3, HIGH);
  ledTest();
  //if (rtcTest()) if (!passFailState) passFailState = 1;
  if (wifiTest()) if (!passFailState) passFailState = 1;
  delay(100);
  if (passFailState) digitalWrite(2, HIGH);
  else digitalWrite(8, HIGH);
}

void loop() {
}

void ledTest() {
  pinMode(2, OUTPUT);
  pinMode(8, OUTPUT);
  for (byte i = 0; i < 20; i++) {
    digitalWrite(2, HIGH);
    digitalWrite(8, LOW);
    delay(50);
    digitalWrite(2, LOW);
    digitalWrite(8, HIGH);
    delay(50);
    digitalWrite(8, LOW);
  }
}

byte rtcTest() {
  Wire.begin();
  rtc.begin();
  rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
  delay(5000);
  DateTime now = rtc.now();
  if (now.second() == 5) return 0;
  else return 1;
}

byte wifiTest() {
  serialFlush();
  Serial.println("AT+RST");
  delay(1000);
  if (Serial.find("ready")) {
    String cmd = "AT+CWJAP=\"";
    cmd += SSID;
    cmd += "\",\"";
    cmd += PASS;
    cmd += "\"";
    Serial.println(cmd);
    return 0;
  }
  else return 1;
}

void serialFlush() {
  while (Serial.available() > 0) {
    char t = Serial.read();
  }
}

#else

// Sets the serial port pins to high impedance and enable the ESP module.

void setup () {
  pinMode(A3, OUTPUT);
  pinMode(0, INPUT);
  pinMode(1, INPUT);
  digitalWrite(A3, HIGH);
}

void loop() {
}

#endif

