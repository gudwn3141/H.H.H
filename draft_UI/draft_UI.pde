PFont myFont;
PImage myImage;
PImage Id;
PImage Password;
PImage running;
//PFont sky1;

void setup() {

  size(600, 900);
  myFont= loadFont("CalistoMT-48.vlw");
  myImage= loadImage("login1.JPG");
  Id= loadImage("id.png");
  Password= loadImage("password.png");
  //imageMode(CENTER);
  running= loadImage("running1.jpg");
}

void draw() {

  background(0);
  textAlign(CENTER, CENTER);
  textLeading(40);
  textFont(myFont, 28);

  rectMode(CORNER);
  //fill(23, 53, 134);
  //rect(0, 0, 600, 300);


  tint(150, 200);
  image(running, 0, 0, width, height/3);

  image(myImage, 0, 0, width, height/3); 

  fill(255);
  rect(0, 300, 600, 600);



  fill(255, 120);

  rectMode(CENTER);
  noStroke();
  rect(width/2, height/5.5, width/2.5, height/5);

  fill(255);  
  text("H.H.H", width/2, height/20);

  stroke(0);
  strokeWeight(0.3);
  line(width/2-width/5, height/5.5-height/20, width/2+width/5, height/5.5-height/20);
  line(width/2-width/5, height/5.5, width/2+width/5, height/5.5);

  //textFont(myFont, 24);
  //text("Id.", width/2-width/5, height/5.5-height/14);
  //text("Password", width/2, height/4);

  //fill(255);


  //fill(17, 40, 103);
  //fill(26, 54, 129);
  //fill(26, 40, 80);
  //fill(50, 91, 124);//good
  fill(62, 114, 155);
  noStroke();
  rect(width/2, height/4, width/2.8, height/25);

  fill(255, 120);
  textFont(myFont, 18);
  text("Login", width/2, height/4);

  tint(184, 202, 250, 200);

  image(Id, width/2-width/5.6, height/5.5-height/11, 30, 30);
  image(Password, width/2-width/5.5, height/5.5-height/23, 35, 35);
  noTint();

  fill(180);
  rectMode(CORNER);
  rect(0, 300, 600, 300);
  /*
  rectMode(CENTER);
   for (int x=30; x<600; x=x+60) {
   for (float y=337.5; y<600; y=y+75) {
   
   fill(255);
   rect(x, y, 50, 65);
   }
   }
   
   */

  //rectMode(CENTER);
  fill(20);
  rect(0, 150, 600, 150);



  fill(102, 120, 142, 80);
  for (float x= 2.5; x<60*10; x=x+60*1) {

    for (float y= 152.5; y<300; y=y+37.5) {
      
      rect(x, y, 55, 32.5);
      
    }
  }
  
  for (float x= 2.5; x<60*10; x=x+60*1) {

    for (float y= 152.5; y<300; y=y+37.5) {
      
      rect(x, y, 55, 32.5);
      
    }
  }
}
