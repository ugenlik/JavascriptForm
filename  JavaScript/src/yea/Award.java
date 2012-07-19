package yea;

import java.io.Serializable;
import java.sql.*;

public class Award implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String name = null;
	private String description = null;
	private String submitter = null;
	private String recipient = null;
	
	private Connection connection=null;
    private final String connectionURL = "jdbc:mysql://localhost:3306/alti";
    private final String dbUser = "alti";
    private final String dbPass = "56978100";
    
    
    public Award(String name, String description, String submitter, String recipient){
    	this.name = name;
    	this.description = description;
    	this.submitter = submitter;
    	this.recipient = recipient;
    }
    
	public void insert()
	{
		try {
		  Class.forName("com.mysql.jdbc.Driver");
		  connection = DriverManager.getConnection(connectionURL, dbUser, dbPass);
	      String sql = "insert into Awards(name, description, submitter, recipient)  values('" + name + "', '" + description + "', '" + submitter + "', '" + recipient + "')";
	      Statement s = connection.createStatement();
	      s.executeUpdate (sql);
	      s.close (); 
		}catch(Exception e){
		  System.out.println("Exception is (connection)" + e);
		  e.printStackTrace();
		}
	}
}
