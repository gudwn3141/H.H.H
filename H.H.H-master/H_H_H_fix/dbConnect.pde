class dbConnect {

  float savedTime;  
  PFont myFont;

  dbConnect() {

    //savedTime= millis();


    myFont= loadFont("CalistoMT-48.vlw");
  }

  void login() {
    String table = "mirror";




    if (msql.connect()) {

      msql.query("SELECT id FROM "+table);
      boolean check = false;
      //boolean log_overlap = false;
      while (msql.next()) {
        String s = msql.getString("id");
        println("s = "+s);
        if (s.equals(login.id_s) && login.id_s.length()>=4 && login.pw_s.length()>=4) {

          scene_number = 1;
          check = true;
          //warning overlap
          //showMessageDialog(null, "Duplicate ID", "Alert", ERROR_MESSAGE);
          //MsgBox("Duplicate ID", "ERROR");
          break;
        }
      }


      if (!check) {
        float passedTime= millis();
        float totalTime = millis()+5000;

        
        println(passedTime);
        println("why not??");

        while (passedTime<totalTime) {
          passedTime =millis();
          println("why not2??");

          fill(255, 0, 0);
          textFont(myFont, 60);
          text("Wrong Information!!!!!!", width/2, 150);
          //savedTime= millis();
        } 



        println(passedTime);

        //if(passedTime>totalTime){

        //  text("Wrong Information!!!!!!", 80,80);
        //}
      }
    } else {
      println("FAIL");
    }
  }


  void register() {

    if (msql.connect())
    {
      msql.query("SELECT id(*) FROM mirror");

      //boolean log_overlap = false;
      while (msql.next()) {
        String s = msql.getString("id");
        if (s.equals(login.id_s) || login.id_s.length()<4 || login.pw_s.length()<4) {












          //warning overlap
          //showMessageDialog(null, "Duplicate ID", "Alert", ERROR_MESSAGE);
          //MsgBox("Duplicate ID", "ERROR");
          break;
        } else {
          msql.execute("INSERT INTO mirror(id, password) VALUES (\""+login.id_s+"\",\""+login.pw_s+"\");");
          //menu.display();
        }
      }
    } else
    {
      println("FAIL");
    }
  }
}
