#include <SPI.h> // needed in Arduino 0019 or later
#include "EmonLib.h"
#include <Ethernet.h>

//Emon setup
EnergyMonitor emon1;

// Message to post
String msg = "";
int attempt = 14;
char charmsg[40];
double irms;
String macA = "90-a2-da-oe-93-7d";
double apparentPower;

byte mac[] = { 0x90, 0xA2, 0xDA, 0x0E, 0x93, 0x7D };
byte ip[] = { 192, 168, 10, 103 };
byte server[] = { 192, 168, 10, 102 };
EthernetClient client;

void setup()
{
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Leonardo only
  }  
  
  // start the Ethernet connection:
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // no point in carrying on, so do nothing forevermore:
    // try to congifure using IP address instead of DHCP:
    Ethernet.begin(mac, ip);
  };
  irms = 0;
  apparentPower = 0;
  emon1.current(1, 78); // Current: input pin, calibration.
}

void loop()
{
  delay(5000);
  irms = emon1.calcIrms(10000); // Irms * Voltage 120 
  Serial.print("Current: " + String(irms));
  apparentPower = irms * 120.00;
  //Serial.println(Irms);
  msg = "Your device has consumed " + String(int(apparentPower))+ " Watts.";
  //msg.toCharArray(charmsg, 40);
  Serial.println(msg);
  // give the Ethernet shield a second to initialize:
  delay(1000);
  Serial.println("connecting...");
  // if you get a connection, report back via serial:
  if (client.connect(server, 8084)) {
    Serial.println("connected");
    client.print("GET /EnergyMeter/generalservlet?power=");
    client.print(apparentPower);
    client.print("&macaddress=");
    client.print(macA);
    client.println(" HTTP/1.1");
    client.println("Host: 192.168.10.8");
    client.println("Connection: close");
    client.println();
    Serial.println("stopped");
    client.stop();
  } else {
    Serial.println("connection failed");
  }
}