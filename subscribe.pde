import mqtt.*;

MQTTClient client;

void setup() {
 client = new MQTTClient(this);
 client.connect("tcp://broker.hivemq.com:1883", "processing");
 client.subscribe("foo/bar");
 // client.unsubscribe("/example");
}

void draw() {
}

void keyPressed() {
 client.publish("/hello", "world");
}

void messageReceived(String topic, byte[] payload) {
 println("new message: " + topic + " - " + new String(payload));
}
