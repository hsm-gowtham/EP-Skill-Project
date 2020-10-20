<%@ page import="java.sql.*" %>
<%
String uname = (String)session.getAttribute("emp_uname");
out.println(uname);
try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:mysql://aak53meswtq4lo.ctkvrapz1owu.us-east-1.rds.amazonaws.com:3306/ebdb", "balugowtham", "mega789753");  
	 System.out.println("Connection Established");	  
	  PreparedStatement pstmt = con.prepareStatement("select reason from request where username=?");
	  pstmt.setString(1,uname);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		  out.println("your Previous request is : "+rs.getString(1));
	  }
	  else
	  {
		  out.println("you have no pending requests...");
	  }
}
catch(Exception e)
{
	out.println(e);
}
%>