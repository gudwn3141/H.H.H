import KinectPV2.KJoint;
import KinectPV2.*;
KinectPV2 kinect;
float zVal = 300;
float rotX = PI;
int totalCount=0;
boolean result = true;
int presentTime;
int totalTime;
int healthTime;
int restTime;

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
  
  println("totalcount = " +totalCount);
  
  
  pushMatrix();///////////////Push-up left
  translate(joints[5].getX(), joints[5].getY(), joints[5].getZ());
  float a2 = abs(dist(joints[4].getX(), joints[4].getY(), joints[4].getZ(), joints[6].getX(), joints[6].getY(), joints[6].getZ()));
  float b2 = abs(dist(joints[6].getX(), joints[6].getY(), joints[6].getZ(), joints[5].getX(), joints[5].getY(), joints[5].getZ()));
  float c2 = abs(dist(joints[5].getX(), joints[5].getY(), joints[5].getZ(), joints[4].getX(), joints[4].getY(), joints[4].getZ()));
  float cosa2 = (b2*b2+c2*c2-a2*a2)/(2*b2*c2);
  float degree2 = degrees(acos(cosa2));
  println("Push-up left degree = " +degree2);
  popMatrix();
  text("Push-up left degree", 100, 30);
  text(degree2, 100, 50);
  pushMatrix();///////////////Push-up right
  translate(joints[9].getX(), joints[9].getY(), joints[9].getZ());
  float A2 = abs(dist(joints[8].getX(), joints[8].getY(), joints[8].getZ(), joints[10].getX(), joints[10].getY(), joints[10].getZ()));
  float B2 = abs(dist(joints[10].getX(), joints[10].getY(), joints[10].getZ(), joints[9].getX(), joints[9].getY(), joints[9].getZ()));
  float C2 = abs(dist(joints[9].getX(), joints[9].getY(), joints[9].getZ(), joints[8].getX(), joints[8].getY(), joints[8].getZ()));
  float cosA2 = (B2*B2+C2*C2-A2*A2)/(2*B2*C2);
  float deGree2 = degrees(acos(cosA2));
  println("Push-up right degree = " +deGree2);
  popMatrix();
  text("Push-up right degree", 100, 80);
  text(degree2, 100, 100);
  
  
  ////////////////push-up
  if(result==true){
    if(degree2<60){
      result=false;
    }
  }
  if(result==false){
    if(degree2>160){
      totalCount++;
      result=true;
    }
  }
  
  
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
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, 70, 70);
  popMatrix();
}
void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    stroke(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
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
