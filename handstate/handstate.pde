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

KinectPV2 kinect;
StringBuffer id = new StringBuffer();
StringBuffer pw = new StringBuffer();
//Stack<Float> st = new Stack<Float>();
int stIndex = 0;
boolean handver = false;
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

void setup() {
  size(512, 424, P3D);

  kinect = new KinectPV2(this);
  //kinect.enableColorImg(true);
  kinect.enableDepthMaskImg(true);

  kinect.enableSkeletonDepthMap(true);

  //enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
  
  presentTime= millis();
}

void draw() {
  background(0);

  //image(kinect.getColorImage(), 0, 0);
  //image(kinect.getDepthMaskImage(), 0, 0);

  //translate the scene to the center 
  //pushMatrix();
  //translate(width/2, height/2, 0);
  //scale(zVal);
  //rotateX(rotX);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();

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
      drawBody(joints);
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
      
      int passedTime= millis()- presentTime;
      healthTime+= passedTime;
    }
  }
  //popMatrix();
  presentTime= millis();

  totalTime= millis();

  restTime= totalTime- healthTime;
  println("restTime = " +restTime);
  //println("healthtime = " +healthTime);
  fill(255, 0, 0);
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
  println("Dumb-bell degree = " +degree1);
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
  println("totalcount = " +totalCount);
  
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
  handState(joint.getState(),joint);
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, 70, 70);
  popMatrix();
}
void write(int handState, KJoint joint){
  float x=0;
  float y = 0;
  if(handState == KinectPV2.HandState_Closed && handver == true){
    x = joint.getX();
    y = joint.getY();
    handver = false;
  }
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
  if(text.equals("back")){
    if(stIndex>0){
      stIndex-=10;
      id.deleteCharAt(id.length()-1);
      text("",stIndex+255,80);
      //pw.deleteCharAt(id.length()-1);
      //text("",stIndex+255,125);
    }
  }else if(text.equals("number")){
    numberver = (numberver) ? false : true;
  }else if(text.equals("language")){
    
  }else if(text.equals("china")){
    
  }else if(text.equals("return")){
    
  }else if(text.equals("capslock")){
    
  }else {
    if(stIndex+255>420){
      //limit count
    }else{
      text(text,stIndex+255,80);
      id.append(text);
      
      //text(text,stIndex+255,125);
      //pw.append(text);
      
      stIndex+=10;
    }
  }
}
void handState(int handState, KJoint joint) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    stroke(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    handver = true;
    stroke(255, 0, 0);
    break;
  case KinectPV2.HandState_Lasso:
    stroke(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    stroke(100, 100, 100);
    break;
  }
}
