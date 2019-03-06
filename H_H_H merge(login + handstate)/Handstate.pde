class Handstate {

  boolean handopen;
  boolean handclose;
  //ArrayList<KSkeleton> skeletonArray;
  //KSkeleton skeleton;
  

  Handstate() {
    
    handopen = true;
    handclose = false;

    //skeletonArray = new ArrayList<KSkeleton>();
  }

  boolean handState(int handState) {
    //int handState=5;
    
    //skeletonArray = kinect.getSkeletonColorMap();
    ////println(skeletonArray.size());
    //for (int i=0; i<skeletonArray.size(); i++) {
    //  //println("hand");
    //  skeleton = (KSkeleton) skeletonArray.get(i);

    //  if (skeleton.isTracked()) {
    //    KJoint joints[] = skeleton.getJoints();

    //    //draw different color for each hand state
    //    handState= joints[11].getState();
    //    joint = joints[11];
        
    //    //println(joints[11].getX());


    //    //Draw body
    //    color col  = skeleton.getIndexColor();
    //    fill(col);
    //    stroke(col);
        
    //    //drawHandState(joints[11]);
    //  }
    //}

    println(handState);
    switch(handState) {
    case KinectPV2.HandState_Open:
      handopen = true;
      handclose= false;
      fill(0, 255, 0);
      
      //println("open=== xx = "+joint.getX()+"yy = "+joint.getY());
      break;
      
    case KinectPV2.HandState_Closed:

      println("close");
      //pw x >225  x<415 y>
      //id
      //println("close=== xx = "+joint.getX()+"yy = "+joint.getY());
      fill(255, 0, 0);
      if (handopen && !handclose) {
        handclose = true;
        //println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
        return handclose;
      }

      //write(joint);
      
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

  boolean drawHandState(KJoint abcd) {
    //handState(joint.getState());
    //strokeWeight(5.0f + joint.getZ()*8);
    //point(joint.getX(), joint.getY(), joint.getZ());
    //KJoint joint2 = joint;
    noStroke(); 
    
    if(handState(abcd.getState())){
      return true;
    }
    //handState();
    pushMatrix();
    translate(abcd.getX(), abcd.getY());
    //print("x = " + joint.getX() + " " + joint.getY() + " " + joint.getZ());
    //print("\n");
    ellipse(0, 0, 70, 70);
    popMatrix();
    return false;
  }
}
