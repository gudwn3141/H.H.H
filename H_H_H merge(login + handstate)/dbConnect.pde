class dbConnect {

  dbConnect() {
  }

  void Connect() {

    if (msql.connect())
    {
      msql.query("SELECT id(*) FROM mirror");

      //boolean log_overlap = false;
      while (msql.next()) {
        String s = msql.getString("id");
        if (s.equals(id_s) || id_s.length()<4 || pw_s.length()<4) {
          //warning overlap
          //showMessageDialog(null, "Duplicate ID", "Alert", ERROR_MESSAGE);
          //MsgBox("Duplicate ID", "ERROR");
          break;
        } else {
          msql.execute("INSERT INTO mirror(id, password) VALUES (\""+id_s+"\",\""+pw_s+"\");");
          login.display();
        }
      }
    } else
    {
      println("FAIL");
    }
  }
}
