import de.bezier.data.sql.*;

MySQL msql;

void setup()
{
  size(500, 500);
  
  String user = "smarthealth";
  String pass = "smarthealth";
  String dbHost = "smarthealth.cmyoepxrxtwp.us-east-2.rds.amazonaws.com";
  String database = "smarthealth";
  msql = new MySQL(this, dbHost,database, user, pass);
  if(msql.connect())
  {
    String id = "jun";
    String pw = "jun";
    int age = 25;
    
    
    msql.execute("INSERT INTO mirror(id, password, age) VALUES (\""+id+"\",\""+pw+"\","+age+");");
    
  }
  else
  {
    println("FAIL");
  }
}

void draw()
{
  
  
}
