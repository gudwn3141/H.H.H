import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;
import de.bezier.data.sql.*;


Log_in login;
Exercise_process exercise;
Handstate handstate;
Menu menu;
dbConnect connect;
MySQL msql;
skeleton_depth skeletonDepth;

boolean Click;
boolean id_pass;
int scene_number;
//String id_s;
//String pw_s;

String user;
String pass;
String dbHost;
String database;



String table;

KinectPV2 kinect;


void setup() {

  size(600, 900, P3D);
  login= new Log_in();
  exercise= new Exercise_process();
  handstate= new Handstate();
  menu= new Menu();
  connect= new dbConnect();
  skeletonDepth= new skeleton_depth();

  user = "smarthealth";
  pass = "smarthealth";
  dbHost = "smarthealth.cmyoepxrxtwp.us-east-2.rds.amazonaws.com";
  database = "smarthealth";


  msql = new MySQL(this, dbHost, database, user, pass);


  kinect = new KinectPV2(this);
  kinect.enableDepthMaskImg(true);
  kinect.enableSkeletonDepthMap(true);
  kinect.enableSkeleton3DMap(true);
  //kinect.enableColorImg(true);

  scene_number = 0;


  table = "mirror";

  //  kinect.enableSkeletonColorMap(true);
  //  kinect.enableColorImg(true);
  //  kinect.enableSkeleton3DMap(true);

  kinect.init();

  Click= false;

  id_pass= true;

  //id_s = "";
  //pw_s = "";
}

void draw() {

  background(0);

  // skeletonDepth.recog();
  if (scene_number==0) {
    login.display();

    login.move();

    // println(mouseX+ " " +mouseY);



    skeletonDepth.recog();

    textAlign(CORNER, CENTER);//////////////////////////////////////////re try
    text(login.id_s, login.idIndex, height/5.5-height/11+25+login.Yspeed/6);
    text(login.pw_s, login.pwIndex, height/5.5-height/23+25+login.Yspeed/6);

    //image(kinect.getDepthMaskImage(), 0, 0, 600, 300);
  } else if (scene_number==1) {
    menu.display();
  }
  //handstate.handState();

  //login.display();
  //exercise.display();
  //login.move();

  //login.move();

  //menu.display();


  //println("X:"+mouseX+"Y:"+mouseY+"Click:"+Click+"Accel:"+Accelerate+"Yspeed:"+Yspeed);
}

//void mousePressed() {

//  ///////////////////////////////////////////////////////////////////////////revise essential

//  if ((225< mouseX && mouseX <415) && (80< mouseY && mouseY <160)) {

//    Click=true;
//    if ((225< mouseX && mouseX <415) && (50< mouseY && mouseY <92)) {
//      id_pass=false;
//    } else if ((225< mouseX && mouseX <415) && (96< mouseY && mouseY <135)) {
//      id_pass=true;
//    }
//  } else if (Click==true && (0< mouseY && mouseY< 150) && ((0< mouseX && mouseX<180) || (420<mouseX && mouseX<600))) {

//    Click=false;
//  } else if (Click==true &&(180<mouseX&&mouseX<420) && (0<mouseY && mouseY<48)) {
//    Click=false;
//  }
//}
