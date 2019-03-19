class Exercise_process {

  float zVal;
  float rotX;
  float currentAngle;
  float previousAngle;
  int count1;
  int count2;
  int totalCount;
  boolean result;

  int presentTime, totalTime, healthTime, restTime;

  Exercise_process() {

    zVal = 300;
    rotX = PI;
    currentAngle=0;
    previousAngle=0;
    count1=0;
    count2=0;
    totalCount=0;
    result = true;
    presentTime= millis();
  }


  void time() {
    
    ///////// do get
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

    if (result==true) {
      if (degree1<40) {
        result=false;
      }
    }
    if (result==false) {
      if (degree1>160) {
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
    if (degree1>0) {
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

  //void login(KJoint joint) {
  //  float x=0;
  //  float y = 0;

  //  x = joint.getX();
  //  y = joint.getY();

  //  if (192.8571428571428<x && x<407.1428571428572 && 207<y && y<243) {


  //    dbConnect();
  //  }
  //}
}
