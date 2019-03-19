class Handstate {

  boolean handopen;
  boolean handclose;
  ArrayList<KSkeleton> skeletonArray;
  KSkeleton skeleton;


  Handstate() {

    handopen = false;
    handclose = false;

    skeletonArray = new ArrayList<KSkeleton>();


    for (int i=0; i<skeletonArray.size(); i++) {
      skeleton = (KSkeleton) skeletonArray.get(i);
    }
  }

  boolean handState() {

    int handState=0;

    if (skeleton.isTracked()) {
      KJoint joints[] = skeleton.getJoints();

      //draw different color for each hand state
      handState= joints[0].getState();

      drawHandState(joints[0]);


      //Draw body
      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
    }

    switch(handState) {
    case KinectPV2.HandState_Open:
      handopen = true;
      handclose= false;
      fill(0, 255, 0);
      break;
    case KinectPV2.HandState_Closed:


      //pw x >225  x<415 y>
      //id
      if (handopen && !handclose) {
        handclose = true;

        return handclose;
      }

      //write(joint);
      fill(255, 0, 0);
      break;

      //case KinectPV2.HandState_Lasso:
      //  fill(0, 0, 255);
      //  break;
      //case KinectPV2.HandState_NotTracked:
      //  fill(100, 100, 100);
      //  break;
    }
    return false;
  }

  void drawHandState(KJoint joint) {
    //handState(joint.getState());
    //strokeWeight(5.0f + joint.getZ()*8);
    //point(joint.getX(), joint.getY(), joint.getZ());
    noStroke();    
    pushMatrix();
    translate(joint.getX(), joint.getY(), joint.getZ());
    //print("x = " + joint.getX() + " " + joint.getY() + " " + joint.getZ());
    //print("\n");
    ellipse(0, 0, 70, 70);
    popMatrix();
  }
}
