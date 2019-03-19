class skeleton_depth {
  boolean handopen;
  boolean handclose;
  float xpos;
  float ypos;
  skeleton_depth() {
    xpos = 0.0;
    ypos = 0.0;
    handopen = false;
    handclose = true;
  }

  void recog() {

    //image(kinect.getColorImage(), 0, 0);
    //image(kinect.getDepthMaskImage(),  0);

    //get the skeletons as an Arraylist of KSkeletons
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();

    //individual joints
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      //if the skeleton is being tracked compute the skleton joints
      if (skeleton.isTracked()) {
        KJoint[] joints = skeleton.getJoints();

        color col  = skeleton.getIndexColor();
        fill(col);
        stroke(col);

        //drawBody(joints);
        drawHandState(joints[KinectPV2.JointType_HandRight]);
        //drawHandState(joints[KinectPV2.JointType_HandLeft]);
      }
    }
  }
  void drawBody(KJoint[] joints) {

    pushMatrix();
    translate(joints[9].getX(), joints[9].getY(), joints[9].getZ());
    float a = abs(dist(joints[10].getX(), joints[10].getY(), joints[10].getZ(), joints[8].getX(), joints[8].getY(), joints[8].getZ()));
    float b = abs(dist(joints[8].getX(), joints[8].getY(), joints[8].getZ(), joints[9].getX(), joints[9].getY(), joints[9].getZ()));
    float c = abs(dist(joints[9].getX(), joints[9].getY(), joints[9].getZ(), joints[10].getX(), joints[10].getY(), joints[10].getZ()));
    float cosa = (b*b+c*c-a*a)/(2*b*c);
    float degree = degrees(acos(cosa));
    println("degree = " +degree);
    popMatrix();

    println("elbowX = " +joints[9].getX());
    println("elbowY = " +joints[9].getY());
    println("shoulderZ = " +joints[8].getZ());
    println("elbowZ = " +joints[9].getZ());
    println("wristZ = " +joints[10].getZ());
    text(degree, 50, 50);
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

    //Single joints
    drawJoint(joints, KinectPV2.JointType_HandTipLeft);
    drawJoint(joints, KinectPV2.JointType_HandTipRight);
    drawJoint(joints, KinectPV2.JointType_FootLeft);
    drawJoint(joints, KinectPV2.JointType_FootRight);

    drawJoint(joints, KinectPV2.JointType_ThumbLeft);
    drawJoint(joints, KinectPV2.JointType_ThumbRight);

    drawJoint(joints, KinectPV2.JointType_Head);
  }

  //draw a single joint
  void drawJoint(KJoint[] joints, int jointType) {
    pushMatrix();
    translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
    ellipse(0, 0, 25, 25);
    popMatrix();
  }

  //draw a bone from two joints
  void drawBone(KJoint[] joints, int jointType1, int jointType2) {
    pushMatrix();
    translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
    ellipse(0, 0, 25, 25);
    popMatrix();
    line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
  }

  //draw a ellipse depending on the hand state
  void drawHandState(KJoint joint) {
    noStroke();
    xpos = joint.getX();
    ypos = joint.getY();
    handState(joint.getState());
    pushMatrix();
    float xpos1 = map(xpos,0,514,0,600);
    float ypos1 = map(ypos,0,424,0,300);
    translate(xpos1, ypos1, joint.getZ());
    ellipse(0, 0, 30, 30);
    popMatrix();
  }

  /*
Different hand state
   KinectPV2.HandState_Open
   KinectPV2.HandState_Closed
   KinectPV2.HandState_Lasso
   KinectPV2.HandState_NotTracked
   */

  //Depending on the hand state change the color
  void handState(int handState) {
    switch(handState) {

    case KinectPV2.HandState_Open:
      handopen = true;
      handclose= false;

      fill(0, 255, 0);
      break;
    case KinectPV2.HandState_Closed:
      handopen = true;
      if (handopen && !handclose) {
        handopen =false;
        handclose = true;
      }
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
}
