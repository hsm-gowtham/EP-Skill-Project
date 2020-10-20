<%@ page import="java.sql.*" %>
<%

String username = request.getParameter("uname");
String password = request.getParameter("pwd");
session.setAttribute("uname", username);
try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:mysql://aak53meswtq4lo.ctkvrapz1owu.us-east-1.rds.amazonaws.com:3306/ebdb", "balugowtham", "mega789753");  
	 System.out.println("Connection Established");
	  
	  PreparedStatement pstmt = con.prepareStatement("select * from employee where username=? and password=?");
	  pstmt.setString(1,username);
	  pstmt.setString(2,password);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		 response.sendRedirect("home.html");
                
                
	  
          }
          
	  else
	  {
		  %>
			<h3>LOGIN FAILED</h3><br>

			<% 
	  }
}
catch(Exception e)
{
	out.println(e);
}
%>