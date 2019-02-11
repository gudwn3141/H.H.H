import mqtt.*;

MQTTClient client;
String a = null;
void setup() {
  client = new MQTTClient(this);
  client.connect("mqtt://try:try@broker.shiftr.io", "processing");
}

void draw() {
  text(a,50,50);
}

void keyPressed() {
  client.publish("/hello", "world");
}

void clientConnected() {
  println("client connected");

  client.subscribe("/hello");
}

void messageReceived(String topic, byte[] payload) {
  println("new message: " + topic + " - " + new String(payload));
  a= topic;
}

void connectionLost() {
  println("connection lost");
}
