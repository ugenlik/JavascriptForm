package yea;

import java.io.*;
import netscape.ldap.*;
import netscape.ldap.util.*;

public class Util {
	
	private String ldifPath;
	
	public Util(String ldifPath){
		this.ldifPath = ldifPath;
	}
	
	public boolean checkLogin(String username, String password){
		String usernameFound = null;
		String passwordFound = null;
		try {
		    // Parse the LDIF file test.ldif.
		    LDIF parser = new LDIF( ldifPath );
		    // Iterate through each LDIF record in the file.
		    LDIFRecord nextRec = parser.nextRecord();
		    while ( nextRec != null ) {
		        // Based on the type of content in the record,
		        // get the content and cast it as the appropriate
		        // type.
		        if( nextRec.getContent().getType() == LDIFContent.ATTRIBUTE_CONTENT ) {
		            	LDIFAttributeContent attrContent =
		                    (LDIFAttributeContent)nextRec.getContent();
		                
		                LDAPAttribute[] attributes = attrContent.getAttributes();
		                for(LDAPAttribute attr : attributes)
		                {
		                	if(attr.getName().equals("uid"))
		                	{
		                		usernameFound = attr.getStringValueArray()[0];
		                	}else if(attr.getName().equals("userpassword"))
		                	{
		                		passwordFound = attr.getStringValueArray()[0];
		                	}
		                }
		                if(username.equals(usernameFound) && password.equals(passwordFound))
		                {
		                	return true;
		                }
		        }
		        // Iterate through each record.
		        nextRec = parser.nextRecord();
		    }
		} catch ( IOException e ) {
		    System.out.println( "Error: " + e.toString() );
		    System.exit(1);
		}
		
		return false;
	}
}
