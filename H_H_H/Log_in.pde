class Log_in {

  PFont myFont;
  PImage myImage;
  PImage Id;
  PImage Password;
  PImage running;
  //PFont sky1;
  float Yspeed;
  float Accelerate;

  int b;
  int c;
  int d;
  float e;

  char [] firstType= {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'};
  char [] SecondType= {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'};
  String [] ThirdType= {"Change", "z", "x", "c", "v", "b", "n", "m", "Delete"};
  String [] ForthType= {"123", "none", "none", "space", "search"};

  Log_in() {

    myFont= loadFont("CalistoMT-48.vlw");
    myImage= loadImage("login1.JPG");
    Id= loadImage("id.png");
    Password= loadImage("password.png");
    running= loadImage("running1.jpg");
    Yspeed=0;
    Accelerate=0;

    b=0;
    c=0;
    d=0;
    e=0;
  }

  void display() {

    textAlign(CENTER, CENTER);
    textLeading(40);
    textFont(myFont, 28);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////background

    rectMode(CORNER);

    tint(150, 200);
    image(running, 0, 0, width, height/3);

    image(myImage, 0, 0, width, height/3); 

    fill(255);
    rect(0, 300, 600, 600);

    ////////////////////////////////////////////////////////////////////////////////////////////////////////log in display

    rectMode(CENTER);
    fill(255, 120);

    noStroke();
    rect(width/2, height/5.5+Yspeed/6, width/2.5, height/5);

    fill(255);  
    text("H.H.H", width/2, height/20+Yspeed/6);

    stroke(0);
    strokeWeight(0.3);
    line(width/2-width/5, height/5.5-height/20+Yspeed/6, width/2+width/5, height/5.5-height/20+Yspeed/6);
    line(width/2-width/5, height/5.5+Yspeed/6, width/2+width/5, height/5.5+Yspeed/6);

    fill(62, 114, 155);
    noStroke();
    rect(width/2, height/4+Yspeed/6, width/2.8, height/25);

    fill(255, 120);
    textFont(myFont, 18);
    text("Login", width/2, height/4+Yspeed/6);

    tint(184, 202, 250, 200);

    image(Id, width/2-width/5.6, height/5.5-height/11+Yspeed/6, 30, 30);
    image(Password, width/2-width/5.5, height/5.5-height/23+Yspeed/6, 35, 35);
    noTint();


    ///////////////////////////////////////////////////////////////////////////////////////////////////key board
  }

  void move() {

    Accelerate+=0.05;
    if (Accelerate>2) {

      Accelerate=0;
    }

    rectMode(CORNER);
    fill(20);
    rect(0, 300+Yspeed, 600, 150);////////////// total frame

    b=0;
    d=0;

    for (float y= 302.5+Yspeed; y<450+Yspeed; y=y+37.5) {

      b++;/////////////////////////distribution method

      if (b==1) {

        c=10;////////////////////rectangle count
        d=0;/////////////////////initial start
        e=1;
      } else if (b==2) {

        c=9;
        d=30;
        e=1;
      } else if (b==3) {

        c=9;
        d=30;
        e=1;
      } else if (b==4) {

        c=7;/////////////exception
        d=0;
        e=1.66;
      }

      println("mouseX:"+mouseX+"mouseY"+mouseY);
      for (float x= 2.5+d; x<60*c; x=x+60*e) {

        fill(102, 120, 142, 80);

        if (e==1.66 && x >=210 && x <310) {

          rect(x, y, 180, 32.5);/////////////////4th space bar
          fill(225, 200);//////////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[3], 390, 430+Yspeed);
        } else if (e==1.66 && x >=310) {

          rect(x+100, y, 96, 32.5);/////////////////4th return
          fill(225, 50);///////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[4], 550, 430+Yspeed);
        } else if (e==1.66 && x <80) {

          rect(x, y, 80, 32.5);//////////////////4th others
          fill(225);///////////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[0], 40, 430+Yspeed);
        } else if (e==1.66 && x <180) {

          rect(x, y, 80, 32.5);//////////////////4th others
          fill(225);///////////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[1], 140, 430+Yspeed);
        } else if (e==1.66 && x <280) {

          rect(x, y, 80, 32.5);//////////////////4th others
          fill(225);///////////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[2], 240, 430+Yspeed);
        } else {
          rect(x, y, 55, 32.5);//////////////////each of typing
          fill(225, 50);

          for (int i=0; i<10; i++) {
            text(firstType[i], 27.5+2.5+60*i, 315+Yspeed);//good
          }

          for (int i=0; i<9; i++) {
            text(SecondType[i], 27.5*2+2.5*2+60*i, 355+Yspeed);//good
          }
          for (int i=0; i<9; i++) {
            text(ThirdType[i], 27.5*2+2.5*2+60*i, 393+Yspeed);//good
          }
        }



        if (Click==true) {

          Yspeed=Yspeed-Accelerate;
          //Accelerate++;

          if (y<=152.5) {

            Yspeed=-150;
            Accelerate=0;
          }
        } else if (Click==false) {

          Yspeed=Yspeed+Accelerate;
          //Accelerate++;

          if (y>=415) {
            //452.5
            Yspeed=0;
            Accelerate=0;
          }
        }
      }
    }
  }
}
