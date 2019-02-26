import de.bezier.data.sql.*;

MySQL msql;

void setup()
{
  size(500, 500);
  
  //String user = "smarthealth";
  //String pass = "smarthealth";
  //String dbHost = "smarthealth.cmyoepxrxtwp.us-east-2.rds.amazonaws.com";
  //String database = "smarthealth";
  //msql = new MySQL(this, dbHost,database, user, pass);
  //if(msql.connect())
  //{
  //  String id = "jun";
  //  String pw = "jun";
  //  int age = 25;
    
    
  //  msql.execute("INSERT INTO mirror(id, password, age) VALUES (\""+id+"\",\""+pw+"\","+age+");");
    
  //}
  //else
  //{
  //  println("FAIL");
  //}
}

void draw()
{
  String user = "smarthealth";
  String pass = "smarthealth";
  String dbHost = "smarthealth.cmyoepxrxtwp.us-east-2.rds.amazonaws.com";
  String database = "smarthealth";
  msql = new MySQL(this, dbHost,database, user, pass);
  if ( msql.connect() )
  {
      
      msql.query( "SELECT id FROM mirror" );
      while(msql.next())
      {
       String s = msql.getString("id"); 
       println(s);
      }
      //msql.next();
      //println( "number of rows: " + msql.getInt(1) );
  }
  else
  {
      // connection failed !
  }
  
}
