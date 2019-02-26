/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/
 
 KinectPV2, Kinect for Windows v2 library for processing
 
 3D Skeleton.
 Some features a not implemented, such as orientation
 */
import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;
import de.bezier.data.sql.*;
import static javax.swing.JOptionPane.*;

MySQL msql;

KinectPV2 kinect;
//draft_Ui_fix1
PFont myFont;
PImage myImage;
PImage Id;
PImage Password;
PImage running;
//PFont sky1;
float Yspeed;
float Accelerate;
boolean Click;
boolean log_pw; //log, pw choice 
int b=0;
int c=0;
int d=0;
float e=0;


char [] firstType= {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'}; 

//handstate

StringBuffer id = new StringBuffer();
String id_s = "";
String pw_s = "";
StringBuffer pw = new StringBuffer();
//Stack<Float> st = new Stack<Float>();
int idIndex = 255;
int pwIndex = 255;
boolean handopen = false;
boolean handclose = false;
boolean numberver = false;
String text = "";


float zVal = 300;
float rotX = PI;
float currentAngle=0;
float previousAngle=0;
int count1=0;
int count2=0;
int totalCount=0;
boolean result = true;

int presentTime, totalTime, healthTime, restTime;
Menu login = new Menu();
void setup() {
//draft_Ui_fix1

  size(600, 900, P3D);
  
  myFont= loadFont("CalistoMT-48.vlw");
  myImage= loadImage("login1.JPG");
  Id= loadImage("id.png");
  Password= loadImage("password.png");
  //imageMode(CENTER);
  running= loadImage("running1.jpg");
  Yspeed=0;
  Accelerate=0;
  Click= false;
  
  //handstate
  //size(512, 424, P3D);

  kinect = new KinectPV2(this);
  //kinect.enableDepthMaskImg(true);
  //kinect.enableSkeletonDepthMap(true);
  //kinect.enableSkeleton3DMap(true);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
  kinect.enableSkeleton3DMap(true);

  kinect.init();

  presentTime= millis();


}

void draw() {
  image(kinect.getColorImage(), 0, 0 , 600 , 300);
  //draft_UI_fix1
  //background(0);
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
      } else if (e==1.66 && x >=310) {

        rect(x+100, y, 96, 32.5);/////////////////4th return
      } else if (e==1.66 && x <210) {

        rect(x, y, 80, 32.5);//////////////////4th others
      } else {
        rect(x, y, 55, 32.5);//////////////////each of typing
        fill(225, 50);
        for (int i=0; i<10; i++) {
          text(firstType[i], 27.5+2.5+60*i, 315+Yspeed);//good
          /*  text('w', 27.5+60+2.5, 317+Yspeed);
           text('e', 27.5+120+2.5, 317+Yspeed);
           text('r', 27.5+180+2.5, 317+Yspeed);
           text('t', 27.5+240+2.5, 317+Yspeed);
           text('y', 27.5+300+2.5, 317+Yspeed);
           text('u', 27.5+360+2.5, 317+Yspeed);
           text('i', 27.5+420+2.5, 317+Yspeed);
           text('o', 27.5+480+2.5, 317+Yspeed);
           text('p', 27.5+540+2.5, 317+Yspeed);*/
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
  
  //handstate
  //background(0);


  //image(kinect.getDepthMaskImage(), 0, 0);
  
  //translate the scene to the center 
  //pushMatrix();
  //translate(width/2, height/2, 0);
  //scale(zVal);
  //rotateX(rotX);
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  ArrayList<KSkeleton> skeletonArray2 =  kinect.getSkeleton3d();
  for(int i = 0;i<skeletonArray2.size(); i++){
      KSkeleton skeleton = (KSkeleton) skeletonArray2.get(i);

    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      //draw different color for each hand state


      //Draw body
      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      
      int passedTime= millis()- presentTime;
      healthTime+= passedTime;
    }
  }
  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);

    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      //draw different color for each hand state


      //Draw body
      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      //drawBody(joints);
      //drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
      
      int passedTime= millis()- presentTime;
      healthTime+= passedTime;
    }
  }
  //popMatrix();
  presentTime= millis();

  totalTime= millis();

  restTime= totalTime- healthTime;
  //println("restTime = " +restTime);
  //println("healthtime = " +healthTime);
  
  textAlign(CORNER);
  if(handclose){
    if(log_pw){
      text(id_s,idIndex,height/5.5-height/11+Yspeed/6);
    }else{
      text(pw_s,idIndex,height/5.5-height/23+Yspeed/6);

    handclose = false;
    handopen = false;
    }
  }
  //fill(255, 0, 0);
  //text(frameRate, 50, 50);
}


void drawBody(KJoint[] joints) {

  pushMatrix();///////////////Dumb-bell
  translate(joints[9].getX(), joints[9].getY(), joints[9].getZ());
  float a1 = abs(dist(joints[10].getX(), joints[10].getY(), joints[10].getZ(), joints[8].getX(), joints[8].getY(), joints[8].getZ()));
  float b1 = abs(dist(joints[8].getX(), joints[8].getY(), joints[8].getZ(), joints[9].getX(), joints[9].getY(), joints[9].getZ()));
  float c1 = abs(dist(joints[9].getX(), joints[9].getY(), joints[9].getZ(), joints[10].getX(), joints[10].getY(), joints[10].getZ()));
  float cosa1 = (b1*b1+c1*c1-a1*a1)/(2*b1*c1);
  float degree1 = degrees(acos(cosa1));
  //println("Dumb-bell degree = " +degree1);
  popMatrix();
  text("Dumb-bell degree", 50, 30);
  text(degree1, 50, 50);
  
  ///////////// count
  previousAngle= currentAngle;
  currentAngle= degree1;

  if(result==true){
    if(degree1<40){
      result=false;
    }
  }
  if(result==false){
    if(degree1>160){
      totalCount++;
      result=true;
    }
  }
//  if (currentAngle-previousAngle>0) {

//    if (previousAngle>170) {

//      count1++;
//      currentAngle= 0;
//      previousAngle= 0;
//    }
//  }

//  if (currentAngle-previousAngle<0) {

//    if (previousAngle>20 && previousAngle<30) {

//      count2++;
//      currentAngle= 0;
//      previousAngle= 0;
//    }
//  }

  //totalCount= (count1+count2)/2;
  //println("totalcount = " +totalCount);
  
  //////////////////// total health time
  if(degree1>0){
  
    
  
  }
  
  /////////////////// rest time

  //pushMatrix();///////////////Push-up left
  //translate(joints[5].getX(), joints[5].getY(), joints[5].getZ());
  //float a2 = abs(dist(joints[4].getX(), joints[4].getY(), joints[4].getZ(), joints[6].getX(), joints[6].getY(), joints[6].getZ()));
  //float b2 = abs(dist(joints[6].getX(), joints[6].getY(), joints[6].getZ(), joints[5].getX(), joints[5].getY(), joints[5].getZ()));
  //float c2 = abs(dist(joints[5].getX(), joints[5].getY(), joints[5].getZ(), joints[4].getX(), joints[4].getY(), joints[4].getZ()));
  //float cosa2 = (b2*b2+c2*c2-a2*a2)/(2*b2*c2);
  //float degree2 = degrees(acos(cosa2));
  //println("Push-up left degree = " +degree2);
  //popMatrix();
  //text("Push-up left degree", 100, 30);
  //text(degree2, 100, 50);

  //pushMatrix();///////////////Push-up right
  //translate(joints[9].getX(), joints[9].getY(), joints[9].getZ());
  //float A2 = abs(dist(joints[8].getX(), joints[8].getY(), joints[8].getZ(), joints[10].getX(), joints[10].getY(), joints[10].getZ()));
  //float B2 = abs(dist(joints[10].getX(), joints[10].getY(), joints[10].getZ(), joints[9].getX(), joints[9].getY(), joints[9].getZ()));
  //float C2 = abs(dist(joints[9].getX(), joints[9].getY(), joints[9].getZ(), joints[8].getX(), joints[8].getY(), joints[8].getZ()));
  //float cosA2 = (B2*B2+C2*C2-A2*A2)/(2*B2*C2);
  //float deGree2 = degrees(acos(cosA2));
  //println("Push-up right degree = " +deGree2);
  //popMatrix();
  //text("Push-up right degree", 100, 80);
  //text(degree2, 100, 100);


  //pushMatrix();///////////////Shoulder left
  //translate(joints[4].getX(), joints[4].getY(), joints[4].getZ());
  //float a3 = abs(dist(joints[20].getX(), joints[20].getY(), joints[20].getZ(), joints[5].getX(), joints[5].getY(), joints[5].getZ()));
  //float b3 = abs(dist(joints[5].getX(), joints[5].getY(), joints[5].getZ(), joints[4].getX(), joints[4].getY(), joints[4].getZ()));
  //float c3 = abs(dist(joints[4].getX(), joints[4].getY(), joints[4].getZ(), joints[20].getX(), joints[20].getY(), joints[20].getZ()));
  //float cosa3 = (b3*b3+c3*c3-a3*a3)/(2*b3*c3);
  //float degree3 = degrees(acos(cosa3));
  //println("Shoulder left degree = " +degree3);
  //popMatrix();
  //text("Shoulder left degree", 150, 30);
  //text(degree3, 150, 50);

  //pushMatrix();///////////////Shoulder right
  //translate(joints[8].getX(), joints[8].getY(), joints[8].getZ());
  //float A3 = abs(dist(joints[20].getX(), joints[20].getY(), joints[20].getZ(), joints[9].getX(), joints[9].getY(), joints[9].getZ()));
  //float B3 = abs(dist(joints[9].getX(), joints[9].getY(), joints[9].getZ(), joints[8].getX(), joints[8].getY(), joints[8].getZ()));
  //float C3 = abs(dist(joints[8].getX(), joints[8].getY(), joints[8].getZ(), joints[20].getX(), joints[20].getY(), joints[20].getZ()));
  //float cosA3 = (B3*B3+C3*C3-A3*A3)/(2*B3*C3);
  //float deGree3 = degrees(acos(cosA3));
  //println("Shoulder right degree = " +deGree3);
  //popMatrix();
  //text("Shoulder right degree", 150, 80);
  //text(degree3, 150, 100);
  ////println("elbowX = " +joints[9].getX());
  ////println("elbowY = " +joints[9].getY());
  ////println("shoulderZ = " +joints[8].getZ());
  ////println("elbowZ = " +joints[9].getZ());
  ////println("wristZ = " +joints[10].getZ());
  
  

  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_SpineShoulder);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);

  drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);

  // Right Arm    
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ThumbRight);

  // Left Arm
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);

  // Left Leg
  drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);

  drawJoint(joints, KinectPV2.JointType_HandTipLeft);
  drawJoint(joints, KinectPV2.JointType_HandTipRight);
  drawJoint(joints, KinectPV2.JointType_FootLeft);
  drawJoint(joints, KinectPV2.JointType_FootRight);

  drawJoint(joints, KinectPV2.JointType_ThumbLeft);
  drawJoint(joints, KinectPV2.JointType_ThumbRight);

  drawJoint(joints, KinectPV2.JointType_Head);
}

void drawJoint(KJoint[] joints, int jointType) {
  //strokeWeight(2.0f + joints[jointType].getZ()*8);
  //point(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
}

void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  //strokeWeight(2.0f + joints[jointType1].getZ()*8);
  //point(joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

void drawHandState(KJoint joint) {
  //handState(joint.getState());
  //strokeWeight(5.0f + joint.getZ()*8);
  //point(joint.getX(), joint.getY(), joint.getZ());
  noStroke();
  handState(joint.getState(), joint);
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  //print("x = " + joint.getX() + " " + joint.getY() + " " + joint.getZ());
  //print("\n");
  ellipse(0, 0, 70, 70);
  popMatrix();
}
void write(KJoint joint){
  float x=0;
  float y = 0;
  //if(handver == true){
  x = joint.getX();
  y = joint.getY();
  //handver = false;
  //}
  if(0<=x && x<60 && 150<=y && y<187.5) text = (numberver) ? "1" : "q";
  else if(60<x && x<120 && 150<y && y<187.5) text = (numberver) ? "2" : "w";
  else if(120<x && x<180 && 150<y && y<187.5) text = (numberver) ? "3" : "e";
  else if(180<x && x<240 && 150<y && y<187.5) text = (numberver) ? "4" : "r";
  else if(240<x && x<300 && 150<y && y<187.5) text = (numberver) ? "5" : "t";
  else if(300<x && x<360 && 150<y && y<187.5) text = (numberver) ? "6" : "y";
  else if(360<x && x<420 && 150<y && y<187.5) text = (numberver) ? "7" : "u";
  else if(420<x && x<480 && 150<y && y<187.5) text = (numberver) ? "8" : "i";
  else if(480<x && x<540 && 150<y && y<187.5) text = (numberver) ? "9" : "o";
  else if(540<x && x<=600 && 150<y && y<187.5) text = (numberver) ? "0" : "p";
  else if(30<x && x<90 && 187.5<y && y<225) text = "a";
  else if(90<x && x<150 && 187.5<y && y<225) text = "s";
  else if(150<x && x<210 && 187.5<y && y<225) text = "d";
  else if(210<x && x<270 && 187.5<y && y<225) text = "f";
  else if(270<x && x<330 && 187.5<y && y<225) text = "g";
  else if(330<x && x<390 && 187.5<y && y<225) text = "h";
  else if(390<x && x<450 && 187.5<y && y<225) text = "j";
  else if(450<x && x<510 && 187.5<y && y<225) text = "k";
  else if(510<x && x<570 && 187.5<y && y<225) text = "l";
  else if(30<x && x<90 && 225<y && y<262.5) text = "capslock";
  else if(90<x && x<150 && 225<y && y<262.5) text = "z";
  else if(150<x && x<210 && 225<y && y<262.5) text = "x";
  else if(210<x && x<270 && 225<y && y<262.5) text = "c";
  else if(270<x && x<330 && 225<y && y<262.5) text = "v";
  else if(330<x && x<390 && 225<y && y<262.5) text = "b";
  else if(390<x && x<450 && 225<y && y<262.5) text = "n";
  else if(450<x && x<510 && 262.5<y && y<=300) text = "m";
  else if(510<x && x<570 && 262.5<y && y<=300) text = "back";
  else if(2<x && x<82 && 262.5<y && y<=300) text = "number";
  else if(102<x && x<182 && 262.5<y && y<=300) text = "language";
  else if(202<x && x<282 && 262.5<y && y<=300) text = "china";
  else if(302<x && x<482 && 262.5<y && y<=300) text = " ";
  else if(502 <x && x<598 && 262.5<y && y<=300) text = "return";
  //fill(255,0,0);
  //text("ok",420,80);
  if(text.equals("back")){
    if(log_pw){
      if(id.length() != 0){
        //stIndex-=10;
        id.deleteCharAt(id.length()-1);
        //text("",idIndex,80);
      }
    }else{
      if(pw.length() != 0 ){
        pw.deleteCharAt(id.length()-1);
      }
      //text("",pwIndex+255,125);
    }
      
    
  }else if(text.equals("number")){
    numberver = (numberver) ? false : true;
  }else if(text.equals("language")){
    
  }else if(text.equals("china")){
    
  }else if(text.equals("return")){
    
  }else if(text.equals("capslock")){
    
  }else {
    if(log_pw){
      if(id.length()>8){
        //limit count
      }else{
        fill(255,0,0);
        id.append(text);
        id_s = id.toString();
      }
    }else{
      if(pw.length()>8){
       // limit count
      }else{
        fill(255,0,0);
        pw.append(text);
        id_s = id.toString();
      }
    }
  }   
  
}
void login(KJoint joint){
  float x=0;
  float y = 0;

  x = joint.getX();
  y = joint.getY();

  if(192.8571428571428<x && x<407.1428571428572 && 207<y && y<243){
    dbConnect();
    
  }

}
void handState(int handState, KJoint joint) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    handopen = true;
    fill(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    println("x = " + joint.getX() + " y = " + joint.getY() + " " + joint.getZ());
    
      
    //pw x >225  x<415 y>
    //id
    if(handopen){
      handclose = true;
    }
    
    write(joint);
    fill(255, 0, 0);
    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    fill(100, 100, 100);
    break;
  }
}

void dbConnect(){
  String user = "smarthealth";
  String pass = "smarthealth";
  String dbHost = "smarthealth.cmyoepxrxtwp.us-east-2.rds.amazonaws.com";
  String database = "smarthealth";
  msql = new MySQL(this, dbHost,database, user, pass);
  if(msql.connect())
  {
    msql.query("SELECT id(*) FROM mirror");
    
    boolean log_overlap = false;
    while(msql.next()){
      String s = msql.getString("id");
      if(s.equals(id.toString()) || id_s.length()<4){
        //warning overlap
        //showMessageDialog(null, "Duplicate ID", "Alert", ERROR_MESSAGE);
        MsgBox("Duplicate ID", "ERROR");
        break;
      }else{
        msql.execute("INSERT INTO mirror(id, password) VALUES (\""+id.toString()+"\",\""+pw.toString()+"\");");
        login.setup();

      }
    }
    
  }
  else
  {
    println("FAIL");
  }
  
}
void mousePressed() {
  if(192.8571428571428<mouseX && mouseX<407.1428571428572 && 207<mouseY && mouseY<243) 
   //if(id_s.length()<4){
   //     //warning overlap
   //     //showMessageDialog(null, "Duplicate ID", "Alert", ERROR_MESSAGE);
   //     MsgBox("Duplicate ID", "ERROR");
   //} else{
     login.setup();
   //}
  if ((225< mouseX && mouseX <415) && (80< mouseY && mouseY <160)) {

    Click=true;
  } else if (Click==true && (0< mouseY && mouseY< 150) && ((0< mouseX && mouseX<180) || (420<mouseX && mouseX<600))) {

    Click=false;
  } else if (Click==true &&(180<mouseX&&mouseX<420) && (0<mouseY && mouseY<48)) {
    Click=false;
  }
}
void MsgBox( String Msg, String Titel ){

 javax.swing.JOptionPane.showMessageDialog ( null, Msg, Titel, javax.swing.JOptionPane.INFORMATION_MESSAGE  );
 
}
