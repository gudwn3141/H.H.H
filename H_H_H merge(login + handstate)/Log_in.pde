class Log_in {

  StringBuffer pw;
  StringBuffer id;
  int log_pw; //log, pw choice
  boolean numberver;
  int idIndex;
  int pwIndex;

  ArrayList<KSkeleton> skeletonArray;
  KSkeleton skeleton;


  PFont myFont;
  PImage myImage;
  PImage Id;
  PImage Password;
  PImage running;
  //PFont sky1;
  float Yspeed;
  float Accelerate;
  KJoint joint;  
  int b;
  int c;
  int d;
  float e;

  char [] firstType= {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'};
  char [] SecondType= {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'};
  String [] ThirdType= {"change", "z", "x", "c", "v", "b", "n", "m", "delete"};
  String [] ForthType= {"123", "none", "none", "space", "search"};

  Log_in() {

    myFont= loadFont("CalistoMT-48.vlw");
    myImage= loadImage("login1.JPG");
    Id= loadImage("id.png");
    Password= loadImage("password.png");
    running= loadImage("running1.jpg");
    Yspeed=0;
    Accelerate=0;
    joint = null;

    idIndex=255;
    pwIndex=255;
    skeletonArray = new ArrayList<KSkeleton>();
    b=0;
    c=0;
    d=0;
    e=0;

    id = new StringBuffer();
    pw = new StringBuffer();
    log_pw= 0; //log, pw choice



    numberver = false;
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

  void write(KJoint joint) {
    float x=0;
    float y = 0;
    String text = "";
    //if(handver == true){
    x = joint.getX();
    y = joint.getY();
    //handver = false;
    //}
    if (0<=x && x<60 && 150<=y && y<187.5) text = (numberver) ? "1" : "q";
    else if (60<x && x<120 && 150<y && y<187.5) text = (numberver) ? "2" : "w";
    else if (120<x && x<180 && 150<y && y<187.5) text = (numberver) ? "3" : "e";
    else if (180<x && x<240 && 150<y && y<187.5) text = (numberver) ? "4" : "r";
    else if (240<x && x<300 && 150<y && y<187.5) text = (numberver) ? "5" : "t";
    else if (300<x && x<360 && 150<y && y<187.5) text = (numberver) ? "6" : "y";
    else if (360<x && x<420 && 150<y && y<187.5) text = (numberver) ? "7" : "u";
    else if (420<x && x<480 && 150<y && y<187.5) text = (numberver) ? "8" : "i";
    else if (480<x && x<540 && 150<y && y<187.5) text = (numberver) ? "9" : "o";
    else if (540<x && x<=600 && 150<y && y<187.5) text = (numberver) ? "0" : "p";
    else if (30<x && x<90 && 187.5<y && y<225) text = "a";
    else if (90<x && x<150 && 187.5<y && y<225) text = "s";
    else if (150<x && x<210 && 187.5<y && y<225) text = "d";
    else if (210<x && x<270 && 187.5<y && y<225) text = "f";
    else if (270<x && x<330 && 187.5<y && y<225) text = "g";
    else if (330<x && x<390 && 187.5<y && y<225) text = "h";
    else if (390<x && x<450 && 187.5<y && y<225) text = "j";
    else if (450<x && x<510 && 187.5<y && y<225) text = "k";
    else if (510<x && x<570 && 187.5<y && y<225) text = "l";
    else if (30<x && x<90 && 225<y && y<262.5) text = "capslock";
    else if (90<x && x<150 && 225<y && y<262.5) text = "z";
    else if (150<x && x<210 && 225<y && y<262.5) text = "x";
    else if (210<x && x<270 && 225<y && y<262.5) text = "c";
    else if (270<x && x<330 && 225<y && y<262.5) text = "v";
    else if (330<x && x<390 && 225<y && y<262.5) text = "b";
    else if (390<x && x<450 && 225<y && y<262.5) text = "n";
    else if (450<x && x<510 && 262.5<y && y<=300) text = "m";
    else if (510<x && x<570 && 262.5<y && y<=300) text = "back";
    else if (2<x && x<82 && 262.5<y && y<=300) text = "number";
    else if (102<x && x<182 && 262.5<y && y<=300) text = "language";
    else if (202<x && x<282 && 262.5<y && y<=300) text = "china";
    else if (302<x && x<482 && 262.5<y && y<=300) text = " ";
    else if (502 <x && x<598 && 262.5<y && y<=300) text = "return";
    //fill(255,0,0);
    //text("ok",420,80);
    if (text.equals("back")) {
      if (log_pw==1) {
        if (id.length() != 0) {
          //stIndex-=10;
          id.deleteCharAt(id.length()-1);
          //text("",idIndex,80);
        }
      } else if (log_pw==2) {
        if (pw.length() != 0 ) {
          pw.deleteCharAt(id.length()-1);
        }
        //text("",pwIndex+255,125);
      }
    } else if (text.equals("number")) {
      numberver = (numberver) ? false : true;
    } else if (text.equals("language")) {
    } else if (text.equals("china")) {
    } else if (text.equals("return")) {
    } else if (text.equals("capslock")) {
    } else {
      if (log_pw==1) {
        if (id.length()>8) {

          //limit count
        } else {
          fill(255, 0, 0);
          id.append(text);
          id_s = id.toString();
        }
      } else if (log_pw==2) {
        if (pw.length()>8) {
          // limit count
        } else {
          fill(255, 0, 0);
          pw.append(text);
          id_s = id.toString();
        }
      }
    }

    textAlign(CORNER);//////////////////////////////////////////re try

    text(id_s, idIndex, height/5.5-height/11+Yspeed/6);
    text(pw_s, idIndex, height/5.5-height/23+Yspeed/6);
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

      //println("mouseX:"+mouseX+"mouseY"+mouseY);
      for (float x= 2.5+d; x<60*c; x=x+60*e) {

        fill(102, 120, 142, 80);

        if (e==1.66 && x >=210 && x <310) {

          rect(x, y, 180, 32.5);/////////////////4th space bar
          fill(225, 220);//////////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[3], 390, 430+Yspeed);
        } else if (e==1.66 && x >=310) {

          rect(x+100, y, 96, 32.5);/////////////////4th return
          fill(225, 220);///////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[4], 550, 430+Yspeed);
        } else if (e==1.66 && x <80) {

          rect(x, y, 80, 32.5);//////////////////4th others
          fill(225, 220);///////////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[0], 40, 430+Yspeed);
        } else if (e==1.66 && x <180) {

          rect(x, y, 80, 32.5);//////////////////4th others
          fill(225, 220);///////////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[1], 140, 430+Yspeed);
        } else if (e==1.66 && x <280) {

          rect(x, y, 80, 32.5);//////////////////4th others
          fill(225, 220);///////////////////////////////////////////////////////////////////////////////////////////problem
          text(ForthType[2], 240, 430+Yspeed);
        } else {
          rect(x, y, 55, 32.5);//////////////////each of typing
          fill(225, 220);

          if (b==1) {

            //for (int i=0; i<10; i++) {
            //  text(firstType[i], 27.5+2.5+60*i, 315+Yspeed);//good
            //}

            int d= int (x-2.5)/60;
            text(firstType[d], 27.5+2.5+60*d, 315+Yspeed);//good
          } else if (b==2) {

            int d= int (x-32.5)/60;
            //for (int i=0; i<9; i++) {
            //  text(SecondType[i], 27.5*2+2.5*2+60*i, 355+Yspeed);//good
            //}

            text(SecondType[d], 27.5*2+2.5*2+60*d, 355+Yspeed);//good
          } else if (b==3) {

            int d= int (x-32.5)/60;
            //for (int i=0; i<9; i++) {
            //  text(ThirdType[i], 27.5*2+2.5*2+60*i, 393+Yspeed);//good
            //}

            text(ThirdType[d], 27.5*2+2.5*2+60*d, 393+Yspeed);//good
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
joint = null;
        skeletonArray = kinect.getSkeletonColorMap();
        //println(skeletonArray.size());
        for (int i=0; i<skeletonArray.size(); i++) {
          //println("hand");
          skeleton = (KSkeleton) skeletonArray.get(i);

          if (skeleton.isTracked()) {
            KJoint joints[] = skeleton.getJoints();

            //draw different color for each hand state
            //handState= joints[11].getState();
            joint = joints[11];
            //println(joint.getState());
            println("ok");
            //println(joints[11].getX());


            //Draw body
            color col  = skeleton.getIndexColor();
            fill(col);
            stroke(col);

            //drawHandState(joints[11]);
          }
        }
        println(joint.getState());

        if (handstate.drawHandState(joint)) {
          println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
          //KSkeleton skeleton= handstate.skeleton;
          //KJoint joints[] = skeleton.getJoints();
          float xpos= joints[11].getX(); 
          float ypos= joints[11].getY();
          println("xpos = "+xpos+" ypos = "+ypos);
          if ((225< xpos && xpos <415) && (80< ypos+Yspeed && ypos <160+Yspeed)) {

            Click=true;
            if ((225< xpos && xpos <415) && (50< ypos+Yspeed && ypos <92+Yspeed)) {
              log_pw=1;
              write(joints[11]);
            } else if ((225< xpos && xpos <415) && (96< ypos+Yspeed && ypos <135+Yspeed)) {
              log_pw=2;
              write(joints[11]);
            } else {
              log_pw=0;
            }
          } else if (Click==true && (0< ypos+Yspeed && ypos< 150+Yspeed) && ((0< xpos && xpos<180) || (420<xpos && xpos<600))) {

            Click=false;
          } else if (Click==true &&(180<xpos&&xpos<420) && (0<ypos+Yspeed && ypos<48+Yspeed)) {
            Click=false;
          }
        }
      }
    }
  }
}
