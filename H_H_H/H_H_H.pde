Log_in login;

boolean Click;

void setup() {

  size(600, 900);
  login= new Log_in();
  Click= false;
}

void draw() {

  background(0);

  login.display();
  login.move();




  //println("X:"+mouseX+"Y:"+mouseY+"Click:"+Click+"Accel:"+Accelerate+"Yspeed:"+Yspeed);
}

void mousePressed() {

  if ((225< mouseX && mouseX <415) && (80< mouseY && mouseY <160)) {

    Click=true;
  } else if (Click==true && (0< mouseY && mouseY< 150) && ((0< mouseX && mouseX<180) || (420<mouseX && mouseX<600))) {

    Click=false;
  } else if (Click==true &&(180<mouseX&&mouseX<420) && (0<mouseY && mouseY<48)) {
    Click=false;
  }
}
