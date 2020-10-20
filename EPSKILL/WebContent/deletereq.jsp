<%@ page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:mysql://aak53meswtq4lo.ctkvrapz1owu.us-east-1.rds.amazonaws.com:3306/ebdb", "balugowtham", "mega789753");  
System.out.println("Connection Established");
String uname = (String) session.getAttribute("emp_uname");
PreparedStatement pstmt = con.prepareStatement("delete from request where username=?");
pstmt.setString(1, uname);
int n=pstmt.executeUpdate();
if(n>0)
{
	%><a href = "Viewrequest_leader.jsp">back to leader view page</a> <%
}
%>